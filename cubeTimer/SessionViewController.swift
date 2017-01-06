//
//  SessionViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class SessionViewController:UITableViewController {
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// do stuff here
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneFunction))
		
		let next = self.storyboard?.instantiateViewController(withIdentifier: "timesVC")
		next?.navigationItem.title = "Times"
		self.navigationController?.pushViewController(next!, animated: false)
	}
	
	func doneFunction() {
		let next = self.storyboard?.instantiateViewController(withIdentifier: "timesVC")
		next?.navigationItem.title = "Times"
		self.navigationController?.pushViewController(next!, animated: true)
	}
}
