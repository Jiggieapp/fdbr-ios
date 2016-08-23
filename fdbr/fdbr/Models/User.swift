//
//  User.swift
//  fdbr
//
//  Created by Mohammad Nuruddin Effendi on 8/23/16.
//  Copyright © 2016 Female Daily. All rights reserved.
//

import Mantle

class User: MTLModel, MTLJSONSerializing {
    
    private(set) var id = 0
    private(set) var username = ""
    private(set) var fullname = ""
    private(set) var email = ""
    private(set) var gender = ""
    private(set) var about = ""
    private(set) var bio = ""
    
    private(set) var hairType = 0
    private(set) var hairTexture = 0
    private(set) var skinType = 0
    private(set) var skinUndertone = 0
    private(set) var skinTone = 0
    
    private(set) var hairConcerns = [AnyObject]()
    private(set) var skinConcerns = [AnyObject]()
    private(set) var bodyConcerns = [AnyObject]()
    
    private(set) var numberOfReviews = 0
    private(set) var numberOfFollowers = 0
    private(set) var numberOfFollowing = 0
    
    private(set) var totalPoints = 0

    
    static func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return ["id" : "user_id",
                "username" : "username",
                "fullname" : "fullname",
                "email" : "email",
                "gender" : "user_gender",
                "about" : "user_about",
                "bio" : "user_bio",
                "hairType" : "user_haityp_id",
                "hairTexture" : "user_haitex_id",
                "skinType" : "skintype_id",
                "skinUndertone" : "skinun_id",
                "skinTone" : "skintone_id",
                "hairConcerns" : "user_haicon_id",
                "skinConcerns" : "user_skicon_id",
                "bodyConcerns" : "user_bodcon_id",
                "numberOfReviews" : "reviewnum",
                "numberOfFollowers" : "user_count_follower",
                "numberOfFollowing" : "user_count_following",
                "totalPoints" : "user_total_point"]
    }
    
}
