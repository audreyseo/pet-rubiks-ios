//
//  FormCell.swift
//  cubeTimer
//
//  Created by Audrey Seo on 6/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

enum FormCellType {
	case fillInTheBlank, pickDate, pickerWithDefault, pickerWithoutDefault, blankWithButton
}

class FormCell:UITableViewCell {
	var type:FormCellType = .fillInTheBlank
	
	let nameLabel:UILabel = {
		let label = UILabel()
		label.text = "Sample"
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
		text.addTarget(self, action: #selector(valueChanged), for: .editingDidEnd)
		return text
	}()
	
	let button:UIButton = {
		let b = UIButton(type: .system)
		b.translatesAutoresizingMaskIntoConstraints = false
		b.setTitle("Sample Button", for: .normal)
//		b.titleLabel!.text = "Sample Button"
		b.titleLabel!.adjustsFontSizeToFitWidth = true
		
		return b
	}()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
//		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder) has not been implemented")
	}
	
	func myConstraints(vf:String, views: [String: Any]) {
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vf, options: NSLayoutFormatOptions(), metrics: nil, views: views))
	}
	
	func valueChanged() {
		print("Value: \(blank.text)")
	}
	
	func setButtonText(newText: String) {
		button.setTitle(newText, for: .normal)
	}
	
	func changeType(newType: FormCellType) {
		self.type = newType
		setupViews()
	}
	
	func setupViews() {
		
//		nameLabel.removeFromSuperview()
//		blank.removeFromSuperview()
//		button.removeFromSuperview()
		
		switch self.type {
		case .fillInTheBlank:
			setupFillInBlank()
		case .blankWithButton:
			setupBlankWithButton()
		default:
			break
		}
		
//		addSubview(nameLabel)
//		addSubview(blank)
//		
//		myConstraints(vf: "H:|-16-[v0]-[v1(>=80)]-16-|", views: ["v0": nameLabel, "v1": blank])
//		myConstraints(vf: "V:|-4-[v0]-4-|", views: ["v0": nameLabel])
//		myConstraints(vf: "V:|-4-[v0]-4-|", views: ["v0": blank])
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-[v1]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": blank]))
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-4-[v0]-4-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-4-[v0]-4-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": blank]))
	}
	
	func setupFillInBlank() {
		addSubview(nameLabel)
		addSubview(blank)
		
		myConstraints(vf: "H:|-16-[v0]-[v1(>=80)]-16-|", views: ["v0": nameLabel, "v1": blank])
		myConstraints(vf: "V:|-4-[v0]-4-|", views: ["v0": nameLabel])
		myConstraints(vf: "V:|-4-[v0]-4-|", views: ["v0": blank])
	}
	
	func setupBlankWithButton() {
		addSubview(nameLabel)
		addSubview(blank)
		addSubview(button)
		
		myConstraints(vf: "H:|-16-[v0]-[v1(>=80)]-[v2(>=30)]-16-|", views: ["v0": nameLabel, "v1": blank, "v2": button])
		myConstraints(vf: "V:|-4-[v0]-4-|", views: ["v0": nameLabel])
		myConstraints(vf: "V:|-4-[v0]-4-|", views: ["v0": blank])
		addConstraint(NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
//		myConstraints(vf: "V:|-4-[v0(10)]-4-|", views: ["v0": button])
	}
}
