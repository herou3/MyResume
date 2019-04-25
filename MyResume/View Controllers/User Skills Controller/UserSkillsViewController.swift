//
//  UserSkillsViewController.swift
//  MyResume
//
//  Created by Pavel Kurilov on 24.04.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class UserSkillsViewController: UIViewController {
	
	// MARK: - UI properties
	@IBOutlet private var tableView: UITableView!
	
	// MARK: Properties
	var skills: [String]?
	
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
		configureWithUserData(tabBar.user?.skills ?? [])
	}
	
	func configureWithUserData(_ skillsUser: [String]) {
		skills = skillsUser
	}
	
	private func delegeting() {
		tableView.dataSource = self
	}
	
	private func registerCell() {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "skillCellID")
	}
}

// MARK: - Extension Table View delegate
extension UserSkillsViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "My working skills"
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return skills?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = UITableViewCell(style: .default, reuseIdentifier: "skillCellID")
		cell.textLabel?.text = self.skills?[indexPath.row] ?? ""
		
		return cell
	}
}
