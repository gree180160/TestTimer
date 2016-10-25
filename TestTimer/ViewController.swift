//
//  ViewController.swift
//  TestTimer
//
//  Created by WillowRivers on 16/10/25.
//  Copyright © 2016年 WillowRivers. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var button : UIButton!
    var count = 1 ;
    var timer : Timer? ;
    override func viewDidLoad() {
        super.viewDidLoad() ;
        button = UIButton(frame: CGRect(x: 5 , y: 5 , width: 170 , height: 100)) ;
        button.setTitle("STOP" , for: .normal) ;
        button.backgroundColor = UIColor.blue ;
        button.addTarget("self", action: #selector(ViewController.stopTimer), for: .touchUpInside) ;
        timer = Timer(timeInterval: 1 , target: self , selector: #selector(ViewController.updateCount), userInfo: nil , repeats: true) ;
        RunLoop.current.add(timer! , forMode: .commonModes) ;
        //timer.fireDate = Date.distantPast ;
        
        view.addSubview(button) ;
        // Do any additional setup after loading the view, typically from a nib.
    }
    func updateCount() -> Void {
        print("now count is \(self.count)") ;
        self.count += 1 ;
    }
    func stopTimer() -> Void {
        timer?.fireDate = Date.distantFuture ;
        print("timer is valid :\(timer?.isValid)") ;
        timer?.invalidate() ;
        timer = nil ;
        print("timer is valid :\(timer?.isValid)") ;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

