//
//  ProfileViewController.swift
//  TwitterVirat
//
//  Created by virat_singh on 4/8/17.
//  Copyright © 2017 viratsingh. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backgroundImageView.setImageWith(user!.profileBackgroundUrl!)
        profileImageView.setImageWith(user!.profileUrl!)
        nameLabel.text = user!.name!
        screenNameLabel.text = "@\(user!.screenname!)"
        tweetCountLabel.text = String(user!.tweetsCount)
        followingCountLabel.text = String(user!.followingCount)
        followersCountLabel.text = String(user!.followersCount)
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
