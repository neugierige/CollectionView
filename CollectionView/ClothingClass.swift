//
//  ClothingClass.swift
//  CollectionView
//
//  Created by Luyuan Xing on 8/6/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class Clothing {
    
    let category: String
    let brand: String?
    let color: UIColor
    let work: Bool
    
    init(category: String, brand: String?, color: UIColor, work: Bool) {
        self.category = category
        self.brand = brand
        self.color = color
        self.work = work
    }
    
    
    
}
