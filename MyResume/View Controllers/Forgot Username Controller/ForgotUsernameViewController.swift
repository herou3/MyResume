//
//  ForgotUsernameViewController.swift
//  MyResume
//
//  Created by Pavel Kurilov on 24.04.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class ForgotUsernameViewController: UIViewController {
	
	// MARK: - UI properties
	@IBOutlet private var usernameHelpLabel: UILabel!
	@IBOutlet private var backButton: UIButton!
	
	// MARK: - properties
	var username: String?
	var onDidRequestUsername: ((_ value: String) -> Void)?

	// MARK: - init/deint
	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		navigationController?.setNavigationBarHidden(false, animated: true)
	}

	override func viewWillDisappear(_ animated: Bool) {
		bind()
	}
	
	// MARK: - Bind method
	private func bind() {
		onDidRequestUsername?(username ?? "")
	}
	
	// MARK: - Configure methods
	private func configure() {
		usernameHelpLabel.text = "Your usename: \(username ?? "")"
		decorateButtons()
		configureNavigationBar()
	}
	
	private func configureNavigationBar() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationController?.navigationBar.tintColor = .darkGray
	}
	
	private func decorateButtons() {
		Decorator.decorate(backButton)
	}
}

// MARK: - Decorator
extension ForgotUsernameViewController {
	
	fileprivate class Decorator {
		
		// MARK: - Init
		private init() {}
		
		// MARK: - Methods
		static func decorate(_ button: UIButton) {
			button.layer.cornerRadius = Constant.buttonCornerRadious
		}
	}
}
