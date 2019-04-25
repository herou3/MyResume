//
//  UIAlert+DefaultAlert.swift
//  MyResume
//
//  Created by Pavel Kurilov on 25.04.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

extension UIViewController {
	
	// MARK: - Show default alert
	func defaultAlert(with title: String,
										message: String) {
		let alert = UIAlertController(title: title,
																	message: message,
																	preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		alert.addAction(cancelAction)
		alert.view.tintColor = .darkGray
		self.present(alert, animated: true, completion: nil)
	}
}
