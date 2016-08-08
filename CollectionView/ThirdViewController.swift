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
    
    let labelHeight: CGFloat = 40
    let screenSize = UIScreen.mainScreen().bounds
    
    let path = NSBundle.mainBundle().pathForResource("colorPalette", ofType: "plist")
    
    var categoryText = String()
    var brandText = String()
    let fourthVC = FourthViewController()
    
    
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
        categoryLabel.frame = CGRectMake(0, navBarHeight, self.view.frame.width, labelHeight)
        
        brandLabel.backgroundColor = .greenColor()
        brandLabel.frame = CGRectMake(0, categoryLabel.frame.maxY, self.view.frame.width, labelHeight)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(screenSize.width/10, (self.view.frame.height - brandLabel.frame.maxY)/16)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let colorPicker = UICollectionView(frame: CGRectMake(0, brandLabel.frame.maxY, self.view.frame.width, self.view.frame.height-labelHeight*2), collectionViewLayout: layout)
        colorPicker.backgroundColor = .whiteColor()
        colorPicker.delegate = self
        colorPicker.dataSource = self
        colorPicker.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(colorPicker)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        categoryLabel.text = categoryText
        brandLabel.text = brandText
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
        
        //TO DO: change this to work with section / row
        if tag < 159 {
            tag += 1
        }
        cell.tag = tag
        
        print("TAG IS \(tag)")
        
        var colorPalette: Array<String>
        
        let pListArray = NSArray(contentsOfFile: path!)
        if let colorPalettePlistFile = pListArray {
            colorPalette = colorPalettePlistFile as! [String]
            
            print("TAG IS NOW \(tag)")
            print("SECTION IS NOW \(indexPath.section)")
            print("ROW IS NOW \(indexPath.row)")
            let hexString = colorPalette[cell.tag]
            color = hexStringToUIColor(hexString)
        }
        
        cell.backgroundColor = color
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var colorPalette: Array<String>
        
        // Get colorPalette array from plist file
        let pListArray = NSArray(contentsOfFile: path!)
        if let colorPalettePlistFile = pListArray {
            colorPalette = colorPalettePlistFile as! [String]
            
            let cell: UICollectionViewCell  = collectionView.cellForItemAtIndexPath(indexPath)! as UICollectionViewCell
            let hexString = colorPalette[cell.tag]
            color = hexStringToUIColor(hexString)
            for item in self.view.subviews {
                if let collection = item as? UICollectionView {
                    collection.backgroundColor = color
                    fourthVC.categoryLabel.text = categoryText
                    fourthVC.brandLabel.text = brandText
                    fourthVC.color = color
                }
            }
        }
        self.navigationController?.showViewController(fourthVC, sender: self)
    }

}
