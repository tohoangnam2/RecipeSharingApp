//
//  ViewHomeAllViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 17/6/25.
//

import UIKit

class ViewHomeAllViewController: UIViewController {

  @IBOutlet weak var backHome: UIButton!
  
  @IBOutlet weak var searchButton: UIButton!
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var viewAllCollectionView: UICollectionView!

  var viewAllType: ViewAllType = .liveCooking

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionview()
        setupView()
    }

  func setupView(){
    switch viewAllType{
    case .liveCooking :
      titleLabel.text = "Live Cooking"
    case .topChef :
      titleLabel.text = "Top Chef"
    case .popularRecipes:
      titleLabel.text = "Today’s Popular Recipes"
    }
  }

  func setupCollectionview(){
    viewAllCollectionView.dataSource = self
    viewAllCollectionView.delegate = self

    switch viewAllType {
    case .liveCooking:
      viewAllCollectionView.register(UINib(nibName: "LiveCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LiveCollectionViewCell")
    case .topChef:
      viewAllCollectionView.register(UINib(nibName: "TopChefCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopChefCollectionViewCell")
    case .popularRecipes:
      viewAllCollectionView.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")
    }
  }

  @IBAction func didTapBackHome(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
}
extension ViewHomeAllViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch viewAllType{
    case .liveCooking :
      return listLiveModel.count
    case .topChef :
      return listTopChelModel.count
    case .popularRecipes :
      return listPopularModel.count
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch viewAllType{
    case .liveCooking :
      let cell = viewAllCollectionView.dequeueReusableCell(withReuseIdentifier: "LiveCollectionViewCell", for: indexPath) as! LiveCollectionViewCell

      cell.config(model: listLiveModel[indexPath.row])
      cell.onTapLiveStream = {
          let vc = LiveStreamingViewController(nibName: "LiveStreamingViewController", bundle: nil)
        vc.hidesBottomBarWhenPushed = true
          self.navigationController?.pushViewController(vc, animated: true)
      }

      return cell

    case .topChef :
      let cell = viewAllCollectionView.dequeueReusableCell(withReuseIdentifier: "TopChefCollectionViewCell", for: indexPath) as! TopChefCollectionViewCell
      cell.config(model: listTopChelModel[indexPath.row])
      return cell

    case .popularRecipes :
      let cell = viewAllCollectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as! PopularCollectionViewCell
      cell.config(model: listPopularModel[indexPath.row])
      return cell
    }
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch viewAllType{
    case .liveCooking :
      let width = viewAllCollectionView.frame.width * 1.0
      let height = width * 0.66
      return CGSize(width: width, height: height)
    case .topChef :
//      let width = (viewAllCollectionView.frame.width - (spacing * (col + 1))) / col
      let width = (viewAllCollectionView.frame.width - 36) / 2
      let height = width * 1.3
      return CGSize(width: width, height: height)	
    case .popularRecipes :
      let width = viewAllCollectionView.frame.width * 1.0
      let height = width * 0.66
      return CGSize(width: width, height: height)
    }


  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    switch viewAllType{
//    case .liveCooking :
//      return 12
//    case .topChef :
//      return 12
//    case .popularRecipes :
//      return 12
//    }
    return 12
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 12
  }


}
