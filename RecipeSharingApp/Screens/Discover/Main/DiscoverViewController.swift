//
//  DiscoverViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 19/6/25.
//

import UIKit

class DiscoverViewController: UIViewController {

  @IBOutlet weak var foodRecipeButton: UIButton!

  @IBOutlet weak var liveButton: UIButton!

  @IBOutlet weak var galleries: UIButton!

  @IBOutlet weak var discoverCollectionView: UICollectionView!

  var discoverViewAllType : DiscoverViewAllType = .foodRecipe

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupDiscoverCollectionView()
  }

  func setupView(){
    switch discoverViewAllType {
    case .foodRecipe:
      foodRecipeButton.setImage(UIImage(resource: .dis1), for: .normal)
      liveButton.setImage(UIImage(resource: .dis2N), for: .normal)
      galleries.setImage(UIImage(resource: .dis3N), for: .normal)
    case .live:
      foodRecipeButton.setImage(UIImage(resource: .dis1N), for: .normal)
      liveButton.setImage(UIImage(resource: .dis2), for: .normal)
      galleries.setImage(UIImage(resource: .dis3N), for: .normal)
    case .galleriers:
      foodRecipeButton.setImage(UIImage(resource: .dis1N), for: .normal)
      liveButton.setImage(UIImage(resource: .dis2N), for: .normal)
      galleries.setImage(UIImage(resource: .dis3), for: .normal)
    }
  }

  func setupDiscoverCollectionView(){
    discoverCollectionView.delegate = self
    discoverCollectionView.dataSource = self


    switch discoverViewAllType {
    case .foodRecipe:
      discoverCollectionView.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")
      discoverCollectionView.collectionViewLayout = createLayout()
    case .live:
      discoverCollectionView.register(UINib(nibName: "LiveCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LiveCollectionViewCell")
      discoverCollectionView.collectionViewLayout = createLayout()
    case .galleriers:
      discoverCollectionView.register(UINib(nibName: "GalleriersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GalleriersCollectionViewCell")
      discoverCollectionView.collectionViewLayout = createLayoutBeauti()
    }
  }

  func createLayout() -> UICollectionViewCompositionalLayout {
      // Item
      let itemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(0.5),  // 2 item trên 1 hàng
          heightDimension: .fractionalHeight(1.0) // full height group
      )
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      item.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6)

      // Group (2 item, height = width * 2/3)
      let groupWidth = UIScreen.main.bounds.width
      let groupHeight = groupWidth * 2 / 3
      let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .absolute(groupHeight)
      )
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])

      // Section
      let section = NSCollectionLayoutSection(group: group)
      section.interGroupSpacing = 6
      section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)

      // Return
      return UICollectionViewCompositionalLayout(section: section)
  }

  func createLayoutBeauti() -> UICollectionViewCompositionalLayout {
    // 2 item ngang
    let hozizonItem = NSCollectionLayoutItem(
      layoutSize: NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(0.5),
      heightDimension: .fractionalHeight(1.0)))
    hozizonItem.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)

    let hozizonGroup = NSCollectionLayoutGroup.horizontal(
      layoutSize: NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(0.5)) ,
      subitem: hozizonItem,
      count: 2)

    //1 item doc
    let item1 = NSCollectionLayoutItem(
      layoutSize: NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .fractionalHeight(0.5)))

    item1.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)


    //group
    let verticalGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(2/3),
      heightDimension: .fractionalHeight(1.0)),
      subitems: [
        hozizonGroup,
        item1
      ])

    //item 4

    let item2 = NSCollectionLayoutItem(
      layoutSize:  NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1/3),
        heightDimension: .fractionalHeight(1.0)))

    item2.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)


    let group1 = NSCollectionLayoutGroup.horizontal(
      layoutSize:  NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(0.5)),
      subitems: [
        verticalGroup1,
        item2
      ])

    //group 2

    let item3 = NSCollectionLayoutItem(
      layoutSize: NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(2/3),
        heightDimension: .fractionalHeight(1.0))
      )
    item3.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)


      let verticalItem2 = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .fractionalHeight(0.5))
        )
    verticalItem2.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)


        let verticalGroup2 = NSCollectionLayoutGroup.vertical(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1.0)),
          subitem: verticalItem2,
          count: 2)

    let group2 = NSCollectionLayoutGroup.horizontal(
      layoutSize: NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(0.5)),
      subitems: [
        item3,
        verticalGroup2
      ])

    let mainGroup = NSCollectionLayoutGroup.vertical(
      layoutSize: NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0)),
      subitems: [
        group1,
        group2
      ])

    //section
    let section1 = NSCollectionLayoutSection(group: mainGroup)
    section1.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)


    //return
    return UICollectionViewCompositionalLayout(section: section1)

  }


  @IBAction func didTapHome(_ sender: Any) {
    self.push(viewControllerType: HomeViewController.self)
  }

  @IBAction func didTapDiscover(_ sender: Any) {
    self.push(viewControllerType: DiscoverViewController.self)
  }
  
  @IBAction func didTapAdd(_ sender: Any) {

  }
  
  @IBAction func didTapNofication(_ sender: Any) {
  }

  @IBAction func didTapProfile(_ sender: Any) {
  }
  


  @IBAction func didTapFoodRecipe(_ sender: Any) {
   let vc = DiscoverViewController(nibName: "DiscoverViewController", bundle: nil)
    vc.discoverViewAllType = .foodRecipe
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @IBAction func didTapLive(_ sender: Any) {
    let vc = DiscoverViewController(nibName: "DiscoverViewController", bundle: nil)
    vc.discoverViewAllType = .live
     navigationController?.pushViewController(vc, animated: true)
  }
  
  @IBAction func didTapGalleriers(_ sender: Any) {
    let vc = DiscoverViewController(nibName: "DiscoverViewController", bundle: nil)
    vc.discoverViewAllType = .galleriers
     navigationController?.pushViewController(vc, animated: true)
  }
  

}

extension DiscoverViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch discoverViewAllType{
    case .foodRecipe :
      return listPopularModel.count
    case .live :
      return  listLiveModel.count
    case .galleriers :
      return listGalleriers.count
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch discoverViewAllType {
    case .foodRecipe:
      let cell = discoverCollectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as! PopularCollectionViewCell
      cell.config(model: listPopularModel[indexPath.row])
      return cell
    case .live:
      let cell = discoverCollectionView.dequeueReusableCell(withReuseIdentifier: "LiveCollectionViewCell", for: indexPath) as! LiveCollectionViewCell
      cell.config(model: listLiveModel[indexPath.row])
      return cell
    case .galleriers:
      let cell = discoverCollectionView.dequeueReusableCell(withReuseIdentifier: "GalleriersCollectionViewCell", for: indexPath) as! GalleriersCollectionViewCell
      cell.config(model: listGalleriers[indexPath.row])
      return cell
    }
  }

  //
  

}
