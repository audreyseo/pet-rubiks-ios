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
	
	var currentSession:Int = 0
	let currentSessionKey:String = "currentSessionKey"
	
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
		
		storage.set(keys, forKey: timeKeysKey)
		
		if currentSession != storage.integer(forKey: currentSessionKey) && storage.integer(forKey: currentSessionKey) < keys.count {
			currentSession = storage.integer(forKey: currentSessionKey)
		}
		saveCurrentSession()
		
		
		if storage.dictionary(forKey: sessionsKey) != nil {
			sessions = storage.dictionary(forKey: sessionsKey) as! [String: [Int]]
		}
		
		storage.set(sessions, forKey: sessionsKey)
		
//		print("Current Session: \(currentSession)")
//		for i in 0..<keys.count {
//			print("\(i): \(keys[i])")
//		}
//		
		for (key, val) in sessions {
			print("\(key): \(val)")
		}
		sessions[keys[currentSession]] = data
	}
	
	func addData(newData:Int) {
		data += [newData]
		sessions[keys[currentSession]] = data
		saveCurrentState()
	}
	
	func saveCurrentSession() {
		print("Saving currentSession")
		storage.set(currentSession, forKey: currentSessionKey)
	}
	
	func saveCurrentState() {
		storage.set(keys, forKey: timeKeysKey)
		storage.set(sessions, forKey: sessionsKey)
		saveCurrentSession()
	}
	
	func newSession(key:String) {
		print("\nNew Key: \(key)")
		sessions[keys[currentSession]] = data
		data = [Int]()
		keys += [key]
		
		currentSession = keys.endIndex - 1
		if currentSession < keys.count && currentSession >= 0 {
			print("currentSession is within range")
			sessions[keys[currentSession]] = data
		}
		storage.set(keys, forKey: timeKeysKey)
		storage.set(sessions, forKey: sessionsKey)
		saveCurrentSession()
	}
	
	func isCurrentSession(title:String) -> Bool {
		return keys[currentSession].contains(title)
	}
	
	func changeCurrentSession(ip: IndexPath)  {
		if ip.row < keys.count {
			sessions[keys[currentSession]] = data
			data = [Int]()
			currentSession = ip.row
			data = sessions[keys[currentSession]]!
			saveCurrentState()
		}
	}
	
}
