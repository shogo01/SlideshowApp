//
//  ResultViewController.swift
//  Slideshow App
//
//  Created by USER on 2020/06/11.
//  Copyright © 2020 shogo.ujiie. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var back2: UIButton!
    // 受け取るためのプロパティ（変数）を宣言しておく
    var x:UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.image = x
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
