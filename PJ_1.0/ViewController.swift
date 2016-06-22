//
//  ViewController.swift
//  PJ_1.0
//
//  Created by 森尻尭之 on 2016/06/15.
//  Copyright © 2016年 森尻尭之. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TopImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 表示する画像を設定する.
        let myImage = UIImage(named:"バックホウmain.png")
        
        // 画像をUIImageViewに設定する.
        TopImageView.image = myImage
        
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(TopImageView)
    }

    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

