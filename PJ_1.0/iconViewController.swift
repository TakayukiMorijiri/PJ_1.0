//
//  iconViewController.swift
//  PJ_1.0
//
//  Created by 森尻尭之 on 2016/06/20.
//  Copyright © 2016年 森尻尭之. All rights reserved.
//

import UIKit

class iconViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var working_car_Image = ["000.png","001.png","002.png","003.png","004.png","005.png","006.png"]
    var selectedIndex = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myCollectionView.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    //グルーピングの数 セクション
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //表示個数の設定
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return working_car_Image.count
    }
    
    //セルの表示
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:iconCustomCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! iconCustomCell
        
        cell.title.text = "タイトル\(indexPath.row)"
        cell.image.image = UIImage(named:working_car_Image[indexPath.row])
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row)番目")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
        func collectionView(collectionView: UICollectionView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            print("\(indexPath.row)個目を選択")
            
            selectedIndex = indexPath.row
            performSegueWithIdentifier("iconSecond",sender: nil)
        }
        
        // Segueで画面遷移する時
//        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//            var secondVC = segue.destinationViewController as! iconSecond
//            
//            secondVC.scSelectedName = selectedName
//        }
    
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}