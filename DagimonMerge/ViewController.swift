//
//  ViewController.swift
//  DagimonMerge
//
//  Created by 連振甫 on 2021/7/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var element1: UIImageView!
    @IBOutlet weak var element2: UIImageView!
    @IBOutlet weak var combine: UIImageView!
    @IBOutlet weak var combineSlider: UISlider!
    var tmpMove:CGFloat = 0
    let player = AVPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        combineSlider.minimumValue = Float(element1.frame.width/2)
        combineSlider.maximumValue = Float(view.center.x)
        tmpMove = element1.center.x
        combine.alpha = 0
        
        player.replaceCurrentItem(with: AVPlayerItem(url:URL(string:"https://drive.google.com/uc?export=download&id=1BDPH4TgsHrgzWEe5gBsmKrdnETAzS39A")!))
        player.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func combineAction(_ sender: UISlider) {
        element1.center.x = CGFloat(sender.value)
        let move = CGFloat(sender.value) - tmpMove
        element2.center.x -= move
        tmpMove = CGFloat(sender.value)
        
        element1.alpha = (element2.center.x - element1.center.x) * 0.005
        element2.alpha = (element2.center.x - element1.center.x) * 0.005
        
        combine.alpha = 1 - element1.alpha
        
    }
    
}

