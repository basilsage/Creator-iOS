//
//  CommentTests.swift
//  CreatorTests
//
//  Created by Raghav Sehtia on 8/21/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import XCTest

class CommentTests: XCTestCase {
    
//    func testComment_toDictionary_includesUser() {
//        let reactionUser = User(userName: "redscare", firstName: "DJ", lastName: "Satoda", type: User.UserType.FAN)
//        let reaction = Reaction(user: reactionUser, type: Reaction.ReactionType.LIKE)
//        let commentUser = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
//        let comment = Comment(user: commentUser, createdAtSeconds: 1598054400 /** Aug 22, 2020 */, body: "body comment", reactions: [reaction])
//
//        XCTAssertEqual(comment.toDictionary()["user"] as? User, commentUser, "user must be included in toDictionary")
//    }
//
//    func testComment_toDictionary_includesCreatedAtSeconds() {
//        let reactionUser = User(userName: "redscare", firstName: "DJ", lastName: "Satoda", type: User.UserType.FAN)
//        let reaction = Reaction(user: reactionUser, type: Reaction.ReactionType.LIKE)
//        let commentUser = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
//        let comment = Comment(user: commentUser, createdAtSeconds: 1598054400, body: "body comment", reactions: [reaction])
//
//        XCTAssertEqual(comment.toDictionary()["createdAtSeconds"] as? UInt64, 1598054400 /** Aug 22, 2020 */, "createdAtSeconds must be included in toDictionary")
//    }
//
//    func testComment_toDictionary_includesBody() {
//        let reactionUser = User(userName: "redscare", firstName: "DJ", lastName: "Satoda", type: User.UserType.FAN)
//        let reaction = Reaction(user: reactionUser, type: Reaction.ReactionType.LIKE)
//        let commentUser = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
//        let comment = Comment(user: commentUser, createdAtSeconds: 1598054400 /** Aug 22, 2020 */, body: "body comment", reactions: [reaction])
//
//        XCTAssertEqual(comment.toDictionary()["body"] as? String, "body comment", "body must be included in toDictionary")
//    }
//
//    func testComment_toDictionary_includesReactions() {
//        let reactionUser = User(userName: "redscare", firstName: "DJ", lastName: "Satoda", type: User.UserType.FAN)
//        let commentUser = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
//        let reactionOne = Reaction(user: reactionUser, type: Reaction.ReactionType.LIKE)
//        let reactionTwo = Reaction(user: reactionUser, type: Reaction.ReactionType.LIKE)
//
//        let comment = Comment(user: commentUser, createdAtSeconds: 1598054400 /** Aug 22, 2020 */, body: "body comment", reactions: [reactionOne, reactionTwo])
//
//        XCTAssertEqual(comment.toDictionary()["reactions"] as? Array, [reactionOne, reactionTwo], "Array must be included in toDictionary")
//    }
//
//    func testComment_isEquatable() {
//        let reactionUser = User(userName: "redscare", firstName: "DJ", lastName: "Satoda", type: User.UserType.FAN)
//        let reaction = Reaction(user: reactionUser, type: Reaction.ReactionType.LIKE)
//        let commentUser = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
//
//        let commentOne = Comment(user: commentUser, createdAtSeconds: 1598054400 /** Aug 22, 2020 */, body: "body comment", reactions: [reaction])
//        let commentTwo = Comment(user: commentUser, createdAtSeconds: 1598054400 /** Aug 22, 2020 */, body: "body comment", reactions: [reaction])
//
//        XCTAssertEqual(commentOne, commentTwo, "Comments with equivalent properties must be equal")
//    }
}
