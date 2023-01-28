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
        case .furniture: return UIImage(systemName: "trash")
        case .color: return UIImage(systemName: "paintpalette.fill")
        case .pattern: return UIImage(systemName: "trash")
        }
    }
}
