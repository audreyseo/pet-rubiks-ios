//
//  TableVC.swift
//  cubeTimer
//
//  Created by Audrey Seo on 6/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit


class TableVC:UITableViewController {
	var titles:[String] = Array(repeating: "", count: 2)
	var tbc = InfoSharingTabController()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// do custom stuff
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "footerId")
		self.tbc = self.tabBarController as! InfoSharingTabController
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		// Add the footer view
		let footerView = UITableViewCell(style: .subtitle, reuseIdentifier: "footerId")
		//		footerView.nameLabel.text = ""
		footerView.isOpaque = true
		footerView.frame.size.height = 5.0
		
		// Need to delete either one of these but all I wanted is for the background to be normal hallelujah
		self.tableView.backgroundColor = UIColor.groupTableViewBackground
		self.view.backgroundColor = UIColor.groupTableViewBackground
		self.tableView.tableFooterView = footerView
		self.tableView.tableFooterView?.tintColor = UIColor.groupTableViewBackground
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return titles.count
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let myCell = tableView.dequeueReusableCell(withIdentifier: "footerId")! as UITableViewCell
		myCell.contentView.backgroundColor = UIColor.groupTableViewBackground
		myCell.textLabel?.text = titles[section]
		return myCell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
}
