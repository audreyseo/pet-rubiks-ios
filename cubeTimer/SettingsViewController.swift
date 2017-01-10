//
//  SettingsViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 6/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit


class SettingsViewController: TableVC {
	
	var sliderItems = ["Long Press Delay"]
	var switchItems = ["Use Current Date for New Session Names"]
	var longPressKey = "longPressDelayKey"
	var userdef = UserDefaults()
	var longPress:Float = 0.5
	let sliderCellId = "sliderCellId"
	let settingsCellId = "settingsCellId"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		items = ["Long Press Delay", "Times Display", "About", "Use Current Date for New Session Names", "Date Format Options"]
		
		// more stuff here
		
		tableView.register(SettingsCell.self, forCellReuseIdentifier: settingsCellId)
		
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
		let cell = tableView.dequeueReusableCell(withIdentifier: settingsCellId) as! SettingsCell
		if sliderItems.contains(name) {
			cell.cellInit(name: name, value: longPress, tvc: self)
		} else if switchItems.contains(name) {
			cell.cellInit(name: name, switchState: false, tvc: self)
		} else {
			cell.cellInit(name: name, tvc: self)
			cell.setType(newType: .rerouter)
//			cell.setupViews()
			cell.accessoryType = .disclosureIndicator
		}
		cell.setupViews()
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let name = items[indexPath.row]
		if !sliderItems.contains(name) {
			switch name {
				case "About":
				aboutFunction()
				case "Times Display":
				timesDisplayFunction()
				case "Date Format Options":
				dateFormatOptionsFunction()
			default:
				break;
			}
		}
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	func dateFormatOptionsFunction() {
		print("Date Format Options Page")
		let next = self.storyboard?.instantiateViewController(withIdentifier: "dateFormatOptionsVC")
		next?.navigationItem.title = "Date Formatting Options"
		self.navigationController?.pushViewController(next!, animated: true)
	}
	
	func timesDisplayFunction() {
		print("Show Times Display page")
	}
	
	func aboutFunction() {
		print("Show About page.")
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if super.tableView(tableView, numberOfRowsInSection: section) == 0 {
			return 0
		} else {
			return items.count
		}
	}
	
	//override func numberOfSections(in tableView: UITableView) -> Int {
	//	return 1
	//}
	
}
