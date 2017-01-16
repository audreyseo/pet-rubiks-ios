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
	var itemTypes: [FormCellType] = [FormCellType]()
	var itemFunctions: [Selector] = [Selector]()
	var blanks: [UITextField] = [UITextField]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		tableView.register(FormCell.self, forCellReuseIdentifier: "formId")
		items = ["Session Name"]
		itemTypes = [.blankWithButton]
		itemFunctions = [#selector(runWhenButtonPressed)]
		
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
		blanks.append(cell.blank)
		cell.setButtonText(newText: "Use Date")
		cell.button.addTarget(self, action: itemFunctions[indexPath.row], for: .touchUpInside)
		cell.changeType(newType: itemTypes[indexPath.row])
		return cell
	}
	
	override func willMove(toParentViewController parent: UIViewController?) {
		super.willMove(toParentViewController: parent)
		if parent == nil {
			print("This VC is 'will' be popped. i.e. the back button was pressed.")
		}
	}
	
	func runWhenButtonPressed() {
		print("\nButton was pressed\n")
		
		let today = Date()
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.dateFormat = "yyyy MMMM dd"
		
		blanks[0].text = formatter.string(from: today)
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
