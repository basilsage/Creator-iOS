//
//  Reaction.swift
//  Creator
//
//  Created by Raghav Sehtia on 8/24/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation

struct Reaction : Equatable {
    let user: User
    let type: ReactionType
    
    init(user: User, type: ReactionType) {
        self.user = user
        self.type = type
    }
    
    enum ReactionType : String {
        case LIKE
    }
    
    /** Returns dictionary representation of Comment. Used for storing in firebase. */
    func toDictionary() -> NSDictionary {
        return ["user" : user.toDictionary(),
                "type" : type.rawValue]
    }
}
