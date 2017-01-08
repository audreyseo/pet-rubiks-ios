//
//  AddSessionVC.swift
//  cubeTimer
//
//  Created by Audrey Seo on 8/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class AddSessionViewController:TableVC, UITextFieldDelegate {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		tableView.register(FormCell.self, forCellReuseIdentifier: "formId")
		items = ["Session Name"]
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "formId") as! FormCell
		cell.nameLabel.text = items[indexPath.row]
		cell.blank.placeholder = "sessionName"
		cell.blank.delegate = self
		return cell
	}
	
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		textField.endEditing(true)
		return false
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		print("Value: \(textField.text)")
	}
}
