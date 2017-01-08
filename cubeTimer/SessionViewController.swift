//
//  SessionViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class SessionViewController:TableVC, UITextFieldDelegate {
	//var tbc = InfoSharingTabController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// do stuff here
		tableView.register(SessionCell.self, forCellReuseIdentifier: "sessionId")
		tableView.register(FormCell.self, forCellReuseIdentifier: "formId")
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneFunction))
		
		let next = self.storyboard?.instantiateViewController(withIdentifier: "timesVC")
		next?.navigationItem.title = "Times"
		self.navigationController?.pushViewController(next!, animated: false)
		
		//self.tbc = self.tabBarController as! InfoSharingTabController
	}
	
	func doneFunction() {
		let next = self.storyboard?.instantiateViewController(withIdentifier: "timesVC")
		next?.navigationItem.title = "Times"
		self.navigationController?.pushViewController(next!, animated: true)
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let myCell = tableView.dequeueReusableCell(withIdentifier: "sessionId") as! SessionCell
			myCell.nameLabel.text = tbc.keys[indexPath.row]
			return myCell
		} else {
			let myCell = tableView.dequeueReusableCell(withIdentifier: "formId") as! FormCell
			myCell.nameLabel.text = "Session Name"
			myCell.blank.delegate = self
			return myCell
		}
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		textField.endEditing(true)
		return false
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		print("Value: \(textField.text)")
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if super.tableView(tableView, numberOfRowsInSection: section) == 0 {
			return 0
		} else {
			return tbc.keys.count + 1
		}
	}
	
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
		super.touchesBegan(touches, with: event)
	}
}
