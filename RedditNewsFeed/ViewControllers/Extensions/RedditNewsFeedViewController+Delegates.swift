//
//  RedditNewsFeedViewController+Delegates.swift
//  RedditNewsFeed
//
//  Created by Ahmad, Arfhan on 4/22/21.
//

import UIKit
import SDWebImage

extension RedditNewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RedditNewsTableViewCell
        
        let newsFeedData = newsFeed[indexPath.row].data
        cell.nameLabel.text = newsFeedData?.title
        
        cell.feedImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        cell.feedImageView.sd_setImage(with: URL(string: (newsFeedData?.thumbnail!)!), placeholderImage: UIImage(named: "placeHolder"))
        
        cell.upScoreImageView.image = UIImage(named: "up")
        cell.upScoreLabel.text   = "\(newsFeedData?.score ?? 0)"
        cell.commentImageView.image = UIImage(named: "comment")
        cell.commentsLabel.text   = "\(newsFeedData?.numComments ?? 0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        print("New after ID: ",self.afterId as Any)
        print("Old after ID: ",self.tempAfterId as Any)
        
        if indexPath.row == newsFeed.count-1  || self.afterId == self.tempAfterId { //you might decide to load sooner than -1 I guess...
            //load more into data here
            print(self.afterId!)
            self.tempAfterId = self.afterId
            print("New after ID: IN ",self.afterId as Any)
            print("Old after ID:  IN ",self.tempAfterId as Any)
            self.getNewsFeeds(after: self.afterId!)
        } else {
            return
        }
    }
}
