//
//  NewsFeedModel.swift
//  RedditNewsFeed
//
//  Created by Ahmad, Arfhan on 4/22/21.
//

import Foundation

// MARK: - NewsFeed
struct NewsFeed: Codable {
    var kind: String?
    var data: NewsFeedData?
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case data = "data"
    }
}

// MARK: - NewsFeedData
struct NewsFeedData: Codable {
    var modhash: String?
    var dist: Int?
    var children: [NewsList]?
    var after: String?
    var before: String?
}

// MARK: - Child
struct NewsList: Codable {
    var kind: String?
    var data: ChildData?
}

// MARK: - ChildData
struct ChildData: Codable {
    
    var title: String?
    var thumbnailHeight: Int?
    var ups,thumbnailWidth: Int?
    var score: Int?
    var thumbnail: String?
    var numComments: Int?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case ups
        case thumbnailHeight = "thumbnail_height"
        case thumbnailWidth = "thumbnail_width"
        case score
        case thumbnail
        case numComments = "num_comments"
        case url
        
    }
}
