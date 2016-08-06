//
//  ViewController.swift
//  CollectionView
//
//  Created by Luyuan Xing on 8/6/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    let topsArray = ["Tank top", "Sleeveless", "T-Shirt", "Long sleeve", "3/4 sleeve", "Button Down", "Blouse", "Tunic", "Collarless", "Sweatshirt", "Cardigan", "Sweater", "Vest"]
    
    let bottomsArray = ["Shorts", "Capris", "Skirt", "Pencil Skirt", "Skinny jeans", "Bootleg Jeans", "Bellbottom Jeans", "Khakis", "Dress pants", "Wideleg", "Leggings"]
    
    var array = []
    
    let secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(100, 100)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: CGRectMake(0, 0, screenWidth, screenHeight), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)
        
    }


    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topsArray.count + bottomsArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        array = topsArray + bottomsArray
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        label.numberOfLines = 0
        label.textAlignment = .Center
        label.backgroundColor = .orangeColor()
        
        label.text = "\(array[indexPath.row])"
        
        cell.contentView.addSubview(label)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        secondVC.categoryText = array[indexPath.row] as! String
        self.navigationController?.showViewController(secondVC, sender: self)
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

