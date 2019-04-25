//
//  UserInfoViewController.swift
//  MyResume
//
//  Created by Pavel Kurilov on 24.04.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
	
	// MARK: - UI Properties
	@IBOutlet private var userImageView: UIImageView!
	@IBOutlet private var fullNameLabel: UILabel!
	@IBOutlet private var descriptionTextView: UITextView!
	
	// MARK: - init/deinit
	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
	}
	
	// MARK: - Configure UI
	private func configure() {
		guard let tabBar = tabBarController as? UserTabBarController else { return }
		configureWithUserData(name: tabBar.user?.name ?? "",
													lastName: tabBar.user?.lastName ?? "",
													description: tabBar.user?.description ?? "",
													image: tabBar.user?.image ?? UIImage())
	}
	
	func configureWithUserData(name: String, lastName: String, description: String, image: UIImage) {
		userImageView.image = image
		fullNameLabel.text = "\(name) \(lastName)"
		descriptionTextView.text = description
	}
}


