//
//  UserExpTableViewCell.swift
//  MyResume
//
//  Created by Pavel Kurilov on 26.04.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class UserExpTableViewCell: UITableViewCell {
	
	// MARK: - UI properties
	@IBOutlet private var companyNameLabel: UILabel!
	@IBOutlet private var timeLabel: UILabel!
	@IBOutlet private var companyLogoImageView: UIImageView!
	
	// MARK: - Properties
	static let reusableIdentifier = "UserExpCellID"

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
	// MARK: - configure data for UI
	func configureDataForElements(comapanyName: String, beginDate: Date,
																endDate: Date, logoComanyImage: UIImage) {
		companyNameLabel.text = comapanyName
		timeLabel.text = "\(dayTimePeriodFormatter(date: beginDate)) - \(dayTimePeriodFormatter(date: endDate))"
		companyLogoImageView.image = logoComanyImage
	}
	
	
	// MARK: - private methods
	private func dayTimePeriodFormatter(date: Date) -> String {
		
		let dayTimePeriodFormatter = DateFormatter()
		dayTimePeriodFormatter.dateFormat = "dd.MMM.YYYY"
		
		let dateString = dayTimePeriodFormatter.string(from: date)
		
		return dateString
	}
}
