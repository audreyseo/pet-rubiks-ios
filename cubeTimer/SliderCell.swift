//
//  SliderCell.swift
//  cubeTimer
//
//  Created by Audrey Seo on 6/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class SliderCell:UITableViewCell {
	var myTableViewController: SettingsViewController?
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
		cellSlider.addTarget(self, action: #selector(setLabel), for: .valueChanged)
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
	
	func setSlider(newValue: Float) {
		cellSlider.setValue(newValue, animated: true)
	}
	
	func setLabel() {
		//print("Setting label.")
		let raw:Float = cellSlider.value
		let rawStr:String = "\(raw)"
		valueLabel.text = rawStr.substring(to: rawStr.index(rawStr.startIndex, offsetBy: 5, limitedBy: rawStr.endIndex)!)
	}
	
	func setupViews() {
		addSubview(nameLabel)
		addSubview(valueLabel)
		addSubview(cellSlider)
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-[v1]-[v2]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": valueLabel, "v2": cellSlider]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": valueLabel]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": cellSlider]))
	}
}

