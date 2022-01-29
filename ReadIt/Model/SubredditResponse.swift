//
//  SubredditResponse.swift
//  ReadIt
//
//  Created by Shen-Chieh Yen on 1/9/22.
//

import Foundation

struct SubredditResponse: Codable {
    let data: DataInfo
}

struct DataInfo: Codable {
    let children: [ChildrenData]
}

struct ChildrenData: Codable {
    let data: RedditThread
}

struct RedditThread: Codable {
    let subreddit: String?
    let title: String?
}
