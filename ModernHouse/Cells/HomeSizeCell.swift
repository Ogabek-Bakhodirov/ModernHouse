//
//  HomeSizeCell.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 29/01/23.
//

import UIKit

class HomeSizeCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews(){
        let mainView = UIView(frame: self.contentView.bounds)
        mainView.backgroundColor = .clear
        self.contentView.addSubview(mainView)
        
        let title = UILabel(frame: CGRect(x: universalWidth(20), y: universalWidth(15), width: windowWidth, height: 18))
        title.text = "Enter your room's size"
        title.textColor = .darkGray
        mainView.addSubview(title)
        
        let textField = TextFieldView(frame: CGRect(x: universalWidth(20), y: title.frame.maxY + 15, width: universalWidth(70), height: 30), title: "Width")
        textField.isUserInteractionEnabled = true
        self.contentView.addSubview(textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


