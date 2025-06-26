//
//  LiveStreamingViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 26/6/25.
//

import UIKit
import AVFoundation

class LiveStreamingViewController: UIViewController {

  @IBOutlet weak var videoContainerView: UIView!
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var chatContainerView: UIView!
  @IBOutlet weak var chatTableVIew: UITableView!
  @IBOutlet weak var chatTextField: UITextField!
  @IBOutlet weak var returnTextField: UIButton!

  var player: AVPlayer!
  var playerLayer: AVPlayerLayer!

  let bottomMargin: CGFloat = 30
  let expandedTopY: CGFloat = 100  // hoặc 0 nếu muốn kéo lên sát top


  var chatMessages: [ChatMessage] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    setupVideoPlayer()
    setupChatContainer()
    setupTableView()

    chatTextField.delegate = self

    // Ẩn navigation bar
    navigationController?.setNavigationBarHidden(true, animated: false)


    // Lắng nghe sự kiện bàn phím
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    // Tap ngoài để tắt bàn phím
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    view.addGestureRecognizer(tapGesture)
  }

  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      var videoFrame = videoContainerView.bounds
      videoFrame.origin.y -= 20
      videoFrame.size.height += 20
      playerLayer?.frame = videoFrame
  }



  // MARK: - AVPlayer setup
  func setupVideoPlayer() {
    guard let videoURL = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else { return }

    player = AVPlayer(url: videoURL)
    playerLayer = AVPlayerLayer(player: player)
    playerLayer.frame = videoContainerView.bounds
    playerLayer.videoGravity = .resizeAspect

    // Tạo frame dịch lên 20pt
        var videoFrame = videoContainerView.bounds
        videoFrame.origin.y -= 20
        videoFrame.size.height += 20
    playerLayer.frame = videoFrame


    videoContainerView.layer.addSublayer(playerLayer)

    player.play()
  }

  // MARK: - Chat container setup
  func setupChatContainer() {
    chatContainerView.layer.cornerRadius = 24
    chatContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    chatContainerView.clipsToBounds = true

//    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//    chatContainerView.addGestureRecognizer(panGesture)
  }

  // MARK: - TableView setup
  func setupTableView() {
    chatTableVIew.dataSource = self
    chatTableVIew.delegate = self
    chatTableVIew.register(UINib(nibName: "LiveStreamTableViewCell", bundle: nil), forCellReuseIdentifier: "LiveStreamTableViewCell")
    chatTableVIew.separatorStyle = .none

  }

  // MARK: - Xử lý bàn phím hiện
  @objc func keyboardWillShow(_ notification: Notification) {
    guard let userInfo = notification.userInfo,
          let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }

    let keyboardHeight = keyboardFrame.height

    UIView.animate(withDuration: 0.3) {
      self.chatContainerView.frame.origin.y = self.view.frame.height - keyboardHeight - self.chatContainerView.frame.height
    }
  }

  // MARK: - Xử lý bàn phím ẩn
  @objc func keyboardWillHide(_ notification: Notification) {
    UIView.animate(withDuration: 0.3) {
      self.chatContainerView.frame.origin.y = self.view.frame.height - 350
    }
  }

  // MARK: - Tắt bàn phím khi tap ngoài
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }

  // MARK: - Pan gesture chat container
//  @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
//    let translation = gesture.translation(in: view)
//    let velocity = gesture.velocity(in: view)
//
//    switch gesture.state {
//    case .changed:
//      // Chỉ cho vuốt lên — nếu translation.y < 0 (kéo lên)
//      if translation.y > 0 {
//        let newY = max(expandedTopY, chatContainerView.frame.origin.y + translation.y)
//        chatContainerView.frame.origin.y = newY
//        gesture.setTranslation(.zero, in: view)
//      }
//
//    case .ended:
//      let shouldCollapse = velocity.y > 150  // tốc độ kéo lên đủ nhanh
//      UIView.animate(withDuration: 0.3) {
//        if shouldCollapse {
//          // hạ xuống tận đáy (có thể chỉnh tuỳ ý nếu muốn)
//          self.chatContainerView.frame.origin.y = self.view.frame.height - 200
//        } else {
//          // trả về cách bottom 30pt
//          self.chatContainerView.frame.origin.y = self.view.frame.height - self.chatContainerView.frame.height - self.bottomMargin
//        }
//      }
//
//    default:
//      break
//    }
//  }

  // MARK: - Gửi tin nhắn chat
  func sendMessage() {
    guard let text = chatTextField.text, !text.isEmpty else { return }

    let newMessage = ChatMessage(message: text, isSender: true)
    chatMessages.append(newMessage)

    chatTableVIew.reloadData()

    let indexPath = IndexPath(row: chatMessages.count - 1, section: 0)
    chatTableVIew.scrollToRow(at: indexPath, at: .bottom, animated: true)

    chatTextField.text = ""
  }

  // MARK: - Nút gửi chat
  @IBAction func didTapReturn(_ sender: Any) {
    sendMessage()

  }
}

extension LiveStreamingViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chatMessages.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = chatTableVIew.dequeueReusableCell(withIdentifier: "LiveStreamTableViewCell", for: indexPath) as! LiveStreamTableViewCell
    let message = chatMessages[indexPath.row]
    cell.chatLabel.text = message.message
    return cell
  }
//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    <#code#>
//  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    sendMessage()
    return true
  }
}
