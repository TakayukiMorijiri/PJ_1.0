//
//  iconSecond.swift
//  PJ_1.0
//
//  Created by 森尻尭之 on 2016/06/21.
//  Copyright © 2016年 森尻尭之. All rights reserved.
//

import UIKit

class iconSecond: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var workingCar: UITableView!
    
    var selectedIndex = -1
    
    var workingCarList:[NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
        override func viewWillAppear(animated: Bool) {
            
            //-- json.txtファイルを読み込んで
            let path = NSBundle.mainBundle().pathForResource("JSON_1.0", ofType: "json")
            let jsondata = NSData(contentsOfFile: path!)
            
            //-- 辞書データに変換して
            let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
            
            //--  辞書データの個数だけ繰り返して表示する
            for data in jsonArray {
//                print(data["category"] as! Int)
                if data["category"] as! Int == selectedIndex {
                    print("[\(data["name"])]")
                    workingCarList.append(data as! NSDictionary)
                
                }
            }
        }
        
        // 行数
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return workingCarList.count
        }
        
        // 表示するセルの中身
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
            //cell.textLabel!.text = "\(indexPath.row)行目"
            
            //文字色を茶色にする
            cell.textLabel?.textColor = UIColor.brownColor()
            //矢印を右側につける
            cell.accessoryType = .DisclosureIndicator
            
            let workingName = workingCarList[indexPath.row]["name"] as! String
            
            cell.textLabel!.text = "\(workingName)"
            return cell
            
        }
    
    
    // 選択された時に行う処理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row)行目を選択")
        
        selectedIndex = indexPath.row
        performSegueWithIdentifier("iconDetail",sender: nil)
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//     Segueで画面遷移する時
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if (segue.identifier == "iconDetail"){
            var iconDetailVC = segue.destinationViewController as! iconDetail
            
            iconDetailVC.scSelectedIndex = selectedIndex
        
        }
        
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
