//
//  SessionCell.swift
//  cubeTimer
//
//  Created by Audrey Seo on 6/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class SessionCell:UITableViewCell {
	//	var myTableViewController: SecondViewController?

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Sample Item"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 14)
		label.numberOfLines = 0
		return label
	}()

	let actionButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Delete", for: UIControlState())
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	func setupViews() {
		addSubview(nameLabel)
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
	}
}

