import UIKit
import CoreData
import Security

class HomeRegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameRegisLabel: UITextField!
    @IBOutlet weak var emailRegisTextField: UITextField!
    @IBOutlet weak var emailRegisLabel: UILabel!
    @IBOutlet weak var phoneRegisTextField: UITextField!
    @IBOutlet weak var phoneRegisLabel: UILabel!
    @IBOutlet weak var passRegisTextField: UITextField!
    @IBOutlet weak var passRegisLabel: UILabel!

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

        // Setup giao diện và event
        setupRegister()
    }

    private func setupRegister() {
        // Ẩn label và textfield mật khẩu lúc đầu
        emailRegisLabel.alpha = 0
        phoneRegisLabel.alpha = 0
        passRegisLabel.alpha = 0
        passRegisTextField.isHidden = true
        passRegisTextField.isSecureTextEntry = true


      //set placehold cho ip11 cua toi
      nameRegisLabel.setPlaceholder("Fullname")
      emailRegisTextField.setPlaceholder("Email")
      phoneRegisTextField.setPlaceholder("Phone")
      passRegisTextField.setPlaceholder("Password")



        // Thêm target cho phoneTextField để theo dõi thay đổi text
        phoneRegisTextField.addTarget(self, action: #selector(phoneChange(_:)), for: .editingChanged)
    }

    @objc func phoneChange(_ sender: UITextField) {
        guard let text = sender.text else { return }
        let valid = isValidPhone(text)
        passRegisTextField.isHidden = !valid
    }

    private func isValidPhone(_ phone: String) -> Bool {
        let regex = "^0[0-9]{9}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: phone)
    }
  func isValidPassword(_ password :String) -> Bool {
    return password.count > 6 && password.count < 12
  }

    @IBAction func didTapPopRegister(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func didTapLogin(_ sender: Any) {
        self.push(viewControllerType: LoginViewController.self)
    }

    @IBAction func didTapLoginn(_ sender: Any) {
        guard
            let name = nameRegisLabel.text , !name.isEmpty,
            let email = emailRegisTextField.text, !email.isEmpty,
            let phone = phoneRegisTextField.text, !phone.isEmpty,
            let password = passRegisTextField.text, !password.isEmpty else {
                showAlert(message: "Vui lòng nhập đầy đủ thông tin")
                return
        }
      guard
        isValidPassword(password) else {
        passRegisLabel.alpha = 1
        return
      }


      saveUser(name:name,email: email, phone: phone, password: password)
    }

  private func saveUser(name: String ,email: String, phone: String, password: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext

        // Kiểm tra email đã tồn tại chưa
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)

        do {
            let users = try context.fetch(fetchRequest)
            if !users.isEmpty {
              emailRegisLabel.alpha = 1
                return
            }
        } catch {
            print("Lỗi khi kiểm tra email: \(error)")
            return
        }

        let newUser = User(context: context)
        newUser.name = name
        newUser.email = email

        // Convert phone String -> Int32, nếu sai báo lỗi
        if let phoneInt = Int32(phone) {
            newUser.phone = phone
        } else {
          phoneRegisTextField.alpha = 1
            return
        }

        newUser.password = password


        do {
            try context.save()
            showAlert(message: "Đăng ký thành công!")
            clearInputs()
          self.push(viewControllerType: LoginViewController.self)

        } catch {
            print("Lỗi lưu user: \(error)")
        }
    }

    private func clearInputs() {
        nameRegisLabel.text = ""
        emailRegisTextField.text = ""
        phoneRegisTextField.text = ""
        passRegisTextField.text = ""
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Thông báo", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Đóng", style: .default))
        present(alert, animated: true)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Bàn phím show
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }

        let keyboardHeight = keyboardFrame.height

        scrollView.contentInset.bottom = keyboardHeight + 20
        scrollView.scrollIndicatorInsets.bottom = keyboardHeight + 20
    }

    // MARK: - Bàn phím hide
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset.bottom = 0
        scrollView.scrollIndicatorInsets.bottom = 0
    }

    // MARK: - Ẩn bàn phím khi chạm ngoài
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - Auto scroll tới TextField đang active
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let textFieldFrame = textField.convert(textField.bounds, to: scrollView)
        scrollView.scrollRectToVisible(textFieldFrame, animated: true)
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
}
