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
	
	let checkImage:UIImageView = {
		let img = UIImageView()
		img.image = UIImage()
//		img.image = img.image!.withRenderingMode(.alwaysTemplate)
		img.frame.size.width = 40
		img.frame.size.height = 40
		img.tintColor = UIColor(red: 0, green: 122.0 / 255.0, blue: 1.0, alpha: 1.0)
		img.translatesAutoresizingMaskIntoConstraints = false
		return img
	}()

	let actionButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Delete", for: UIControlState())
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	func defaultImage() {
		checkImage.image = UIImage()
	}
	
	func checkOff() {
		checkImage.image = UIImage(named: "checkmark")
		checkImage.image = checkImage.image!.withRenderingMode(.alwaysTemplate)
	}

	func setupViews() {
		addSubview(nameLabel)
		addSubview(checkImage)
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-[v1(40)]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": checkImage]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|->=8-[v0]->=8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-4-[v0(40)]-4-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": checkImage]))
	}
}

