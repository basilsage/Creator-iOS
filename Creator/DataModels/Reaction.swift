//
//  Reaction.swift
//  Creator
//
//  Created by Raghav Sehtia on 8/24/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation

struct Reaction : Equatable {

    // Currently based on hash of userName and reaction type.
    private var _id: String!
      var id: String {
          return _id
      }
    
    let user: User
    let type: ReactionType
    // The time this comment was created in milliseconds since Epoch
    let createdAtSeconds: NSNumber
    
    init(user: User, type: ReactionType, createdAtSeconds: NSNumber) {
        self.user = user
        self.type = type
        self.createdAtSeconds = createdAtSeconds
        self._id = createUniqueId()
    }
    
    enum ReactionType : String {
        case LIKE
    }
    
    /** Returns dictionary representation of Comment. Used for storing in firebase. */
    func toDictionary() -> Dictionary<String, Any> {
        return [
            "user" : user.toDictionary(),
            "type" : type.rawValue,
            "createdAtSeconds" : createdAtSeconds
        ]
    }
    
    /**
     * Returns a unique id based on the hash of the userName and reaction type.
     *
     * This way this unique id is created means a user can only have one type of reaction on a specific item.
     * E.g. User "beeteem" can only like feed item X, not like and love feedItem X.
     */
    func createUniqueId() -> String {
        let userNameReaction = user.userName + type.rawValue
        return String(userNameReaction.hashValue)
    }
    
}
