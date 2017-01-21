//
//  SettingsCell.swift
//  cubeTimer
//
//  Created by Audrey Seo on 21/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

enum SettingsCellType {
	case slider, rerouter, switcher
}

class SettingsCell:UITableViewCell {
	var myTableViewController: SettingsViewController?
	var type:SettingsCellType = .slider
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		//		setupViews()
		cellSlider.addTarget(self, action: #selector(setLabel), for: .valueChanged)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setType(newType:SettingsCellType) {
		self.type = newType
	}
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Sample Item"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 14)
		label.numberOfLines = 0
		return label
	}()
	
	let valueLabel: UILabel = {
		let label = UILabel()
		label.text = "0.5"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 12)
		return label
	}()
	
	let cellSlider: UISlider = {
		let sl = UISlider()
		sl.translatesAutoresizingMaskIntoConstraints = false
		sl.isContinuous = false
		sl.minimumValue = 0.1
		sl.maximumValue = 5.0
		sl.setValue(0.5, animated: true)
		return sl
	}()
	
	let cellSwitch: UISwitch = {
		let sw = UISwitch()
		sw.translatesAutoresizingMaskIntoConstraints = false
		sw.isOn = false
		return sw
	}()
	
	func cellInit(name: String, value: Float, tvc: SettingsViewController) {
		nameLabel.text = name
		setSlider(newValue: value)
		setLabel()
		myTableViewController = tvc
	}
	
	func cellInit(name: String, tvc: SettingsViewController) {
		nameLabel.text = name
		myTableViewController = tvc
	}
	
	func cellInit(name: String, switchState: Bool, tvc: SettingsViewController) {
		nameLabel.text = name
		cellSwitch.isOn = switchState
		myTableViewController = tvc
	}
	
	func setSlider(newValue: Float) {
		cellSlider.setValue(newValue, animated: true)
	}
	
	func setLabel() {
		//print("Setting label.")
		let raw:Float = cellSlider.value
		let rawStr:String = "\(raw)"
		print("Start: \(rawStr.startIndex), End: \(rawStr.endIndex), \(5)")
		let end = rawStr.index(rawStr.startIndex, offsetBy: 5, limitedBy: rawStr.endIndex)
		valueLabel.text = end != nil ? rawStr.substring(to: end!) : rawStr
		myTableViewController?.newSliderValue(value: raw)
	}
	
	func myConstraints(vf:String, views: [String: Any]) {
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vf, options: NSLayoutFormatOptions(), metrics: nil, views: views))
	}
	
	func setupViews() {
		addSubview(nameLabel)
		
		
		
		if type == .slider {
			addSubview(valueLabel)
			addSubview(cellSlider)
			
			myConstraints(vf: "H:|-16-[v0]-[v1]-[v2]-|", views: ["v0": nameLabel, "v1": valueLabel, "v2": cellSlider])
		} else {
			myConstraints(vf: "H:|-16-[v0]-|", views: ["v0": nameLabel])
		}
		
		myConstraints(vf: "V:|-8-[v0]-8-|", views: ["v0": nameLabel])
		if type == .slider {
			myConstraints(vf: "V:|-8-[v0]-8-|", views: ["v0": valueLabel])
			myConstraints(vf: "V:|-8-[v0]-8-|", views: ["v0": cellSlider])
		}
		
		//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-[v1]-[v2]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": valueLabel, "v2": cellSlider]))
		//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": valueLabel]))
		//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": cellSlider]))
	}
	
}
