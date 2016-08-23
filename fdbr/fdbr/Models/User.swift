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
    private(set) var fullname = ""
    private(set) var email = ""
    private(set) var gender = ""
    
    private(set) var hairType = 0
    private(set) var hairTexture = 0
    private(set) var skinType = 0
    private(set) var skinUndertone = 0
    private(set) var skinTone = 0
    
    private(set) var hairConcerns = [0]
    private(set) var skinConcerns = [0]
    private(set) var bodyConcerns = [0]
    
    private(set) var numberOfReviews = 0
    private(set) var numberOfFollowers = 0
    private(set) var numberOfFollowing = 0

    
    static func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return ["" : ""]
    }
    
}
