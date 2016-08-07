//
//  SecondViewController.swift
//  CollectionView
//
//  Created by Luyuan Xing on 8/6/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let label = UILabel()
    let labelHeight: CGFloat = 150
    let brandArray = ["GAP", "H&M", "Flea Market", "J.Crew", "Urban Outfitters", "American Eagle", "Lululemon", "Banana Republic", "Old Navy", "Express", "Uniqlo", "Don't Remember"]
    
    let thirdVC = ThirdViewController()
    
    var categoryText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .whiteColor()
        
        label.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.maxY)!, self.view.frame.width, labelHeight)
        label.textAlignment = .Center
        label.numberOfLines = 1
        label.backgroundColor = .orangeColor()
        self.view.addSubview(label)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(100, 100)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: CGRectMake(0, self.label.frame.maxY, self.view.frame.width, self.view.frame.height-labelHeight), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)
    }

    override func viewWillAppear(animated: Bool) {
        label.text = categoryText
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        label.numberOfLines = 0
        label.textAlignment = .Center
        label.backgroundColor = .greenColor()
        
        label.text = "\(brandArray[indexPath.row])"
        
        cell.contentView.addSubview(label)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        thirdVC.categoryText = self.categoryText
        thirdVC.brandText = brandArray[indexPath.row]
        self.navigationController?.showViewController(thirdVC, sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
