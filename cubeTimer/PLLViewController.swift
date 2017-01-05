//
//  PLLViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit


class PLLViewController:UITableViewController {
	let cases:[String] = ["Aa", "Ab", "E", "F", "Ga", "Gb", "Gc", "Gd", "H", "Ja", "Jb", "Na", "Nb", "Ra", "Rb", "T", "Ua", "Ub", "V", "Y", "Z", "Solved"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// do other stuff here
		tableView.register(CubeCaseCell.self, forCellReuseIdentifier: "caseCellId")
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let myCell = tableView.dequeueReusableCell(withIdentifier: "caseCellId") as! CubeCaseCell
		myCell.nameLabel.text = cases[indexPath.row]
		let image = UIImage(named: cases[indexPath.row])
		myCell.imageView?.image = image
		
		myCell.imageView?.frame.size.width = 60
		myCell.imageView?.frame.size.height = 60
		return myCell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cases.count
	}
}
