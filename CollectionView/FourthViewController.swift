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
    var mySwitch = UISwitch()
    
    var color = UIColor()
    
    
    let labelHeight: CGFloat = 40
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = .whiteColor()
        let labelWidth: CGFloat = self.view.frame.width
        let navBarHeight = self.navigationController!.navigationBar.frame.maxY
        
        let labels = [categoryLabel, brandLabel, colorLabel]
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
        
        mySwitch = UISwitch(frame: CGRect(x: (self.view.frame.midX-self.mySwitch.frame.width/2), y: colorLabel.frame.maxY+10, width: labelWidth, height: labelHeight))
        self.view.addSubview(mySwitch)
        
    }
    
    
    
}
