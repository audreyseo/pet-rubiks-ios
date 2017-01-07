//
//  FormCell.swift
//  cubeTimer
//
//  Created by Audrey Seo on 6/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

enum FormCellType {
	case fillInTheBlank, pickDate, pickerWithDefault, pickerWithoutDefault
}

class FormCell:UITableViewCell {
	let nameLabel:UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 14.0)
		label.numberOfLines = 0
		return label
	}()
	
	let blank:UITextField = {
		let text = UITextField()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.font = UIFont.systemFont(ofSize: 13.0)
		text.placeholder = "Placeholder Text"
		return text
	}()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder) has not been implemented")
	}
	
	func myConstraints(vf:String, views: [String: Any]) {
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vf, options: NSLayoutFormatOptions(), metrics: nil, views: views))
	}
	
	func setupViews() {
		addSubview(nameLabel)
		
		myConstraints(vf: "H:|-16-[v0]-16-|", views: ["v0": nameLabel])
		myConstraints(vf: "V:|-4-[v0]-4-|", views: ["v0": nameLabel])
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-4-[v0]-4-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
	}
}
