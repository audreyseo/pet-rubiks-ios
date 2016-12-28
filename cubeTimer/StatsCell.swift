//
//  StatsCell.swift
//  tableViewApp
//
//  Created by Audrey Seo on 10/10/2016.
//  Copyright © 2016 Audrey Seo. All rights reserved.
//

import UIKit

class StatsCell: UITableViewCell {
	
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
	
	let statLabel: UILabel = {
		let label = UILabel()
		label.text = "Sample"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 14.0)
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
		addSubview(statLabel)
		//		addSubview(actionButton)
		
		//		actionButton.addTarget(self, action: "handleAction", forControlEvents: .TouchUpInside)
		
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]->=30-[v1]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": statLabel]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": statLabel]))
	}
	
	//	func handleAction() {
	//		myTableViewController?.deleteCell(self)
	//	}
}
