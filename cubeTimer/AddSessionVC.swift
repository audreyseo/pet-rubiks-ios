//
//  AddSessionVC.swift
//  cubeTimer
//
//  Created by Audrey Seo on 8/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class AddSessionViewController:TableVC, UITextFieldDelegate {
//	var tbc = InfoSharingTabController()
	var session = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		tableView.register(FormCell.self, forCellReuseIdentifier: "formId")
		items = ["Session Name"]
		
		self.tbc = self.tabBarController as! InfoSharingTabController
	}
	
	func doneFunction() {
		self.navigationController?.popViewController(animated: true)
//		navigationItem.leftBarButtonItem?.target?.perform(navigationItem.backBarButtonItem?.action)
		self.tbc.newSession(key: session)
		//		navigationItem.backBarButtonItem?.sendActions(for: .touchUpInside)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "formId") as! FormCell
		cell.nameLabel.text = items[indexPath.row]
		cell.blank.placeholder = "sessionName"
		cell.blank.delegate = self
		return cell
	}
	
	override func willMove(toParentViewController parent: UIViewController?) {
		super.willMove(toParentViewController: parent)
		if parent == nil {
			print("This VC is 'will' be popped. i.e. the back button was pressed.")
		}
	}
	
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		textField.endEditing(true)
		return false
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		print("Value: \(textField.text)")
		session = textField.text!
		doneFunction()
	}
}
