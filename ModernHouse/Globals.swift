//
//  Globals.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 28/01/23.
//

import UIKit
public let windowHeight = UIScreen.main.bounds.height
public let windowWidth =  UIScreen.main.bounds.width

public func universalHeight(_ height: CGFloat) -> CGFloat {
    return height / 812 * windowHeight
}

public func universalWidth(_ width: CGFloat) -> CGFloat {
    return width / 375 * windowWidth
}


extension UIColor{
    static var darkGreen: UIColor = #colorLiteral(red: 0.261130929, green: 0.6116732955, blue: 0.6331426501, alpha: 1)
    static var lightGreen: UIColor = #colorLiteral(red: 0.8409659266, green: 0.8310413957, blue: 0.8827342391, alpha: 1)
}
