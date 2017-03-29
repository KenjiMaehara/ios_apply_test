//
//  ViewController.swift
//  proxyView20160510
//
//Users/maeharakenji/Desktop/img_iccard.png/  Created by 前原健二 on 2016/05/10.
//  Copyright © 2016年 前原健二. All rights reserved.
//

import UIKit
//import Cocoa

class UserAreaViewController: UIViewController {

    //let dateLabel = UILabel()  // 日時表示ラベル
    
    
    
    @IBOutlet weak var tokeiLabel: UILabel!
    
    
    // 日時フォーマット
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        /*
        // 日時をラベルに表示する
        var ima = self.getDate()
        self.tokeiLabel.text = "日時： \(ima)"
        self.tokeiLabel.textColor = UIColor.purpleColor()
        */
        
        
        
        //dateLabel.frame = view.bounds
        //dateLabel.textAlignment = .Center
        //view.addSubview(dateLabel)
        //view.addSubview(tokeiLabel)
        
        // 初回
        updateDateLabel()
        
        
        // 一定間隔で実行
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UserAreaViewController.updateDateLabel), userInfo: nil, repeats: true)
        
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    var j=0
    
    // 日時表示ラベル更新メソッド
    func updateDateLabel(){
        
        //j++
        
        
        
        let now = Date()
        //dateLabel.text = dateFormatter.stringFromDate(now)
        tokeiLabel.text = dateFormatter.string(from: now)
        
        //self.tokeiLabel.text = dateFormatter.stringFromDate(now)
 
        
 
    }
 
    
    
    /*
    // 日時を取得する
    func getDate()->NSString {
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US") // ロケールの設定
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss" // 日付フォーマットの設定
        var thisDate = dateFormatter.stringFromDate(now)
        return thisDate
    }
    */
 

}

