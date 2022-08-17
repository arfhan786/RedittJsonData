//
//  RedditNewsFeedViewController.swift
//  RedditNewsFeed
//
//  Created by Ahmad, Arfhan on 4/22/21.
//

import UIKit

class RedditNewsFeedViewController: UIViewController {
    
    let redditNewsFeedViewModel: RedditNewsFeedViewModel = RedditNewsFeedViewModel()
    let newsFeedTableView = UITableView()
    var newsFeed:[NewsList] = []
    var newsFeedData : NewsFeed? = nil
    var afterId: String? = nil
    var tempAfterId:String? = nil
    //For Activity INDICATOR
    let child = SpinnerViewController()
    
    var isValidKey:Bool = false
    //this is view didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getNewsFeeds(after: "10")
        view.backgroundColor = .red
        
    }
    
    //MARK:- Initiate View
    private func configureUI(){
        view.backgroundColor = .white
        view.addSubview(newsFeedTableView)
        newsFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        newsFeedTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        newsFeedTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        newsFeedTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        newsFeedTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        newsFeedTableView.backgroundColor = .white
        newsFeedTableView.dataSource = self
        newsFeedTableView.delegate = self
        newsFeedTableView.register(RedditNewsTableViewCell.self, forCellReuseIdentifier: "cell")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Reddit News Feed"
    }
    
    func getNewsFeeds(after:String){
        if Reachability().isConnectedToNetwork() {
            
            // add the spinner view controller
            addChild(child)
            child.view.frame = view.frame
            view.addSubview(child.view)
            child.didMove(toParent: self)
            
            redditNewsFeedViewModel.getNewsFeedByReddit(after: after) { (response,afterId) in
                
                if response != nil {
                    //                    self.newsFeed = response!
                    self.newsFeed =  self.newsFeed + response!
                    print("Response: ",self.newsFeed)
                    self.afterId = afterId
                    print("After Id: ", self.afterId as Any)
                    DispatchQueue.main.async { [self] in
                        self.newsFeedTableView.reloadData()
                        child.willMove(toParent: nil)
                        child.view.removeFromSuperview()
                        child.removeFromParent()
                    }
                } else {
                    DispatchQueue.main.async { [self] in
                        // then remove the spinner view controller
                        child.willMove(toParent: nil)
                        child.view.removeFromSuperview()
                        child.removeFromParent()
                    }
                    // Showing alert in case no record Recived from Api.
                    let alert = UIAlertController(title: "Sorry!", message: "No Record Found", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default) { (action) in
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } else {
            let alert = UIAlertController(title: "No Internet Connection", message: "Please Connect your internet Connection!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
