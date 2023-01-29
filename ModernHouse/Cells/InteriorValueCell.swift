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
    
    func setupCategory(color: UIColor){
        let mainImageView = UIImageView(frame: CGRect(x: universalWidth(15), y: 0, width: self.contentView.frame.width - universalWidth(15), height: self.contentView.frame.height))
//        mainImageView.image = model.category.icon
        mainImageView.backgroundColor = color
        mainImageView.image = mainImageView.image?.withRenderingMode(.alwaysTemplate)       
//        mainImageView.tintColor = color
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.layer.cornerRadius = 12
        self.contentView.addSubview(mainImageView)
        
    }
    
    @objc func iconTapped(){

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    
//    if scrollView == self.tableView {
//        
//        let fullHeight: CGFloat = scrollView.contentOffset.y
//        
//        if fullHeight >= 0 {
//            self.tableBackGroundView.centerY = self.tableBackGroundCenterY - fullHeight
//        }
//        print(fullHeight)
//        if fullHeight >= 300 {
//            if nil == self.headerView.superview {
//                self.view.addSubview(self.headerView)
//            }
//            let alpha: CGFloat = fullHeight - 300
//            switch alpha {
//            case 0 ..< 10 : self.headerView.alpha = (alpha/50)
//            case 10 ..< 20 : self.headerView.alpha = (alpha/50)
//            case 20 ..< 30 : self.headerView.alpha = (alpha/50)
//            case 30 ..< 40 : self.headerView.alpha = (alpha/50)
//            case 40 ... 50 : self.headerView.alpha = (alpha/50)
//            case 51 ... 150: self.headerView.alpha = 1.0
//            default : break
//            }
//        } else {
//            if nil != self.headerView.superview {
//                self.headerView.removeFromSuperview()
//            }
//        }
//    }
//}
