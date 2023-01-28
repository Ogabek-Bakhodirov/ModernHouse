//
//  InteriorValueCell.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 28/01/23.
//

import UIKit

class InteriorValueCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    func setupCategory(){
                
//        let mainView = UIView(frame: CGRect(x: universalWidth(15), y: 0, width: self.contentView.frame.width - universalWidth(15), height: self.contentView.frame.height))
//        mainView.backgroundColor = .white
//        mainView.layer.cornerRadius = 12
//        mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(iconTapped)))
//        mainView.isUserInteractionEnabled = true
//        mainView.layer.borderWidth = 1
//        mainView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
//        mainView.layer.cornerRadius = 16
//        self.contentView.addSubview(mainView)
        
//        let mainImageView = UIImageView(frame: CGRect(x: 0, y: 10, width: mainView.frame.width, height: mainView.frame.width  - universalWidth(50)))
        let mainImageView = UIImageView(frame: CGRect(x: universalWidth(15), y: 0, width: self.contentView.frame.width - universalWidth(15), height: self.contentView.frame.height))
//        mainImageView.image = model.category.icon
        mainImageView.backgroundColor = .clear
        mainImageView.image = mainImageView.image?.withRenderingMode(.alwaysTemplate)       
//        mainImageView.tintColor = model.isSelected ? .white : .black
        mainImageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(mainImageView)
        
    }
    
    @objc func iconTapped(){

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

