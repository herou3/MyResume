//
//  UserExperienceViewController.swift
//  MyResume
//
//  Created by Pavel Kurilov on 24.04.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class UserExperienceViewController: UIViewController {

	// MARK: - UI properties
	@IBOutlet private var tableView: UITableView!
	
	// MARK: Properties
	var companies: [Company]?
	
	// MARK: - init/deinit
	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
		tableView.reloadData()
	}
	
	// MARK: - Configure UI
	private func configure() {
		delegeting()
		guard let tabBar = tabBarController as? UserTabBarController else { return }
		companies = tabBar.user?.experience
		registerCell()
	}

	private func delegeting() {
		tableView.dataSource = self
	}
	
	private func registerCell() {
		tableView.register(UINib(nibName: "UserExpTableViewCell", bundle: nil),
											 forCellReuseIdentifier: UserExpTableViewCell.reusableIdentifier)
	}
}

extension UserExperienceViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return companies?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: UserExpTableViewCell.reusableIdentifier,
																									 for: indexPath) as? UserExpTableViewCell else {
																										return UITableViewCell()
		}
		
		cell.configureDataForElements(comapanyName: self.companies?[indexPath.row].name ?? "",
																	beginDate: self.companies?[indexPath.row].workingTime.dateBegin ?? Date(),
																	endDate: self.companies?[indexPath.row].workingTime.dateEnd ?? Date(),
																	logoComanyImage: self.companies?[indexPath.row].logo ?? UIImage())
		return cell
	}
}
