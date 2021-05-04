//
//  GFFollowerViewController.swift
//  GithubFollowersProject
//
//  Created by Aaron Cleveland on 5/4/21.
//

import UIKit

class GFFollowerViewController: GFItemInfoViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, with: user.following)
        
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }

}
