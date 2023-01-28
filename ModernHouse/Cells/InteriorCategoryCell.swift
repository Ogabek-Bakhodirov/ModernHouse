//
//  InteriorCategoryCell.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 28/01/23.
//

import UIKit

class InteriorCategoryCell: UICollectionViewCell{
    
    var onAction: ((InteriorCategoryModel?) -> Void)?
    
    var model: InteriorCategoryModel?
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    func setupCategory(model: InteriorCategoryModel){
        
        self.model = model
        
        let mainView = UIView(frame: CGRect(x: universalWidth(15), y: 0, width: self.contentView.frame.width - universalWidth(15), height: self.contentView.frame.height))
        mainView.backgroundColor = model.isSelected ? #colorLiteral(red: 0.261130929, green: 0.6116732955, blue: 0.6331426501, alpha: 1) : .white
        mainView.layer.cornerRadius = 12
        mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(iconTapped)))
        mainView.isUserInteractionEnabled = true
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        mainView.layer.cornerRadius = 16
        self.contentView.addSubview(mainView)
        
        let mainImageView = UIImageView(frame: CGRect(x: 0, y: 10, width: mainView.frame.width, height: mainView.frame.width  - universalWidth(50)))
        mainImageView.image = model.category.icon
        mainImageView.backgroundColor = .clear
        mainImageView.image = mainImageView.image?.withRenderingMode(.alwaysTemplate)       
        mainImageView.tintColor = model.isSelected ? .white : .black
        mainImageView.contentMode = .scaleAspectFit
        mainView.addSubview(mainImageView)
        
        let title = UILabel(frame: CGRect(x: 0, y: mainImageView.frame.maxY + universalWidth(10), width: mainView.frame.width, height: universalWidth(15)))
        title.text = model.category.title
        title.textColor = model.isSelected ? .white : .black
        title.font = .systemFont(ofSize: 14)
        title.textAlignment = .center
        mainView.addSubview(title)
    }
    
    @objc func iconTapped(){
        self.onAction?(model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
} 

