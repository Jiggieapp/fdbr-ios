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
    private(set) var about = ""
    private(set) var bio = ""
    
    private(set) var hairType = 0
    private(set) var hairTexture = 0
    private(set) var skinType = 0
    private(set) var skinUndertone = 0
    private(set) var skinTone = 0
    
    private(set) var beautyConcerns = BeautyConcerns()
    
    private(set) var totalReviews = 0
    private(set) var totalFollowers = 0
    private(set) var totalFollowing = 0
    private(set) var totalPoints = 0

    
    static func beautyConcernsJSONTransformer() -> NSValueTransformer {
        return MTLJSONAdapter.dictionaryTransformerWithModelClass(BeautyConcerns.self)
    }
    
    static func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return ["id" : "id",
                "username" : "username",
                "fullname" : "fullname",
                "email" : "email",
                "about" : "about",
                "bio" : "bio",
                "hairType" : "skin_hairtype_id",
                "hairTexture" : "hair_texture_id",
                "skinType" : "skin_type_id",
                "skinUndertone" : "skin_undertone_id",
                "skinTone" : "skin_tone_id",
                "beautyConcerns" : "beauty_concern",
                "totalReviews" : "total_review",
                "totalFollowers" : "follower_count",
                "totalFollowing" : "following_count",
                "totalPoints" : "total_point"]
    }
    
}
