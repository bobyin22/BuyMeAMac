//
//  buyViewController.swift
//  shoppingApp
//
//  Created by 邱慧珊 on 2023/3/20.
//

import Foundation

import UIKit
import AVFoundation //引入背景音樂


class buyViewController: UIViewController {
    
    
    @IBOutlet weak var studentSwitch: UISwitch! //學生專案switch按鈕
    @IBOutlet weak var LabelTotalCost: UILabel! //總價標籤
    @IBOutlet weak var segmentRam: UISegmentedControl!  //記憶體segment按鈕
    @IBOutlet weak var segmentStorage: UISegmentedControl! //儲存裝置segment按鈕
    @IBOutlet weak var LabelAddCost: UILabel!   //加購價標籤
    @IBOutlet weak var LabelNumber: UILabel!    //數量標籤
    @IBOutlet weak var stepper: UIStepper!  //數量stepper按鈕
    @IBOutlet weak var LabelApple: UIImageView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var originFee: Int = 30900
    var ramPlusFee: Int = 0
    var storagePlusFee: Int = 0
    var Index: Int = 0
    var buyNumber: Int = 1
    
    //初始畫面
    override func viewDidLoad() {
        super.viewDidLoad()
//        let coverImg = UIImageView(image: UIImage(named: "封面.png"))
//        coverImg.frame = CGRect(x: 0, y: 0, width: 393, height: 2000)
//        view.insertSubview(coverImg, at: 0)
//
        
        LabelTotalCost.text = String(originFee)
        
    }
    
    //記憶體segment選項
    @IBAction func segmentRamChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            ramPlusFee = 0
            
        } else if sender.selectedSegmentIndex == 1 {
            ramPlusFee = 6000
        }
        updateTotalCost()
    }
    
    //儲存裝置segment選項
    @IBAction func segmentStorageChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            storagePlusFee = 0
        case 1:
            storagePlusFee = 6000
        case 2:
            storagePlusFee = 12000
        case 3:
            storagePlusFee = 24000
        default:
            storagePlusFee = 0
        }
        updateTotalCost()
    }
    
    //學生教育價選項
    @IBAction func studentSwitchChange(_ sender: Any) {
        updateTotalCost()
    }
    
    //數量
    @IBAction func buyNumber(_ sender: UIStepper) {
        LabelNumber.text = Int(sender.value).description
        buyNumber = Int(sender.value)
        updateTotalCost()
    }
    
    //改蘋果顏色
    @IBAction func changeSliderColor(_ sender: Any) {
        LabelApple.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    //每次點選segment或switch按鈕，都要更新價格
    func updateTotalCost() {
        
        let addFee = (ramPlusFee + storagePlusFee) * buyNumber //加價
        let totalFee = (originFee + ramPlusFee + storagePlusFee) * buyNumber    //總價
        
        LabelAddCost.text = String(addFee)  //總價文字
                
        
        //判斷學生專案8.9折
        if studentSwitch.isOn {
            LabelAddCost.text = String(format: "%.0f", Double(addFee) * 0.8997)
            LabelTotalCost.text = String(format: "%.0f", Double(totalFee) * 0.8997)
        } else {
            LabelTotalCost.text = String(totalFee)
        }
    }
    
    
    //下單彈跳視窗
    @IBAction func yesOrder(_ sender: Any) {
        let alert = UIAlertController(title: "賀成交", message: "開始寫扣吧", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"),
                                          style: .default,
                                          handler: { _ in NSLog("The \"OK\" alert occured.")}))
            self.present(alert, animated: true, completion: nil)
    }
    
    
    
}



