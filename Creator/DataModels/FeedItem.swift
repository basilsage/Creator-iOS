//
//  FeedItem.swift
//  Creator
//
//  Created by Raghav Sehtia on 8/25/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation

/** Warning! Incomplete struct - not ready for use. */
struct FeedItem : Equatable {
    
    let title: String
    let author: String
    var reactions: [Reaction]
    var comments: [Comment]
    let createdAtSeconds : NSNumber
    
    init(title: String, author: String, createdAtSeconds: NSNumber) {
        self.title = title
        self.author = author
        self.createdAtSeconds = createdAtSeconds
        self.reactions = []
        self.comments = []
    }
    
    mutating func addComment(comment: Comment) {
        self.comments.append(comment)
    }
    
    mutating func addReaction(reaction : Reaction) {
        self.reactions.append(reaction)
    }
}
