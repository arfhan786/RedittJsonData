//
//  RedditNewsTableViewCell.swift
//  RedditNewsFeed
//
//  Created by Ahmad, Arfhan on 4/22/21.
//

import UIKit

class RedditNewsTableViewCell: UITableViewCell {
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let feedImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        //        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let upScoreImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.clipsToBounds = true
        return img
    }()
    
    let upScoreLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let commentImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.clipsToBounds = true
        return img
    }()
    
    let commentsLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(feedImageView)
        self.contentView.addSubview(upScoreImageView)
        self.contentView.addSubview(upScoreLabel)
        self.contentView.addSubview(commentImageView)
        self.contentView.addSubview(commentsLabel)
        
        nameLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor,constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor ,constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor,constant: -20).isActive = true
        
        feedImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 10).isActive = true
        feedImageView.heightAnchor.constraint(equalToConstant:200).isActive = true
        feedImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        feedImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        
        upScoreImageView.topAnchor.constraint(equalTo: feedImageView.bottomAnchor,constant: 10).isActive = true
        upScoreImageView.heightAnchor.constraint(equalToConstant:25).isActive = true
        upScoreImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        upScoreImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:30).isActive = true
        
        upScoreLabel.topAnchor.constraint(equalTo: feedImageView.bottomAnchor,constant: 10).isActive = true
        upScoreLabel.heightAnchor.constraint(equalToConstant:22).isActive = true
        upScoreLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        upScoreLabel.centerYAnchor.constraint(equalTo:upScoreImageView.centerYAnchor).isActive = true
        upScoreLabel.leadingAnchor.constraint(equalTo:upScoreImageView.trailingAnchor, constant:10).isActive = true
        
        commentImageView.topAnchor.constraint(equalTo: feedImageView.bottomAnchor,constant: 10).isActive = true
        commentImageView.heightAnchor.constraint(equalToConstant:25).isActive = true
        commentImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        commentImageView.leadingAnchor.constraint(equalTo:upScoreLabel.trailingAnchor, constant:30).isActive = true
        
        commentsLabel.topAnchor.constraint(equalTo: feedImageView.bottomAnchor,constant: 10).isActive = true
        commentsLabel.heightAnchor.constraint(equalToConstant:20).isActive = true
        commentsLabel.centerYAnchor.constraint(equalTo:commentImageView.centerYAnchor).isActive = true
        commentsLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        commentsLabel.leadingAnchor.constraint(equalTo:commentImageView.trailingAnchor, constant:10).isActive = true
    }
}
