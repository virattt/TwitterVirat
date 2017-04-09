//
//  Tweet.swift
//  TwitterVirat
//
//  Created by virat_singh on 4/8/17.
//  Copyright © 2017 viratsingh. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
//    var userName: String?
//    var userScreenName: String?
    var text: String?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var timestamp: Date?
//    var userImageUrl: URL?
    var user: User?
    
    init(dictionary: NSDictionary) {
        let userDict = dictionary["user"] as! NSDictionary
        user = User(dictionary: userDict)
        
        text = dictionary["text"] as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        let timeStampString = dictionary["created_at"] as? String
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        
        if let timeStampString = timeStampString {
            timestamp = formatter.date(from: timeStampString)
        }
        
//        let user = dictionary["user"] as! NSDictionary
//        userName = user["name"] as? String
//        userScreenName = "@\(user["screen_name"] as! String)"
//
//        let userImageString = user["profile_image_url_https"] as! String?
//        
//        if let userImageString = userImageString {
//            userImageUrl = URL(string: userImageString)
//        }
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
        }
        
        return tweets
    }
    
    class func userFromTweet(tweet: Tweet) {
//        let dictionary = tweet["user"]
//        var user: User()
//        user.followersCount = tweet
    }
}

