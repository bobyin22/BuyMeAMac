//
//  buyRandomViewController.swift
//  shoppingApp
//
//  Created by 邱慧珊 on 2023/3/21.
//

import Foundation
import UIKit

class buyRandomViewController: UIViewController {
    
    @IBOutlet weak var laptopPhotoLabel: UIImageView!
    
    var laptopArray = ["微軟","華碩","宏碁","雷蛇","聯想","微星","三星","華偉"
    ]
    var index: Int = 0
    
    //初始畫面
    override func viewDidLoad() {
        super.viewDidLoad()
        laptopPhotoLabel.image = UIImage(named: "華偉.png")
    }
    
    
    @IBAction func touchRandomIndex(_ sender: Any) {
        index =  Int.random(in: 0..<5)
        laptopPhotoLabel.image = UIImage(named: laptopArray[index])
    }
    
    //點選空白處時會觸發 controller 的 touchesEnded
    //touchesEnded 裡呼叫 endEditing 收鍵盤
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) { view.endEditing(true)
        
    }
    
}
