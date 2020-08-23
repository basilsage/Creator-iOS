//
//  UserModel.swift
//  Creator
//
//  Created by Raghav Sehtia on 8/19/20.
//  Copyright © 2020 Creator. All rights reserved.
//

import Foundation

struct User : Equatable {
    // Currently based on hash of userName. Will need to set this externally by checking
    // uniquness with previously saved userNames.
    private var _id: String!
      var id: String {
          return _id
      }
    // Unique username of this user. Uniquness is not implemented yet.
    let userName: String
    let firstName: String
    let lastName: String
    let type: UserType
    
    init(userName: String, firstName: String, lastName: String, type: UserType) {
        self.userName = userName
        self.firstName = firstName
        self.lastName = lastName
        self.type = type
        self._id = createUniqueUserId()
    }
    
    // TODO(sehtia): check if non-strings need to be stored in firebase).
    
    func toDictionary() -> NSDictionary  {
        return [
            "id" : self.id,
            "userName" : self.userName,
            "firstName" : self.firstName,
            "lastName" : self.lastName,
            "type" : self.type.rawValue
        ]
    }
    
    private func createUniqueUserId() -> String {
        return String(self.userName.hashValue)
    }
    
    enum UserType : String {
        case CREATOR
        case FAN
    }
}
