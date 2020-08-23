//
//  Comment.swift
//  Creator
//
//  Created by Raghav Sehtia on 8/19/20.
//  Copyright © 2020 Creator. All rights reserved.
//

import Foundation

struct Comment : Equatable {
    let user: User
    // The time this comment was created in milliseconds since Epoch
    let createdAtSeconds: NSNumber
    let body: String
//    let reactions : NSArray

    init(user: User, createdAtSeconds: NSNumber, body: String) {
        self.user = user
        self.createdAtSeconds = createdAtSeconds
        self.body = body
//        self.reactions = reactions
    }
    
    /** Returns dictionary representation of Comment. Used for storing in firebase. */
    func toDictionary() -> NSDictionary {
        return [
            "user": user.toDictionary(),
            "body": body,
            "createdAtSeconds" : createdAtSeconds
//            "reactions" : reactions
        ]
    }

    
    static func == (lhs: Comment, rhs: Comment) -> Bool {
          return lhs.user == rhs.user &&
            lhs.createdAtSeconds == rhs.createdAtSeconds &&
            lhs.body == rhs.body
//            && lhs.reactions == rhs.reactions
      }
}

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
