//
//  ForgotPasswordViewController.swift
//  MyResume
//
//  Created by Pavel Kurilov on 24.04.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
	
	// MARK: - UI properties
	@IBOutlet private var passwordHelpLabel: UILabel!
	@IBOutlet private var backButton: UIButton!
	
	// MARK: - properties
	public var password: String?
	var onDidRequestPassword: ((_ password: String) -> Void)?

	// MARK: - init/deint
	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		bind()
	}
	
	// MARK: - Bind method
	private func bind() {
		onDidRequestPassword?(password ?? "")
	}
	
	// MARK: - Configure methods
	private func configure() {
		passwordHelpLabel.text = "Your password: \(password ?? "")"
		decorateButtons()
		configureNavigationBar()
	}
	
	private func decorateButtons() {
		Decorator.decorate(backButton)
	}
	
	private func configureNavigationBar() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationController?.navigationBar.tintColor = .darkGray
	}
}

// MARK: - Decorator
extension ForgotPasswordViewController {
	
	fileprivate class Decorator {
		
		// MARK: - Init
		private init() {}
		
		// MARK: - Methods
		static func decorate(_ button: UIButton) {
			button.layer.cornerRadius = Constant.buttonCornerRadious
		}
	}
}
