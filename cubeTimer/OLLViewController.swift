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
	}
}
