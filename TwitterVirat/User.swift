//
//  User.swift
//  TwitterVirat
//
//  Created by virat_singh on 4/8/17.
//  Copyright © 2017 viratsingh. All rights reserved.
//

import UIKit

class User: NSObject {
    static let userDidLogoutNotification = "UserDidLogout"

    var dictionary: NSDictionary?
    
    var name: String?
    var screenname: String?
    var tagline: String?
    var profileUrl: URL?
    var profileBackgroundUrl: URL?
    var followersCount: Int64 = 0
    var followingCount: Int64 = 0
    var tweetsCount: Int64 = 0
    
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        tagline = dictionary["description"] as? String
        followersCount = dictionary["followers_count"] as! Int64
        followingCount = dictionary["friends_count"] as! Int64
        tweetsCount = dictionary["statuses_count"] as! Int64
        

        let profileURlString = dictionary["profile_image_url_https"] as! String?
        if let profileURlString = profileURlString {
            profileUrl = URL(string: profileURlString)
        }
        
        let profileBackgroundUrlString = dictionary["profile_background_image_url"] as! String?
        if let profileBackgroundUrlString = profileBackgroundUrlString {
            profileBackgroundUrl = URL(string: profileBackgroundUrlString)
        }
    }
    
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            if _currentUser == nil {
                let defaults = UserDefaults.standard
                
                let userData = defaults.object(forKey: "currentUserData") as? Data
            
                if let userData = userData {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            
            }
            return _currentUser
        }
        set(user) {
            _currentUser = user
            let defaults = UserDefaults.standard
            
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.set(nil, forKey: "currentUserData")
            }
            defaults.synchronize()
        }
    }
}
