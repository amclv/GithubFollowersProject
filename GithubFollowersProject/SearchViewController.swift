//
//  SearchViewController.swift
//  GithubFollowersProject
//
//  Created by Aaron Cleveland on 4/28/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let standardPadding: CGFloat = 50
    private let standardHeight: CGFloat = 50
    
    let logoImageView = UIImageView()
    let userNameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool { return !userNameTextField.text!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😃", buttonTitle: "Ok!")
            return
        }
        
        let followerListVC = FollowerListViewController()
        followerListVC.username = userNameTextField.text
        followerListVC.title = userNameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}

// MARK: - Extension Constraints and Configurations -
extension SearchViewController {
    func configureLogoImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.delegate = self
        
        view.addSubview(userNameTextField)
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: standardPadding),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: standardPadding),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -standardPadding),
            userNameTextField.heightAnchor.constraint(equalToConstant: standardHeight)
        ])
    }
    
    func configureCallToActionButton() {
        callToActionButton.translatesAutoresizingMaskIntoConstraints = false
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        view.addSubview(callToActionButton)
        NSLayoutConstraint.activate([
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: standardPadding),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -standardPadding),
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -standardPadding),
            callToActionButton.heightAnchor.constraint(equalToConstant: standardHeight)
        ])
    }
}
