//
//  CountryAccViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 27/5/25.
//

import UIKit

class CountryAccViewController: UIViewController {
  @IBOutlet weak var countryAccTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()


    }
  func setupTable(){
    countryAccTableView.delegate = self
    countryAccTableView.dataSource = self
    countryAccTableView.register(UINib(nibName: "CountryAccTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryAccTableViewCell")
    
    countryAccTableView.reloadData()


  }
  @IBAction func didTapSetupAcc(_ sender: Any) {
    self.push(viewControllerType: SetupAccViewViewController.self)
  }
  @IBAction func didTapHomeMain(_ sender: Any) {
    self.push(viewControllerType: MainTabBarController.self)
  }
  

}
extension CountryAccViewController : UITableViewDelegate , UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return listCountry.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CountryAccTableViewCell", for: indexPath) as! CountryAccTableViewCell
    cell.config(model: listCountry[indexPath.row])
    return cell
  }


  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      60
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let header = HeaderCountryAccView()
      return header
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    96
  }


}
