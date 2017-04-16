//
//  ProfileViewController.swift
//  TwitterVirat
//
//  Created by virat_singh on 4/8/17.
//  Copyright © 2017 viratsingh. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileView: ProfileView!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (user == nil) {
            user = User.currentUser
        }
        
        profileView.backgroundImageView.setImageWith(user!.profileBackgroundUrl!)
        profileView.profileImageView.setImageWith(user!.profileUrl!)
        profileView.nameLabel.text = user!.name!
        profileView.screenNameLabel.text = "@\(user!.screenname!)"
        profileView.tweetsLabel.text = String(user!.tweetsCount)
        profileView.followingLabel.text = String(user!.followingCount)
        profileView.followersLabel.text = String(user!.followersCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
