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
	var sessions:[String: [Int]] = [String: [Int]]()
	var keys:[String] = ["FirstSession"]
	var timeKeysKey = "timeKeys"
	var sessionsKey = "sessionsKey"
	
	func loadData() -> Bool {
		if storage.dictionary(forKey: sessionsKey) != nil {
			sessions = storage.dictionary(forKey: sessionsKey) as! [String: [Int]]
			
			data = sessions[keys[0]]!
			return true
		}
		return false
		
	}
	
	
	func saveData() {
		if storage.array(forKey: timeKeysKey) != nil {
			keys = storage.array(forKey: timeKeysKey) as! [String]
		}
		
		if storage.dictionary(forKey: sessionsKey) != nil {
			sessions = storage.dictionary(forKey: sessionsKey) as! [String: [Int]]
		}
		sessions[keys[0]] = data
		
		storage.set(sessions, forKey: sessionsKey)

	}
	
}
