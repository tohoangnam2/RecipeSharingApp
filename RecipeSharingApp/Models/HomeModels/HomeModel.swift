//
//  HomeModel.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 2/6/25.
//

import Foundation
import UIKit


struct HomeModel {
  var tagImage : UIImage?

  //live
  var liveBGImage : UIImage?
  var liveImage : UIImage?
  var liveLabel : String?
  //topchef
  var topchefImage : UIImage?
  var nametopchefLabel : String?
  var timetopchefLabel : String?

  //popular
  var bgppImage : UIImage?
  var timeppLabel : String?
  var ingredientsppLabel : String?
  var contentppLabel : String?

  //galleriers

  var galleriersImage : UIImage?


}

let listTagImage = [
  HomeModel(tagImage: UIImage(resource: .tag1)),
  HomeModel(tagImage: UIImage(resource: .tag2)),
  HomeModel(tagImage: UIImage(resource: .tag3)),
  HomeModel(tagImage: UIImage(resource: .tag2)),
  HomeModel(tagImage: UIImage(resource: .tag3)),
  HomeModel(tagImage: UIImage(resource: .tag1))
]

let listLiveModel = [
  HomeModel(liveBGImage: UIImage(resource: .live1),liveImage: UIImage(resource: .icAvatar),liveLabel: "Devilled whitebait and calamari"),
  HomeModel(liveBGImage: UIImage(resource: .live1),liveImage: UIImage(resource: .icAvatar),liveLabel: "Barbecued piri piri chicken"),
  HomeModel(liveBGImage: UIImage(resource: .live1),liveImage: UIImage(resource: .icAvatar),liveLabel: "Devilled whitebait and calamari"),
  HomeModel(liveBGImage: UIImage(resource: .live1),liveImage: UIImage(resource: .icAvatar),liveLabel: "Devilled whitebait and calamari"),
  HomeModel(liveBGImage: UIImage(resource: .live1),liveImage: UIImage(resource: .icAvatar),liveLabel: "Devilled whitebait and calamari"),
  HomeModel(liveBGImage: UIImage(resource: .live1),liveImage: UIImage(resource: .icAvatar),liveLabel: "Devilled whitebait and calamari"),

]
let listTopChelModel = [
  HomeModel(topchefImage: UIImage(resource: .topchef1),nametopchefLabel: "Antonio",timetopchefLabel: "68 recipes"),
  HomeModel(topchefImage: UIImage(resource: .topchef2),nametopchefLabel: "Lan",timetopchefLabel: "80 recipes"),
  HomeModel(topchefImage: UIImage(resource: .topchef3),nametopchefLabel: "Huy",timetopchefLabel: "66 recipes"),
  HomeModel(topchefImage: UIImage(resource: .topchef1),nametopchefLabel: "Nam",timetopchefLabel: "100 recipes"),
  HomeModel(topchefImage: UIImage(resource: .topchef2),nametopchefLabel: "Viet",timetopchefLabel: "68 recipes"),
  HomeModel(topchefImage: UIImage(resource: .topchef3),nametopchefLabel: "Ngoc",timetopchefLabel: "68 recipes")

]

let listPopularModel = [
  HomeModel(bgppImage: UIImage(resource: .bgpp1),timeppLabel: "12 min",ingredientsppLabel: "12 Ingredients",contentppLabel: "Sandwich with boiled egg"),
  HomeModel(bgppImage: UIImage(resource: .bgpp2),timeppLabel: "8 min",ingredientsppLabel: "6 Ingredients",contentppLabel: "Fruity blueberry toast"),
  HomeModel(bgppImage: UIImage(resource: .bgpp3),timeppLabel: "5 min",ingredientsppLabel: "20 Ingredients",contentppLabel: "Sandwich with boiled egg"),
  HomeModel(bgppImage: UIImage(resource: .bgpp1),timeppLabel: "12 min",ingredientsppLabel: "8 Ingredients",contentppLabel: "Sandwich with boiled egg"),
  HomeModel(bgppImage: UIImage(resource: .bgpp2),timeppLabel: "4 min",ingredientsppLabel: "30 Ingredients",contentppLabel: "Sandwich with boiled egg"),
  HomeModel(bgppImage: UIImage(resource: .bgpp3),timeppLabel: "18 min",ingredientsppLabel: "2 Ingredients",contentppLabel: "Sandwich with boiled egg"),
  HomeModel(bgppImage: UIImage(resource: .bgpp1),timeppLabel: "10 min",ingredientsppLabel: "1 Ingredients",contentppLabel: "Sandwich with boiled egg"),
  HomeModel(bgppImage: UIImage(resource: .bgpp3),timeppLabel: "10 min",ingredientsppLabel: "50 Ingredients",contentppLabel: "Sandwich with boiled egg"),
]
let listGalleriers = [
  HomeModel(galleriersImage: UIImage(resource: .gallar2)),
  HomeModel(galleriersImage: UIImage(resource: .galler1)),
  HomeModel(galleriersImage: UIImage(resource: .galler3)),
  HomeModel(galleriersImage: UIImage(resource: .galler4)),
  HomeModel(galleriersImage: UIImage(resource: .galler5)),
  HomeModel(galleriersImage: UIImage(resource: .galler6)),
  HomeModel(galleriersImage: UIImage(resource: .galler7)),
  HomeModel(galleriersImage: UIImage(resource: .galler8)),
  HomeModel(galleriersImage: UIImage(resource: .galler9)),
  HomeModel(galleriersImage: UIImage(resource: .gallar2)),
  HomeModel(galleriersImage: UIImage(resource: .galler1)),
  HomeModel(galleriersImage: UIImage(resource: .galler3)),
  HomeModel(galleriersImage: UIImage(resource: .galler4)),
  HomeModel(galleriersImage: UIImage(resource: .galler5)),
  HomeModel(galleriersImage: UIImage(resource: .galler6)),
  HomeModel(galleriersImage: UIImage(resource: .galler7)),
  HomeModel(galleriersImage: UIImage(resource: .galler8)),
  HomeModel(galleriersImage: UIImage(resource: .galler9))

]
