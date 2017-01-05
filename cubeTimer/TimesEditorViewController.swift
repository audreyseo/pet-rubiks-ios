//
//  TimesEditorViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class TimesEditorViewController:UITableViewController {
	var tbc:InfoSharingTabController? = InfoSharingTabController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// do stuff here
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
				self.tbc?.data = [Int]()
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
}
