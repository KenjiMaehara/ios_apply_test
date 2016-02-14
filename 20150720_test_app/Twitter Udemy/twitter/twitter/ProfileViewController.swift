//
//  ProfileViewController.swift
//  Twitter
//
//  Created by 福田涼介 on 12/22/15.
//  Copyright © 2015 Ryo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var banner_imageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var screen_nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var numberOfFollowing: UILabel!
    
    @IBOutlet weak var switchSegment: UISegmentedControl!
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timelineNib = UINib(nibName: "MyTimelineTableViewCell", bundle: nil)
        tableView.registerNib(timelineNib, forCellReuseIdentifier: Cell.cellIdentifier)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    struct Cell {
        static let cellIdentifier = "My Timeline Cell"
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Cell.cellIdentifier, forIndexPath: indexPath) as! MyTimelineTableViewCell
        
        return cell
    }
}