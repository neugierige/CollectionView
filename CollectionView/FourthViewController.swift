//
//  FourthViewController.swift
//  CollectionView
//
//  Created by Luyuan Xing on 8/7/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    let categoryLabel = UILabel()
    let brandLabel = UILabel()
    let colorLabel = UILabel()
    let switchLabel = UILabel()
    var mySwitch = UISwitch()
    
    var color = UIColor()
    
    let labelHeight: CGFloat = 40
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = .whiteColor()
        let labelWidth: CGFloat = self.view.frame.width
        let navBarHeight = self.navigationController!.navigationBar.frame.maxY
        
        let labels = [categoryLabel, brandLabel, colorLabel, switchLabel]
        for item in labels {
            item.textAlignment = .Center
            item.numberOfLines = 1
            self.view.addSubview(item)
        }
        
        categoryLabel.backgroundColor = .orangeColor()
        categoryLabel.frame = CGRectMake(0, navBarHeight, labelWidth, labelHeight)
        
        brandLabel.backgroundColor = .greenColor()
        brandLabel.frame = CGRectMake(0, categoryLabel.frame.maxY, labelWidth, labelHeight)
        
        colorLabel.backgroundColor = color
        colorLabel.frame = CGRectMake(0, brandLabel.frame.maxY, labelWidth, labelHeight)
        colorLabel.text = "Color"
        
        switchLabel.frame = CGRectMake(0, colorLabel.frame.maxY+10, labelWidth/2, labelHeight)
        switchLabel.textAlignment = .Right
        switchLabel.text = "Good for work?"
        
        mySwitch = UISwitch(frame: CGRect(x: labelWidth/2+10, y: colorLabel.frame.maxY+10, width: labelWidth/2, height: labelHeight))
        self.view.addSubview(mySwitch)
        
    }
    
    
    
}
