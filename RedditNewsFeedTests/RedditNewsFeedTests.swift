//
//  RedditNewsFeedTests.swift
//  RedditNewsFeedTests
//
//  Created by Ahmad, Arfhan on 4/22/21.
//

import XCTest
@testable import RedditNewsFeed

class RedditNewsFeedTests: XCTestCase {
    
    func test_NewsFeedResource_ValidRequest_Returns_ValidResponse() {
        //ARANGE
        let httpUtility = HTTPUtility()
        let newsFeedRequest = NewsFeedRequest(after: "10")
        let newsFeedEndpoint = "\(ApiEndpoints.redditListing)?after=\(newsFeedRequest.after)"
        let requestUrl = URL(string:newsFeedEndpoint)!
        let expectation = self.expectation(description: "ValidRequest_Returns_NewsFeedResponse")
        // ACT
        httpUtility.getApiRequest(urlRequest: requestUrl, resultType: NewsFeed.self) { (newsFeedResponse) in
            // ASSERT
            XCTAssertNotNil(newsFeedResponse)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_NewsFeedResource_ValidRequest_Returns_NewsFeedAfterLink_Success() {
        //ARANGE
        let httpUtility = HTTPUtility()
        let newsFeedRequest = NewsFeedRequest(after: "10")
        let newsFeedEndpoint = "\(ApiEndpoints.redditListing)?after=\(newsFeedRequest.after)"
        let requestUrl = URL(string:newsFeedEndpoint)!
        let expectation = self.expectation(description: "ValidRequest_Returns_NewsFeedAfterLink_Success")
        // ACT
        httpUtility.getApiRequest(urlRequest: requestUrl, resultType: NewsFeed.self) { (newsFeedResponse) in
            // ASSERT
            XCTAssertNotNil(newsFeedResponse.data?.after)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_NewsFeedApiResource_With_InvalidUrlFormat_Returns_Error() {
        // ARRANGE
        let httpUtility = HTTPUtility()
        let newsFeedRequest = NewsFeedRequest(after: "&&&")
        let newsFeedEndpoint = "\(ApiEndpoints.redditListingInvalid)?after=\(newsFeedRequest.after)"
        let requestUrl = URL(string:newsFeedEndpoint)!
        // ACT
        httpUtility.getApiRequest(urlRequest: requestUrl, resultType: NewsFeed.self) { (newsFeedResponse) in
            // ASSERT
            XCTAssertNil(newsFeedResponse)
        }
    }
    
    func test_NewsFeedsViewModel_Returns_Valid_NewsFeedsList_And_AfterID() {
        // ARRANGE
        let redditNewsFeedViewModel: RedditNewsFeedViewModel = RedditNewsFeedViewModel()
        let expectation = self.expectation(description: "ValidAfterLink_Returns_NewsFeedList_And_AfterLinkID_Success")
        // ACT
        redditNewsFeedViewModel.getNewsFeedByReddit(after: "10") { (response, afterID) in
            // ASSERT
            XCTAssertNotNil(response)
            XCTAssertNotNil(afterID)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
