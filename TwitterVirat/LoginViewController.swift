//
//  LoginViewController.swift
//  TwitterVirat
//
//  Created by virat_singh on 4/7/17.
//  Copyright © 2017 viratsingh. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        TwitterClient.sharedInstance.login(success: {
            let appDelegate = UIApplication.shared.delegate!

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let hamburgerViewController = storyboard.instantiateViewController(withIdentifier: "HamburgerViewController") as! HamburgerViewController
            appDelegate.window!?.rootViewController = hamburgerViewController
            
            let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            menuViewController.hamburgerViewController = hamburgerViewController;
            hamburgerViewController.menuViewController = menuViewController;

        }) { (error: Error) in
            print(error.localizedDescription)
        }


    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
