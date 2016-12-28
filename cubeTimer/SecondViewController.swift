//
//  SecondViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 27/12/2016.
//  Copyright © 2016 Audrey Seo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
	var hasTabControl:Bool = false
	var tbc:InfoSharingTabController = InfoSharingTabController()
	var data:[Int] = [Int]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if self.tabBarController != nil {
			self.tbc = self.tabBarController as! InfoSharingTabController
			self.hasTabControl = true
			
			for i in 0...tbc.data.count - 1 {
				print("Data \(i): \(tbc.data[i])")
			}
			self.data = tbc.data
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	


}

