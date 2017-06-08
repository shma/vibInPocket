//
//  ViewController.swift
//  vibInPocket
//
//  Created by Matsuno Shunya on 2017/06/08.
//  Copyright © 2017年 Matsuno Shunya. All rights reserved.
//

import UIKit
import AudioToolbox
import CoreMotion

class ViewController: UIViewController {
    
    var myMotionManager: CMMotionManager!
    let threshold = 0.49
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Labelを作成.
        let myXLabel: UILabel = UILabel()
        myXLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myXLabel.backgroundColor = UIColor.blue
        myXLabel.layer.masksToBounds = true
        myXLabel.layer.cornerRadius = 10.0
        myXLabel.textColor = UIColor.white
        myXLabel.shadowColor = UIColor.gray
        myXLabel.textAlignment = NSTextAlignment.center
        myXLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        
        let myYLabel: UILabel = UILabel()
        myYLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myYLabel.backgroundColor = UIColor.orange
        myYLabel.layer.masksToBounds = true
        myYLabel.layer.cornerRadius = 10.0
        myYLabel.textColor = UIColor.white
        myYLabel.shadowColor = UIColor.gray
        myYLabel.textAlignment = NSTextAlignment.center
        myYLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 280)
        
        let myZLabel: UILabel = UILabel()
        myZLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myZLabel.backgroundColor = UIColor.red
        myZLabel.layer.masksToBounds = true
        myZLabel.layer.cornerRadius = 10.0
        myZLabel.textColor = UIColor.white
        myZLabel.shadowColor = UIColor.gray
        myZLabel.textAlignment = NSTextAlignment.center
        myZLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 360)
        
        // Viewの背景色を青にする.
        self.view.backgroundColor = UIColor.cyan
        
        // ViewにLabelを追加.
        self.view.addSubview(myXLabel)
        self.view.addSubview(myYLabel)
        self.view.addSubview(myZLabel)
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        myMotionManager.gyroUpdateInterval = 0.1
        
        // 加速度の取得を開始.
        myMotionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler:
            {(motion, error) in
                guard let data = motion else {
                    return
                }
                
                myXLabel.text = "x=\(data.gravity.x)"
                myYLabel.text = "y=\(data.gravity.y)"
                myZLabel.text = "z=\(data.gravity.z)"
                if (data.gravity.y > self.threshold) {
                    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                }
        })
    }
    

    
    
    
    





}

