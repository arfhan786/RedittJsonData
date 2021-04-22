//
//  RedditNewsFeedViewModel.swift
//  RedditNewsFeed
//
//  Created by Ahmad, Arfhan on 4/22/21.
//

import Foundation

class RedditNewsFeedViewModel {
    
    func getNewsFeedByReddit(after:String,completion: @escaping(_ result: [NewsList]?,_ afterID:String)-> Void) {
        
        let newsFeedRequest = NewsFeedRequest(after: after)
        let newsFeedResource = NewsFeedResource()
        newsFeedResource.getNewsFeedsByReddit(newsFeedRequest: newsFeedRequest) { (newsFeeds) in
            
            let newsFeedList =  newsFeeds?.data?.children
            let afterId:String? = newsFeeds?.data?.after
            _ = completion(newsFeedList,afterId ?? "nul")            
        }
    }
}
