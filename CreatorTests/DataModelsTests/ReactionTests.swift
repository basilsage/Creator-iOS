//
//  ReactionTests.swift
//  Creator
//
//  Created by Raghav Sehtia on 8/24/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import XCTest

class ReactionTests: XCTestCase {

    func testReaction_toDictionary_includesType() {
        let user = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
        
        let reaction = Reaction(user: user, type: Reaction.ReactionType.LIKE, createdAtSeconds: 1598227200 /** Aug 24, 2020 */)
        
        XCTAssertEqual(reaction.toDictionary()["type"] as? String, "LIKE", "type must be included in toDictionary")
    }
    
    func testReaction_toDictionary_includesUserDictionary() {
        let user = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
        
        let reaction = Reaction(user: user, type: Reaction.ReactionType.LIKE, createdAtSeconds: 1598227200 /** Aug 24, 2020 */)
        
        XCTAssertEqual(reaction.toDictionary()["user"] as? NSDictionary, user.toDictionary() as NSDictionary, "user must be included in toDictionary")
    }
    
    func toReaction_toDictionary_includesCreatedAtSeconds() {
        let user = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
        
        let reaction = Reaction(user: user, type: Reaction.ReactionType.LIKE, createdAtSeconds: 1598227200 /** Aug 24, 2020 */)
        
        XCTAssertEqual(reaction.toDictionary()["createdAtSeconds"] as? NSNumber, 1598227200, "createdAtSeconds must be included in toDictionary")
    }
    
    func testReaction_isEquatable() {
        let user = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
        let reactionOne = Reaction(user: user, type: Reaction.ReactionType.LIKE, createdAtSeconds: 1598227200 /** Aug 24, 2020 */)
        let reactionTwo = Reaction(user: user, type: Reaction.ReactionType.LIKE, createdAtSeconds: 1598227200 /** Aug 24, 2020 */)
               
        XCTAssertEqual(reactionOne, reactionTwo, "Reactions with equivalent properties must be equal")
    }

}
