//
//  SessionViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class SessionViewController:TableVC {
	//var tbc = InfoSharingTabController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// do stuff here
		tableView.register(SessionCell.self, forCellReuseIdentifier: "sessionId")
		tableView.register(FormCell.self, forCellReuseIdentifier: "formId")
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneFunction))
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add New...", style: .plain, target: self, action: #selector(addNew))
		
		let next = self.storyboard?.instantiateViewController(withIdentifier: "timesVC")
		next?.navigationItem.title = "Times"
		self.navigationController?.pushViewController(next!, animated: false)
		
		//self.tbc = self.tabBarController as! InfoSharingTabController
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tbc.saveData()
		self.tableView.reloadData()
	}
	
	func doneFunction() {
		let next = self.storyboard?.instantiateViewController(withIdentifier: "timesVC")
		next?.navigationItem.title = "Times"
		self.navigationController?.pushViewController(next!, animated: true)
		tbc.saveData()
	}
	
	func addNew() {
		print("Going to add a new session")
		let next = self.storyboard?.instantiateViewController(withIdentifier: "addSessionVC")
		next?.navigationItem.title = "New Session"
		self.navigationController?.pushViewController(next!, animated: true)
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			tbc.removeSession(ip: indexPath)
			tableView.reloadData()
		}
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let myCell = tableView.dequeueReusableCell(withIdentifier: "sessionId") as! SessionCell
		myCell.nameLabel.text = tbc.keys[indexPath.row]
		if indexPath.row == tbc.currentSession {
			myCell.checkOff()
		} else {
			myCell.defaultImage()
		}
			return myCell
		//		if indexPath.row == 0 {
//		} else {
//			let myCell = tableView.dequeueReusableCell(withIdentifier: "formId") as! FormCell
//			myCell.nameLabel.text = "Session Name"
//			myCell.blank.delegate = self
//			return myCell
//		}
	}
	
//	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//		textField.resignFirstResponder()
//		textField.endEditing(true)
//		return false
//	}
//	
//	func textFieldDidEndEditing(_ textField: UITextField) {
//		print("Value: \(textField.text)")
//	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if indexPath.row != tbc.currentSession {
			print("Index: \(indexPath.row), Current Session: \(tbc.currentSession)")
			let oldCell = tableView.cellForRow(at: IndexPath(row: tbc.currentSession, section: indexPath.section)) as! SessionCell
			oldCell.defaultImage()
			let newCell = tableView.cellForRow(at: indexPath) as! SessionCell
			newCell.checkOff()
			tableView.deselectRow(at: indexPath, animated: true)
			tbc.changeCurrentSession(ip: indexPath)
//			tbc.currentSession = indexPath.row
			//			let oldCell = tableView.dequeueReusableCell(withIdentifier: "sessionId", for: IndexPath(row: tbc.currentSession, section: indexPath.section)) as! SessionCell
			//			oldCell.checkImage.image = UIImage()
			//			oldCell.checkImage.tintColor = UIColor.blue
//			let newCell = tableView.dequeueReusableCell(withIdentifier: "sessionId", for: indexPath) as! SessionCell
//			newCell.checkImage.image = UIImage(named: "checkmark")
//			newCell.checkImage.tintColor = UIColor.blue
		} else {
			super.tableView(tableView, didSelectRowAt: indexPath)
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if super.tableView(tableView, numberOfRowsInSection: section) == 0 {
			return 0
		} else {
			return tbc.keys.count
		}
	}
}
