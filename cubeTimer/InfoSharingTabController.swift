//
//  InfoSharingTabController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 28/12/2016.
//  Copyright © 2016 Audrey Seo. All rights reserved.
//

import UIKit


class InfoSharingTabController:UITabBarController {
	var data:[Int] = [Int]()
	var storage:UserDefaults = UserDefaults()
	var keys:[String] = ["FirstSession"]
	var timeKeysKey = "timeKeys"
	var sessionsKey = "sessionsKey"
	
	
//	func saveData(newData: [Int]) {
//		if storage.array(forKey: timeKeysKey) != nil {
//			keys = storage.array(forKey: timeKeysKey) as! [String]
//		}
//		var sessions:[String: [Int]] = [String: [Int]]()
//		if storage.dictionary(forKey: sessionsKey) != nil {
//			sessions = storage.dictionary(forKey: sessionsKey) as! [String: [Int]]
//		}
//		sessions += [[keys[0]: data]]
//
//	}
	
}
