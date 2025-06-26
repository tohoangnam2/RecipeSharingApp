//
//  HomeViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 31/5/25.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var titleHomeLabel: UILabel!
  @IBOutlet weak var homeScrollview: UIScrollView!
  @IBOutlet weak var tagCollectionView: UICollectionView!
  @IBOutlet weak var liveCollectionView: UICollectionView!
  @IBOutlet weak var topChefCollectionView: UICollectionView!
  @IBOutlet weak var popularCollectionVIew: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    homeScrollview.layoutIfNeeded()

  }
//  override func viewDidLayoutSubviews() {
//      super.viewDidLayoutSubviews()
//
//      // Đảm bảo layout xong scrollView và collectionView
//      homeScrollview.layoutIfNeeded()
//
//      // Set preferredMaxLayoutWidth cho title label nếu có
//    titleHomeLabel.preferredMaxLayoutWidth = titleHomeLabel.frame.width
//  }


  func setupCollectionView(){

    //Tag
    tagCollectionView.dataSource = self
    tagCollectionView.delegate = self

    tagCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")

    //Tag
    liveCollectionView.dataSource = self
    liveCollectionView.delegate = self
    liveCollectionView.register(UINib(nibName: "LiveCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LiveCollectionViewCell")

    //Tag
    topChefCollectionView.dataSource = self
    topChefCollectionView.delegate = self
    topChefCollectionView.register(UINib(nibName: "TopChefCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopChefCollectionViewCell")


    //Tag
    popularCollectionVIew.dataSource = self
    popularCollectionVIew.delegate = self
    popularCollectionVIew.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")

  }

  @IBAction func didTapAvatar(_ sender: Any) {
  }


  @IBAction func didTapSearchHome(_ sender: Any) {
  }


  @IBAction func didTapLiveCooking(_ sender: Any) {
    let vc = ViewHomeAllViewController(nibName: "ViewHomeAllViewController", bundle: nil)
    vc.viewAllType = .liveCooking
    navigationController?.pushViewController(vc, animated: true)


  }


  @IBAction func didTapTopChef(_ sender: Any) {
    let vc = ViewHomeAllViewController(nibName: "ViewHomeAllViewController", bundle: nil)
    vc.viewAllType = .topChef
    navigationController?.pushViewController(vc, animated: true)

  }

  @IBAction func didTapPopular(_ sender: Any) {
    let vc = ViewHomeAllViewController(nibName: "ViewHomeAllViewController", bundle: nil)
    vc.viewAllType = .popularRecipes
    navigationController?.pushViewController(vc, animated: true)

  }


  //chuyen huong cac tab khac

  
  @IBAction func didTapDiscover(_ sender: Any) {
    self.push(viewControllerType: DiscoverViewController.self)

  }

  @IBAction func didTapAdd(_ sender: Any) {
  }


  @IBAction func didTapNofication(_ sender: Any) {
  }

  
  @IBAction func didTapProfile(_ sender: Any) {
  }
  



}
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

  //Tag

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch collectionView{
    case tagCollectionView :
      return listTagImage.count
    case liveCollectionView :
      return listLiveModel.count
    case topChefCollectionView :
      return listTopChelModel.count
    case popularCollectionVIew :
      return listPopularModel.count


    default:
      return 0
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let tagCollectionView = tagCollectionView,
          let  liveCollectionView = liveCollectionView,
          let topChefCollectionView = topChefCollectionView,
          let popularCollectionVIew = popularCollectionVIew else {
      return UICollectionViewCell()
    }
    switch collectionView{
    case tagCollectionView :
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
      cell.config(model: listTagImage[indexPath.row])
      return cell

    case liveCollectionView :
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveCollectionViewCell", for: indexPath) as! LiveCollectionViewCell
      cell.config(model: listLiveModel[indexPath.row])
      cell.onTapLiveStream = {
          let vc = LiveStreamingViewController(nibName: "LiveStreamingViewController", bundle: nil)
          vc.hidesBottomBarWhenPushed = true
          self.navigationController?.pushViewController(vc, animated: true)
      }


      return cell

    case topChefCollectionView :
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopChefCollectionViewCell", for: indexPath) as! TopChefCollectionViewCell
      cell.config(model: listTopChelModel[indexPath.row])
      return cell

    case popularCollectionVIew :
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as! PopularCollectionViewCell
      cell.config(model: listPopularModel[indexPath.row])
      return cell




    default:
      return UICollectionViewCell()
    }




  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      switch collectionView{
      case tagCollectionView :
        return 12
      case liveCollectionView :
        return 12
      case topChefCollectionView :
        return 12
      case popularCollectionVIew :
        return 12


      default:
        return 12
      }
    }
    return 12
  }
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {


    switch collectionView{
    case tagCollectionView:
      return CGSize(width: 91 , height: 39) // tuỳ độ dài text, có thể tính dynamic
    case liveCollectionView:
      //      let width = collectionView.bounds.width * 0.7  // hoặc 1.0 nếu muốn full
      //      return CGSize(width: width, height: width * 1.0)  // Tùy theo tỉ lệ bạn mong muốn
      return CGSize(width: 266  , height: 203) // tuỳ độ dài text, có thể tính dynamic
    case topChefCollectionView:
      return CGSize(width: 80, height: 143)
      //      let height = collectionView.bounds.height * 1.0 // hoặc bao nhiêu % chiều cao
      //      let width = height * 0.65 // hoặc tùy tỷ lệ ảnh
      //      return CGSize(width: width, height: height)
    case popularCollectionVIew:
      //      let height = collectionView.bounds.height * 1.0 // hoặc bao nhiêu % chiều cao
      //      let width = height * 1.52 // hoặc tùy tỷ lệ ảnh
      //          return CGSize(width: width, height: height)
      return CGSize(width: 315, height: 206)
    default:
      return CGSize.zero
    }
  }
}
//extension HomeViewController : LiveCollectionViewCellDelegate{
//  func a() {
//    let vc = LiveStreamingViewController(nibName: "LiveStreamingViewController", bundle: nil)
//          vc.hidesBottomBarWhenPushed = true
//          self.navigationController?.pushViewController(vc, animated: true)
//  }
//
//}
