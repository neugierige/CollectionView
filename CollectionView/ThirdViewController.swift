//
//  ThirdViewController.swift
//  CollectionView
//
//  Created by Luyuan Xing on 8/6/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let categoryLabel = UILabel()
    let brandLabel = UILabel()
    let labelHeight: CGFloat = 100
    
    var categoryText = String()
    var brandText = String()
    
    //color picker variables
    var tag: Int = 0
    var color: UIColor = UIColor.grayColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .whiteColor()
        let navBarHeight = self.navigationController!.navigationBar.frame.maxY
        
        let labels = [categoryLabel, brandLabel]
        for item in labels {
            item.textAlignment = .Center
            item.numberOfLines = 1
            self.view.addSubview(item)
        }
        
        categoryLabel.backgroundColor = .orangeColor()
        categoryLabel.text = categoryText
        categoryLabel.frame = CGRectMake(0, navBarHeight, self.view.frame.width, labelHeight)
        
        brandLabel.backgroundColor = .greenColor()
        brandLabel.text = brandText
        brandLabel.frame = CGRectMake(0, categoryLabel.frame.maxY, self.view.frame.width, labelHeight)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(24, 25)
        layout.sectionInset = UIEdgeInsets(top: 3, left: 0, bottom: 3, right: 0)
        
        let colorPicker = UICollectionView(frame: CGRectMake(0, brandLabel.frame.maxY, self.view.frame.width, self.view.frame.height-labelHeight*2), collectionViewLayout: layout)
        colorPicker.backgroundColor = .whiteColor()
        colorPicker.delegate = self
        colorPicker.dataSource = self
        colorPicker.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(colorPicker)
        
    }
    
    
    // This function converts from HTML colors (hex strings of the form '#ffffff') to UIColors
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    
    internal func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    internal func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 16
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        var colorPalette: Array<String>
        let path = NSBundle.mainBundle().pathForResource("colorPalette", ofType: "plist")
        let pListArray = NSArray(contentsOfFile: path!)
        
        if let colorPalettePlistFile = pListArray {
            colorPalette = colorPalettePlistFile as! [String]
            let hexString = colorPalette[indexPath.row]
            color = hexStringToUIColor(hexString)
        }
        
        cell.backgroundColor = color
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var colorPalette: Array<String>
        
        // Get colorPalette array from plist file
        let path = NSBundle.mainBundle().pathForResource("colorPalette", ofType: "plist")
        let pListArray = NSArray(contentsOfFile: path!)
        
        if let colorPalettePlistFile = pListArray {
            colorPalette = colorPalettePlistFile as! [String]
            
            let cell: UICollectionViewCell  = collectionView.cellForItemAtIndexPath(indexPath)! as UICollectionViewCell
            let hexString = colorPalette[cell.tag]
            color = hexStringToUIColor(hexString)
            self.view.backgroundColor = color
            //delegate?.setButtonColor(color)
        }

    }

}
