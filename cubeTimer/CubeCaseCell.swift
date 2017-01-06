//
//  CubeCaseCell.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class CubeCaseCell:UITableViewCell {
	
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
	
	let algLabel: UILabel = {
		let label = UILabel()
		label.text = "Sample Item"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 12)
		label.numberOfLines = 0
		return label
	}()
	
	let algLabel1: UILabel = {
		let label = UILabel()
		label.text = "Sample Item"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 12)
		label.numberOfLines = 0
		return label
	}()
	
	let probLabel: UILabel = {
		let label = UILabel()
		label.text = "Sample Item"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 10)
		label.numberOfLines = 0
		return label
	}()
	
	let algStacker:UIStackView = {
		let stck = UIStackView()
		stck.translatesAutoresizingMaskIntoConstraints = false
		stck.alignment = .center
		stck.axis = .horizontal
		return stck
	}()
	
	func setupViews() {
		//algStacker.alignment = .center
		//algStacker.axis = .horizontal
		if algLabel.text != "" {
			algStacker.addSubview(algLabel)
			if algLabel1.text != "" {
				algStacker.addSubview(algLabel1)
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel]))
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel1]))
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-4-[v0]-[v1]-4-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel, "v1": algLabel1]))
			} else {
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel]))
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel]))
			}
		}
		addSubview(nameLabel)
		addSubview(probLabel)
		addSubview(algStacker)
		//addSubview(algLabel)
		
		
//		addSubview(statLabel)
		//		addSubview(actionButton)
		
		//		actionButton.addTarget(self, action: "handleAction", forControlEvents: .TouchUpInside)
		
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-85-[v0]-[v2]-[v1]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": probLabel, "v2"
			: algStacker]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": probLabel]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algStacker]))
	}
}
