//
//  NewsFeedResource.swift
//  RedditNewsFeed
//
//  Created by Ahmad, Arfhan on 4/22/21.
//

import Foundation

struct NewsFeedResource {
    
    func getNewsFeedsByReddit(newsFeedRequest: NewsFeedRequest, completion: @escaping(_ result : NewsFeed?) -> Void){
        let httpUtility = HTTPUtility()
        let newsFeedEndpoint = "\(ApiEndpoints.redditListing)?after=\(newsFeedRequest.after)"
        print(newsFeedEndpoint)
        let requestUrl = URL(string:newsFeedEndpoint)!
        httpUtility.getApiRequest(urlRequest: requestUrl, resultType: NewsFeed.self) { (newsFeedResponse) in
            _ = completion(newsFeedResponse)
        }        
    }
}
