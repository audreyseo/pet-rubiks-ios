//
//  SettingsViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 6/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit


class SettingsViewController: UITableViewController {
	
	var items = ["Long Press Delay"]
	var sliderItems = ["Long Press Delay"]
	var longPressKey = "longPressDelayKey"
	var userdef = UserDefaults()
	var longPress:Float = 0.5
	let sliderCellId = "sliderCellId"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// more stuff here
		
		tableView.register(SliderCell.self, forCellReuseIdentifier: sliderCellId)
		
		longPress = userdef.float(forKey: longPressKey)
		if longPress < 0.1 || longPress > 5.0 {
			longPress = 0.5
			userdef.set(longPress, forKey: longPressKey)
		}
	}
	
	func newSliderValue(value:Float) {
		print("Changing value.")
		longPress = value
		userdef.set(value, forKey: longPressKey)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let name = items[indexPath.row]
		if sliderItems.contains(name) {
			let cell = tableView.dequeueReusableCell(withIdentifier: sliderCellId) as! SliderCell
			cell.nameLabel.text = name
			cell.valueLabel.text = "\(longPress)"
			cell.setSlider(newValue: longPress)
			cell.myTableViewController = self
			return cell
		}
		
		return tableView.dequeueReusableCell(withIdentifier: sliderCellId)!
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
}
