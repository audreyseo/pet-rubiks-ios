//
//  TimesEditorViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class TimesEditorViewController:TableVC {
//	var tbc:InfoSharingTabController? = InfoSharingTabController()
	var conversion = TimeConversion()
	var statsId: String {
		return self.tbc.cellReuseIds["StatsCell"]!
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// do stuff here
		tableView.register(StatsCell.self, forCellReuseIdentifier: statsId)
		
		navigationItem.title = "Times Editor"
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Options", style: .plain, target: self, action: #selector(showEditingActions))
		
		if self.tabBarController != nil {
			self.tbc = (self.tabBarController as! InfoSharingTabController)
		}
	}
	
	
	func showEditingActions() {
		let alert = UIAlertController(title: "Editing Action", message: "Which action would you like to take?", preferredStyle: .actionSheet)
		let clearAction = UIAlertAction(title: "Clear Times", style: .default, handler: { action in
				print("About to clear all items")
			let alert = UIAlertController(title: "Clear All Times From Session", message: "Are you sure? This action cannot be undone.", preferredStyle: .alert)
			let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
					print("Clearing times.")
				self.tbc.data = [Int]()
			})
			let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
			alert.addAction(yesAction)
			alert.addAction(noAction)
			self.present(alert, animated: true, completion: nil)
		})
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		
		alert.addAction(clearAction)
		alert.addAction(cancelAction)
		self.present(alert, animated: true, completion: nil)
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			tbc.removeData(ip: indexPath)
			tableView.reloadData()
		}
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let c = tableView.dequeueReusableCell(withIdentifier: statsId) as! StatsCell
		c.nameLabel.text = "\(indexPath.row + 1)"
		c.statLabel.text = conversion.timeString(millis: tbc.data[indexPath.row])
		return c
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if super.tableView(tableView, numberOfRowsInSection: section) == 0 {
			return 0
		} else {
			return tbc.data.count
		}
	}
	
	
}
