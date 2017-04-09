//
//  TweetCell.swift
//  TwitterVirat
//
//  Created by virat_singh on 4/8/17.
//  Copyright © 2017 viratsingh. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            nameLabel.text = tweet.user!.name!
            profileImageView.setImageWith(tweet.user!.profileUrl!)
            tweetLabel.text = tweet.text
            screenNameLabel.text = tweet.user!.screenname!
            
            // Set the date
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yy"
            dateLabel.text = formatter.string(from: tweet.timestamp!)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
