//
//  GFButton.swift
//  GithubFollowersProject
//
//  Created by Aaron Cleveland on 4/28/21.
//

import UIKit

class GFButton: UIButton {
    
    // Subclass of UIButton we would need to overwrite the init if we want to customize it ** Programmatic UI **
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    // Required Init is needed with the above override init. ** Storyboard UI **
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    // Configure will only be available to this class GFButton
    private func configure() {
        layer.cornerRadius = 10
        // setTitleColor(.white, for: .normal) ; You do not need to set this as the default color for button is white.
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
