//
//  Sports.swift
//  LoginViewCode
//
//  Created by Thayanne Mendes on 06/01/23.
//

import UIKit

class SportsTableViewCell: UITableViewCell {

    var sportsScreen: SportsSportsTableViewCellScreen = SportsSportsTableViewCellScreen()
    static let identifier: String = "SportsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview(){
        sportsScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.sportsScreen)
        
    }
    
    func configConstraints(){
        sportsScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
