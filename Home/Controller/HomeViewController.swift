//
//  HomeviewControllerViewController.swift
//  LoginViewCode
//
//  Created by Thayanne Mendes on 04/01/23.
//

import UIKit

class HomeViewController: UIViewController{

    var homeScreen:HomeScreen?
    var data:[DataUser] = [DataUser(name: "Caio", nameImage: "Menino1"),
                           DataUser(name: "Maria", nameImage: "Menino2"),
                           DataUser(name: "Bia", nameImage: "Menino3")]
    
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)

    }
    

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell: SportsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportsTableViewCell.identifier, for: indexPath) as? SportsTableViewCell
            return cell ?? UITableViewCell()
        }
        
        let cel: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cel?.setupCell(data: self.data[indexPath.row])
        return cel ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
