//
//  Model.swift
//  Notes
//
//  Created by Ryan Plitt on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class Note: Equatable {
    
    private let kBody = "BodyKey"
    
    let body: String
    
    init(body: String) {
        self.body = body
    }
    
    init?(dictionary: [String:AnyObject]){
        guard let body = dictionary[kBody] as? String else {
            return nil
        }
        self.body = body
    }
    
    var dictionaryCopy: [String:AnyObject] {
        return [kBody:body]
    }
    
    
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.body == rhs.body
}