//
//  ViewController.swift
//  HelloSwift
//
//  Created by 前原健二 on 2015/07/20.
//  Copyright (c) 2015年 前原健二. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var background: UIView!
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBAction func driver_door_unlock(sender: AnyObject) {
        background.backgroundColor = UIColor.blueColor()
        
        
    }
    
    
    
    @IBAction func sayhello(sender: AnyObject) {
        textfield.text = "Hello world!"
        background.backgroundColor = UIColor.redColor()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

