//
//  Reference.swift
//  fdbr
//
//  Created by Mohammad Nuruddin Effendi on 8/23/16.
//  Copyright © 2016 Female Daily. All rights reserved.
//

import Mantle

class Reference: MTLModel, MTLJSONSerializing {
    
    private(set) var id = Int()
    private(set) var name = String()
    
    
    static func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return ["id" : "id",
                "name" : "name"]
    }
    
}
