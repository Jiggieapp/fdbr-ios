//
//  BeautyConcerns.swift
//  fdbr
//
//  Created by Mohammad Nuruddin Effendi on 8/23/16.
//  Copyright © 2016 Female Daily. All rights reserved.
//

import Mantle

class BeautyConcerns: MTLModel, MTLJSONSerializing {

    private(set) var hair = [Reference]()
    private(set) var skin = [Reference]()
    private(set) var body = [Reference]()
    
    
    static func hairJSONTransformer() -> NSValueTransformer {
        return MTLJSONAdapter.arrayTransformerWithModelClass(Reference.self)
    }
    
    static func skinJSONTransformer() -> NSValueTransformer {
        return MTLJSONAdapter.arrayTransformerWithModelClass(Reference.self)
    }
    
    static func bodyJSONTransformer() -> NSValueTransformer {
        return MTLJSONAdapter.arrayTransformerWithModelClass(Reference.self)
    }
    
    static func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return ["hair" : "hair",
                "skin" : "skin",
                "body" : "body"]
    }
    
}