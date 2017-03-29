//
//  ViewController.swift
//  testTouchView20170326
//
//  Created by 前原健二 on 2017/03/26.
//  Copyright © 2017年 前原健二. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pushButtonNextPage(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewControllerWithIdentifier("next") as! NextViewController
        self.presentViewController(nextView, animated: true, completion: nil)

    }
}

