//
//  GetTwitterAccountViewController.swift
//  Twitter
//
//  Created by 福田涼介 on 12/22/15.
//  Copyright © 2015 Ryo. All rights reserved.
//

import UIKit
import Accounts
import Social

class GetTwitterAccountViewController: UIViewController {
    
    var accountStore = ACAccountStore()
    var twAccounts = ACAccount()
    var accounts = {ACAccount}()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func getAccountsFromDevice() {
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (success, error) -> Void in
            if error != nil{
                print(error?.localizedDescription)
            }else {
                if !success {
                    print("not athorized")
                    return
                } else {
                    //リクエストが成功した時
                    
                    self.accounts = self.accountStore.accountsWithAccountType(accountType)as! {acaccount}
                    
                    dispatch_async(dispatch_get_main_queue(),{ {} -> void in                        //アカウントを取得した後の処理
                        //アカウントを習得した後の処理
                        self.showAndSelectTwitterAccount()
                    })
                }
            }
        }
    }
    
    
    private func showAndSelectTwitterAccount() {
        
        let alertController = UIAlertController(title: "Select Account", message: "Please select a twitter Account", preferredStyle: .ActionSheet)
        
        if accounts.count == 0 {
            
            let noAccountAlert = UIAlertController(title: "No Acount", message: "Please add twitter account from setting",preferredStyle: .Alert)
            noAccountAlert.addAction(UIAlertAction(title: "Okay", style: .Default, handler:nil))
            
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func logo_Clicked(sender: AnyObject) {
        
        
    }


}
