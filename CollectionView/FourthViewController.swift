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
    let doneButton = UIButton()
    
    
    var categoryText = String()
    var brandText = String()
    var color = UIColor()
    var switchValue = Bool()
    
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
        categoryLabel.text = categoryText
        
        brandLabel.backgroundColor = .greenColor()
        brandLabel.frame = CGRectMake(0, categoryLabel.frame.maxY, labelWidth, labelHeight)
        brandLabel.text = brandText
        
        colorLabel.backgroundColor = color
        colorLabel.frame = CGRectMake(0, brandLabel.frame.maxY, labelWidth, labelHeight)
        colorLabel.text = "Color"
        
        switchLabel.frame = CGRectMake(0, colorLabel.frame.maxY+10, labelWidth/2, labelHeight)
        switchLabel.textAlignment = .Right
        switchLabel.text = "Good for work?"
        
        mySwitch = UISwitch(frame: CGRect(x: labelWidth/2+10, y: colorLabel.frame.maxY+10, width: labelWidth/2, height: labelHeight))
        if mySwitch.on {
            switchValue = true
        } else {
            switchValue = false
        }
        self.view.addSubview(mySwitch)
        
        doneButton.frame = CGRectMake(0, self.view.frame.maxY-labelHeight*2, labelWidth, labelHeight*2)
        doneButton.backgroundColor = .blueColor()
        doneButton.setTitleColor(.whiteColor(), forState: .Normal)
        doneButton.setTitle("DONE", forState: .Normal)
        doneButton.addTarget(self, action: #selector(self.createClothing), forControlEvents: .TouchUpInside)
        self.view.addSubview(doneButton)
        
    }
    
    func createClothing() {
        let clothing = Clothing(category: categoryText, brand: brandText, color: color, work: switchValue)
        print("THIS IS MY CLOTHING OBJECT")
        print(clothing)
        //TO DO: post this object to the database
    }
    
    
    
}
