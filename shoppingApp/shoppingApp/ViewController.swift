//
//  ViewController.swift
//  shoppingApp
//
//  Created by 邱慧珊 on 2023/3/20.
//

import UIKit
import AVFoundation //引入背景音樂

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playMusic()
    }
    //加上音樂
    let player = AVPlayer()
    var looper: AVPlayerLooper?
    func playMusic() {
        let url = Bundle.main.url(forResource: "廣告音樂", withExtension: "mp3")!
        let player = AVQueuePlayer()
        let item = AVPlayerItem(url: url)
        looper = AVPlayerLooper(player: player, templateItem: item)
        player.play()
    }
    

    
}

