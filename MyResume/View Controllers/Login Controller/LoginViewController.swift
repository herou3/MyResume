//
//  LoginViewController.swift
//  MyResume
//
//  Created by Pavel Kurilov on 24.04.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	
	// MARK: - UI properties
	@IBOutlet private var usernameTextField: UITextField!
	@IBOutlet private var passwordTextField: UITextField!
	@IBOutlet private var loginButton: UIButton!
	@IBOutlet private var forgotPasswordButton: UIButton!
	@IBOutlet private var forgotUsernameButton: UIButton!
	
	// MARK: - Internal properties
	private var user: User = User(name: "Pavel",
																lastName: "Kurilov",
																image: #imageLiteral(resourceName: "myImage.png"),
																description: "Меня зовут Курилов Павел, ранее я занимался созданием вебсайтов, потом я перешел на тестирование программного обеспечения, в данный момент я занимаюсь автоматизированным тестирование для компании, которая занимается созданием ПО в области страхования.",
																skills: ["Obj-c","Swift","JAVA", "MySql", "HTML", "CSS", "JavaScript", "Software-Testing", "Automation Testing", "Performance and Load Testing"],
																experience: [Company(name: "Freelance.ru",
																										 workingTime: WorkingTime(dateBegin: Date(timeIntervalSince1970: 1398411819),
																																							dateEnd:Date(timeIntervalSince1970: 1422171819)),
																										 logo: #imageLiteral(resourceName: "freelance-image")),
																						 Company(name: "TransportTV",
																										 workingTime: WorkingTime(dateBegin: Date(timeIntervalSince1970: 1422949419),
																																							dateEnd:Date(timeIntervalSince1970: 1426923819)),
																										 logo: #imageLiteral(resourceName: "transportTV-image.png")),
																						 Company(name: "Drom.ru",
																										 workingTime: WorkingTime(dateBegin: Date(timeIntervalSince1970: 1427269419),
																																							dateEnd:Date(timeIntervalSince1970: 1463384619)),
																										 logo: #imageLiteral(resourceName: "drom-image")),
																						 Company(name: "Space-O Technologies",
																										 workingTime: WorkingTime(dateBegin: Date(timeIntervalSince1970: 1463557419),
																																							dateEnd:Date(timeIntervalSince1970: 1531899819)),
																										 
																										 logo: #imageLiteral(resourceName: "spaceo-image")),
																						 Company(name: "KODE",
																										 workingTime: WorkingTime(dateBegin: Date(timeIntervalSince1970: 1531899819),
																																							dateEnd:Date(timeIntervalSince1970: 1555659819)),
																										 
																										 logo: #imageLiteral(resourceName: "kode-image")),
																						 Company(name: "Sidenis",
																										 workingTime: WorkingTime(dateBegin: Date(timeIntervalSince1970: 1555659819),
																																							dateEnd:Date()),
																										 
																										 logo: #imageLiteral(resourceName: "sidenis-image"))],
																userName: "herou3",
																password: "123123")

	// MARK: - Init/Deinit
	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		configureNavigationBar()
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self,
																							name: UIResponder.keyboardWillShowNotification,
																							object: nil)
		NotificationCenter.default.removeObserver(self,
																							name: UIResponder.keyboardWillHideNotification,
																							object: nil)
	}
	
	// MARK: - Configure methods and design
	private func configure() {
		decorateButtons()
		hideKeyboardOutsideTap()
		addDelegateForButtons()
		addKeyboardEvents()
	}
	
	private func configureNavigationBar() {
		navigationController?.setNavigationBarHidden(true, animated: true)
	}
	
	private func decorateButtons() {
		Decorator.decorate(loginButton)
		Decorator.decorate(forgotPasswordButton)
		Decorator.decorate(forgotUsernameButton)
	}
	
	private func addDelegateForButtons() {
		usernameTextField.delegate = self
		passwordTextField.delegate = self
	}
	
	private func addKeyboardEvents() {
		NotificationCenter.default.addObserver(self,
																					 selector: #selector(keyboardWillShow(notification:)),
																					 name: UIResponder.keyboardWillShowNotification,
																					 object: nil)
		NotificationCenter.default.addObserver(self,
																					 selector: #selector(keyboardWillHide(notification:)),
																					 name: UIResponder.keyboardWillHideNotification,
																					 object: nil)
	}
	
	private func hideKeyboardOutsideTap() {
		let hideKeyboardGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
																																						 action: #selector(dismissKeyboard))
		self.view.addGestureRecognizer(hideKeyboardGesture)
	}
	
	//MARK: - Private internal methods
	@objc private func dismissKeyboard() {
		view.endEditing(true)
	}
	
	private func isCorrectedInformation() -> Bool {
		
		guard let username = usernameTextField.text else { return false }
		guard let password = passwordTextField.text else { return false }
		
		if username.isEmpty {
			self.defaultAlert(with: "Error", message: "Please enter your username")
			return false
		}
		if password.isEmpty {
			self.defaultAlert(with: "Error", message: "Please enter your password")
			return false
		}
		if password.elementsEqual(user.password) && username.elementsEqual(user.userName) {
			return true
		} else {
			self.defaultAlert(with: "Error", message: "Your password or username is wrong")
			return false
		}
	}
	
	@objc private func keyboardWillShow(notification: Notification) {
		guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
			return
		}
		if view.frame.origin.y == 0 {
			view.frame.origin.y -= keyboardRect.height / 2
		}
	}
	
	@objc private func keyboardWillHide(notification: Notification) {
		self.view.frame.origin.y = 0
	}
}

// MARK: - UI view controllers methods
extension LoginViewController {
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		let destination = segue.destination
		
		if let destination = destination as? ForgotUsernameViewController {
			destination.username = user.userName
			destination.onDidRequestUsername = { [unowned self] value in
				self.usernameTextField.text = value
			}
		} else if let destination = destination as? ForgotPasswordViewController {
			destination.password = user.password
			destination.onDidRequestPassword = { [unowned self] value in
				self.passwordTextField.text = value
			}
		}
		else if let destination = destination as? UserTabBarController {
			destination.user = user
		}
	}
	
	override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
		if identifier == "returnTabBarController" {
			return self.isCorrectedInformation()
		} else {
			return true
		}
	}
	
	@IBAction func unwindForgotPassword(segue: UIStoryboardSegue) { }
	
	@IBAction func unwindForgotUsername(segue: UIStoryboardSegue) { }
}

// MARK: - Decorator
extension LoginViewController {
	
	fileprivate class Decorator {
		
		// MARK: - Init
		private init() {}
		
		// MARK: - Methods
		static func decorate(_ button: UIButton) {
			button.layer.cornerRadius = Constant.buttonCornerRadious
		}
	}
}

// MARK: - Extension UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == usernameTextField {
			passwordTextField.becomeFirstResponder()
			return false
		} else if textField == passwordTextField {
			self.view.endEditing(true)
			if isCorrectedInformation() {
				performSegue(withIdentifier: "returnTabBarController", sender: self)
			}
			return true
		}
		return true
	}
}
