//
//  TimelineTableViewController.swift
//  Twitter
//
//  Created by 福田涼介 on 12/22/15.
//  Copyright © 2015 Ryo. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {
    
    
    @IBOutlet weak var tweetButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NavigationBar settings
        navigationController?.navigationBar.barTintColor = UIColor(red: 85/255, green: 172/255, blue: 238/255, alpha: 1)
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        title = "Timeline"
        self.navigationItem.rightBarButtonItem = tweetButton
        
        //tableVeiwをコンテンツのサイズに合わせて調節する。
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension

        
        //セルのXIBをtableVeiewにレジスター
        let timelineNib = UINib(nibName: "TimelineTableViewCell", bundle: nil)
        tableView.registerNib(timelineNib, forCellReuseIdentifier: Cell.cellIdentifier)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ComposeButton_Clicked(sender: AnyObject) {
        
        self.performSegueWithIdentifier("Show Tweet Screen", sender: self)
    }
    
    @IBAction func showProfileButton_Clicked(sender: AnyObject) {
        
        self.performSegueWithIdentifier("Show Profile", sender: self)
    }
    

    
    // MARK: - Table view data source
    
    struct Cell {
        static let cellIdentifier = "TimeLine Cell"
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Cell.cellIdentifier, forIndexPath: indexPath) as! TimelineTableViewCell


        return cell
    }


}
