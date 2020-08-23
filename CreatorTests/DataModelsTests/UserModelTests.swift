//
//  UserModelTests.swift
//  CreatorTests
//
//  Created by Raghav Sehtia on 8/21/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import XCTest

class UserModelTests: XCTestCase {

    func testUserDataModel_toDictionary_includesUsername() throws {
        let user = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
        
        XCTAssertEqual(user.toDictionary()["userName"] as? String, "ragst3r", "Username must be included in toDictionary")
    }
    
    func testUserDataModel_toDictionary_includesFirstName() throws {
        let user = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
        
        XCTAssertEqual(user.toDictionary()["firstName"] as? String, "raghav", "first name must be included in toDictionary")
    }
    
    func testUserDataModel_toDictionary_includesLastName() throws {
         let user = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
         
         XCTAssertEqual(user.toDictionary()["lastName"] as? String, "sehtia", "last name must be included in toDictionary")
     }
    
    func testUserDataModel_toDictionary_includesType() throws {
         let user = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
         
         XCTAssertEqual(user.toDictionary()["type"] as? String, "FAN", "type must be included in toDictionary")
     }
    
    func testUserDataModel_isEquatable() throws {
         let userOne = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
         let userTwo = User(userName: "ragst3r", firstName: "raghav", lastName: "sehtia", type: User.UserType.FAN)
         
         XCTAssertEqual(userOne, userTwo, "users with equivalent properties must be equal")
     }
}
