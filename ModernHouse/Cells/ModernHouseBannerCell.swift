//
//  ModernHouseBannerCell.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 29/01/23.
//

import UIKit

class ModernHouseCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBannerView()
    }
    
    func setupBannerView(){
        let gradientedBackground = UIView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight / 4))
        gradientedBackground.backgroundColor = .clear       
        self.contentView.addSubview(gradientedBackground)
        
        let gradient = CAGradientLayer()
        gradient.frame = gradientedBackground.bounds
        gradient.colors = [ UIColor.darkGreen.cgColor, UIColor.lightGreen.cgColor]
        gradientedBackground.layer.addSublayer(gradient)
        
        let title = UILabel(frame: CGRect(x: 0, y: 20, width: windowWidth, height: 20))
        title.text = "Modern House"
        title.textColor = .white
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 20, weight: .black)
        gradientedBackground.addSubview(title)
        
        let subtitle = UILabel(frame: CGRect(x: 0, y: title.frame.maxY + 10, width: windowWidth, height: 20))
        subtitle.text = "For your comfort"
        subtitle.textColor = .white
        subtitle.textAlignment = .center
        subtitle.font = .systemFont(ofSize: 20, weight: .medium)
        gradientedBackground.addSubview(subtitle)
        
        let message = UILabel(frame: CGRect(x: 0, y: subtitle.frame.maxY + 90, width: windowWidth, height: 20))
        message.text = "Choose your favourite design"
        message.textColor = .darkGreen
        message.textAlignment = .center
        message.font = .systemFont(ofSize: 20, weight: .black)
        gradientedBackground.addSubview(message)
        
        let icon = UILabel(frame: CGRect(x: 0, y: message.frame.maxY + 10, width: windowWidth, height: 20))
        icon.text = "👇"
        icon.textColor = .darkGreen
        icon.textAlignment = .center
        icon.font = .systemFont(ofSize: 20, weight: .bold)
        gradientedBackground.addSubview(icon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
