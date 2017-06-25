//
//  ViewController.swift
//  PhysicsPropertyDemo
//
//  Created by 刘隆昌 on 2017/6/25.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var array : Array<String> = ["大师球","高级球","超级球","精灵球"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let ballView = TheBallView.init(frame: CGRect.init(x: 0, y: 80, width: 50, height: 50), AndImgName: self.array[Int(arc4random_uniform(4))]);
        self.view.addSubview(ballView);
        ballView.starMotion()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        TheBallTool.shareBallTool().stopMotionUpdates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

