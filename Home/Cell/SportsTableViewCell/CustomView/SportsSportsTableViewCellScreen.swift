//
//  SportsSportsTableViewCellScreen.swift
//  LoginViewCode
//
//  Created by Thayanne Mendes on 06/01/23.
//

import UIKit

class SportsSportsTableViewCellScreen: UIView {
    
    
    lazy var collectioView: UICollectionView = {
        let col = UICollectionView(frame: .zero, collectionViewLayout: .init())
        col.translatesAutoresizingMaskIntoConstraints = false
        col.showsHorizontalScrollIndicator = false
        col.backgroundColor = .gray
        col.delaysContentTouches = false
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        col.setCollectionViewLayout(layout, animated: true)
        return col
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview(){
        self.addSubview(collectioView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            collectioView.topAnchor.constraint(equalTo: self.topAnchor),
            collectioView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectioView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectioView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

        
        
        ])
    }
}
