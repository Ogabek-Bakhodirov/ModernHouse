//
//  InteriorCategoryModel.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 28/01/23.
//

import UIKit

struct InteriorCategoryModel{
    var category: InteriorCategoryEnum
    var isSelected = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(category: InteriorCategoryEnum) {
        self.category = category
        self.identifier = Self.getUniqueIdentifier()
    }
}

enum InteriorCategoryEnum{
    case furniture, color, pattern
    
    var title: String {
        switch self {
        case .furniture: return "Furniture"
        case .color: return "Color"
        case .pattern: return "Pattern"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .furniture: return UIImage(named: "sofa")
        case .color: return UIImage(systemName: "paintpalette.fill")
        case .pattern: return UIImage(named: "pattern")
        }
    }
}
