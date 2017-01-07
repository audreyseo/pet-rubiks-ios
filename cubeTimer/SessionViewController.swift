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
		let myCell = tableView.dequeueReusableCell(withIdentifier: "sessionId") as! SessionCell
		myCell.nameLabel.text = tbc.keys[indexPath.row]
		return myCell
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if super.tableView(tableView, numberOfRowsInSection: section) == 0 {
			return 0
		} else {
			return tbc.keys.count
		}
	}
}
