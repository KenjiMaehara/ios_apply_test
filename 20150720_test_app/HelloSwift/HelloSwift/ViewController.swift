//
//  ViewController.swift
//  HelloSwift
//
//  Created by 前原健二 on 2015/07/20.
//  Copyright (c) 2015年 前原健二. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //時間計測用の変数.
    var cnt : Float = 0
    
    
    
    @IBOutlet var background: UIView!
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBAction func driver_door_unlock(sender: AnyObject) {
        background.backgroundColor = UIColor.blueColor()
        
        
    }
    @IBOutlet weak var led_active_flash: UILabel!
    
    
    
    @IBAction func sayhello(sender: AnyObject) {
        textfield.text = "Hello world!"
        background.backgroundColor = UIColor.redColor()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //タイマーを作る。
        NSTimer.scheduledTimerWithTimeInterval(0.1,target: self, selector: "onUpdate:",userInfo: nil,repeats: true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onUpdate(timer : NSTimer)
    {
        cnt += 0.1
        
        
        //桁数を指定して文字列を作る.
        let str = "Time:".stringByAppendingFormat("%.1f",cnt)
        
        textfield.text = str



        /*
        if(cnt > 1.0)
        {
            led_active_flash.backgroundColor = UIColor.yellowColor()
        }
        if(cnt > 1.5)
        {
            cnt = 0
        }
        else
        {
            led_active_flash.backgroundColor = UIColor.blackColor()
        }
        */
        
    }

}

