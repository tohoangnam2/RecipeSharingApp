//
//  LoginViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 22/5/25.
//

import UIKit
import CoreData
import Security
import Foundation

class LoginViewController: UIViewController,UITextFieldDelegate {

  @IBOutlet weak var scrollviewLogin: UIScrollView!

  @IBOutlet weak var emailLoginTextF: UITextField!
  
  @IBOutlet weak var emailLoginLabel: UILabel!


  @IBOutlet weak var passLoginTextF: UITextField!
  

  override func viewDidLoad() {
        super.viewDidLoad()

      // Bắt sự kiện bàn phím
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

      // Tap Gesture để ẩn bàn phím
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
      view.addGestureRecognizer(tapGesture)

      // Gán delegate cho các TextField
      assignDelegatesToTextFields(in: view)

      setupTextfield()
    }
  deinit {
      NotificationCenter.default.removeObserver(self)
  }
  func setupTextfield(){
    emailLoginLabel.alpha = 0
    emailLoginTextF.setPlaceholder("Email")
    passLoginTextF.setPlaceholder("Password")
  }

  // MARK: - Bàn phím show
  @objc func keyboardWillShow(notification: Notification) {
      guard let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }

      let keyboardHeight = keyboardFrame.height

    scrollviewLogin.contentInset.bottom = keyboardHeight + 20
    scrollviewLogin.scrollIndicatorInsets.bottom = keyboardHeight + 20
  }

  // MARK: - Bàn phím hide
  @objc func keyboardWillHide(notification: Notification) {
    scrollviewLogin.contentInset.bottom = 0
    scrollviewLogin.scrollIndicatorInsets.bottom = 0
  }

  // MARK: - Ẩn bàn phím khi chạm ngoài
  @objc func dismissKeyboard() {
      view.endEditing(true)
  }

  // MARK: - Auto scroll tới TextField đang active
  func textFieldDidBeginEditing(_ textField: UITextField) {
      let textFieldFrame = textField.convert(textField.bounds, to: scrollviewLogin)
    scrollviewLogin.scrollRectToVisible(textFieldFrame, animated: true)
  }

  // MARK: - Gán delegate cho toàn bộ TextField
  private func assignDelegatesToTextFields(in view: UIView) {
      for subview in view.subviews {
          if let textField = subview as? UITextField {
              textField.delegate = self
          } else {
              assignDelegatesToTextFields(in: subview)
          }
      }
  }



  @IBAction func didTapHome(_ sender: Any) {
    guard let email = emailLoginTextF.text, !email.isEmpty,
          let password = passLoginTextF.text, !password.isEmpty else {
          showAlert(message: "Vui lòng nhập đầy đủ thông tin")
          return
    }
    checkLogin(email: email, password: password)

  }
  
  func checkLogin(email: String, password: String) {
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
          let context = appDelegate.persistentContainer.viewContext

          let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
          fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)

          do {
              let users = try context.fetch(fetchRequest)
              if users.isEmpty {
                  showAlert(message: "Email hoặc mật khẩu không đúng")
              } else {
                if let loggedInUser = users.first{
                  SessionManager.shared.currentUser = loggedInUser
                }

                  showAlert(message: "Đăng nhập thành công!") { [weak self] in
                      // Chuyển sang màn hình tiếp theo, ví dụ Home
                      self?.push(viewControllerType: CountryAccViewController.self)
                  }
              }
          } catch {
              print("Lỗi khi kiểm tra đăng nhập: \(error)")
              showAlert(message: "Đã xảy ra lỗi. Vui lòng thử lại.")
          }
      }

      // MARK: - Hàm show alert có callback
      private func showAlert(message: String, completion: (() -> Void)? = nil) {
          let alert = UIAlertController(title: "Thông báo", message: message, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "Đóng", style: .default, handler: { _ in
              completion?()
          }))
          present(alert, animated: true)
      }

  @IBAction func didTapBackRegister(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
}
