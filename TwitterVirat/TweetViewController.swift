//
//  TweetViewController.swift
//  TwitterVirat
//
//  Created by virat_singh on 4/8/17.
//  Copyright © 2017 viratsingh. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = tweet.user!.name!
        userImageView.setImageWith(tweet.user!.profileUrl!)
        tweetLabel.text = tweet.text
        screenNameLabel.text = tweet.user!.screenname!
        retweetsLabel.text = String(tweet.retweetCount)
        favoritesLabel.text = String(tweet.favoritesCount)
        
        // Set the date
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy, mm:ss Z"
        dateLabel.text = formatter.string(from: tweet.timestamp!)

        // Do any additional setup after loading the view.
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
