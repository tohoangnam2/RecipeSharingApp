//
//  SetupDatailViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 30/5/25.
//

import UIKit

class SetupDatailViewController: UIViewController {

  @IBOutlet weak var profileImageView: UIImageView!

  @IBOutlet weak var nameTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()

    checklogin()
    setupUserData()

    //su kien an ban phim
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)

    //su kien doi anh
    profileImageView.isUserInteractionEnabled = true
    let tap = UITapGestureRecognizer(target: self, action: #selector(didTapChangeImage))
            profileImageView.addGestureRecognizer(tap)

  }

  @objc private func didTapChangeImage() {
          let picker = UIImagePickerController()
          picker.delegate = self
          picker.sourceType = .photoLibrary
          present(picker, animated: true)
      }

  func setupUserData() {
    guard let currentUser = SessionManager.shared.currentUser else { return }
    nameTextField.text = currentUser.name

    if let imageData = currentUser.profileImage {
      profileImageView.image = UIImage(data: imageData)
    }
  }

  func checklogin(){
    if let user = SessionManager.shared.currentUser {
      print("Tên: \(user.name ?? "")")
      print("Email: \(user.email ?? "")")
      print("phone: \(user.phone ?? "")")
      print("pass: \(user.password ?? "")")
    }
  }
  // MARK: - Ẩn bàn phím khi chạm ngoài
  @objc func dismissKeyboard() {
      view.endEditing(true)
  }

  @IBAction func didTapSetup(_ sender: Any) {
    guard let user = SessionManager.shared.currentUser,
                let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      showAlert(title: "Không tìm thấy người dùng")
              return
          }

          let context = appDelegate.persistentContainer.viewContext
          user.name = nameTextField.text

          if let image = profileImageView.image,
             let data = image.jpegData(compressionQuality: 0.8) {
              user.profileImage = data
          }

          do {
              try context.save()
            showAlert(title: "Cập nhật thành công!"){
              // Chuyển sang màn hình tiếp theo, ví dụ Home
              self.push(viewControllerType: HomeViewController.self)
            }
          } catch {
            showAlert(title: "Lỗi khi lưu dữ liệu.")
          }
  }
  // MARK: - Hiện Alert
  func showAlert(title: String, completion: (() -> Void)? = nil) {
      let alert = UIAlertController(title: nil, message: title, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
          // Chờ 0.3s sau khi Alert đóng hẳn rồi mới push
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
              completion?()
          }
      })
      present(alert, animated: true)
  }

}
extension SetupDatailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true)
    if let image = info[.originalImage] as? UIImage {
      profileImageView.image = image
    }
  }
}

