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
