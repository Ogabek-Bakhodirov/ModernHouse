//
//  TextFieldView.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 29/01/23.
//

import UIKit

class TextFieldView: UIView{
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
        setupView(textFieldTitle: title)
    }
    
    func setupView(textFieldTitle: String){
        
        let mainView = UIView(frame: self.bounds)
        mainView.backgroundColor = .clear
        self.addSubview(mainView)
        
        let textField = UITextField(frame: CGRect(x: 5, y: 0, width: mainView.frame.width - 10, height: 30))
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.isUserInteractionEnabled = true
        mainView.addSubview(textField)
        
        let title = UILabel(frame: CGRect(x: 0, y: textField.frame.maxY + 5, width: mainView.frame.width, height: 18))
        title.text = textFieldTitle
        title.textColor = .darkGray
        title.textAlignment = .center
        title.adjustsFontSizeToFitWidth = true
        mainView.addSubview(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
