//
//  User.swift
//  fdbr
//
//  Created by Mohammad Nuruddin Effendi on 8/23/16.
//  Copyright © 2016 Female Daily. All rights reserved.
//

import Mantle

class User: MTLModel, MTLJSONSerializing {
    
    private(set) var id = Int()
    private(set) var username = String()
    private(set) var fullname = String()
    private(set) var email = String()
    private(set) var about = String()
    private(set) var bio = String()
    
    private(set) var hairType = Int()
    private(set) var hairTexture = Int()
    private(set) var skinType = Int()
    private(set) var skinUndertone = Int()
    private(set) var skinTone = Int()
    
    private(set) var beautyConcerns = BeautyConcerns()
    
    private(set) var totalReviews = Int()
    private(set) var totalFollowers = Int()
    private(set) var totalFollowing = Int()
    private(set) var totalPoints = Int()

    
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
