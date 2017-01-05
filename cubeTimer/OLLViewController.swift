//
//  OLLViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class OLLViewController:UITableViewController {
	var images:[String] = Array(repeating: "", count: 58)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// do stuff here
		for i in 1...58 {
			images[i - 1] = "\(i)"
		}
		
		tableView.register(CubeCaseCell.self, forCellReuseIdentifier: "caseCellId")
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let myCell = tableView.dequeueReusableCell(withIdentifier: "caseCellId") as! CubeCaseCell
		myCell.nameLabel.text = images[indexPath.row]
		let image = UIImage(named: images[indexPath.row])
		myCell.imageView?.image = image
		return myCell
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return images.count
	}
}
