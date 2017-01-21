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
	
	var cellReuseIds: [String: String] = [
		"AboutCell": "aboutCellId",
		"DateFormatCell": "dateFormatCellId",
		"CubeCaseCell": "cubeCaseCellId",
		"EditableCubeCaseCell": "editableCubeCaseCellId",
		"FormCell": "formCellId",
		"SessionCell": "sessionCellId",
		"SliderCell": "sliderCellId",
		"SettingsCell": "settingsCellId",
		"StatsCell": "statsCellId"
	]
	
	func loadData() -> Bool {
		if storage.dictionary(forKey: sessionsKey) != nil {
//			sessions = storage.dictionary(forKey: sessionsKey) as! [String: [Int]]
			
//			data = sessions[keys[0]]!
			self.saveData()
			return true
		}
		return false
	}
	
	func getData() {
		if storage.array(forKey: timeKeysKey) != nil {
			keys = storage.array(forKey: timeKeysKey) as! [String]
		}
		
		if currentSession != storage.integer(forKey: currentSessionKey) && storage.integer(forKey: currentSessionKey) < keys.count && storage.integer(forKey: currentSessionKey) >= 0 {
			currentSession = storage.integer(forKey: currentSessionKey)
		}
		
		if storage.dictionary(forKey: sessionsKey) != nil {
			sessions = storage.dictionary(forKey: sessionsKey) as! [String: [Int]]
		}
	}
	
	
	func saveData() {
		if storage.array(forKey: timeKeysKey) != nil {
			keys = storage.array(forKey: timeKeysKey) as! [String]
		}
		
		storage.set(keys, forKey: timeKeysKey)
		
		if currentSession != storage.integer(forKey: currentSessionKey) && storage.integer(forKey: currentSessionKey) < keys.count {
			currentSession = storage.integer(forKey: currentSessionKey)
			print("Got current session: \(currentSession)")
		}
		saveCurrentSession()
		
		
		if storage.dictionary(forKey: sessionsKey) != nil {
			sessions = storage.dictionary(forKey: sessionsKey) as! [String: [Int]]
			data = sessions[keys[currentSession]]!
		}
		
		sessions[keys[currentSession]] = data
		
		storage.set(sessions, forKey: sessionsKey)
		
//		print("Current Session: \(currentSession)")
//		for i in 0..<keys.count {
//			print("\(i): \(keys[i])")
//		}
//		
//		for (key, val) in sessions {
//			print("\(key): \(val)")
//		}
		
	}
	
	func addData(newData:Int) {
		data += [newData]
		sessions[keys[currentSession]] = data
		saveCurrentState()
	}
	
	func saveCurrentSession() {
		print("Saving currentSession: \(currentSession)")
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
	
	func getCurrentSession() -> String {
		return keys[currentSession]
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
	
	func removeData(ip:IndexPath) {
		if ip.row < data.count {
			data.remove(at: ip.row)
			sessions[keys[currentSession]] = data
			saveCurrentState()
		}
	}
	
	func removeSession(ip:IndexPath) {
		if ip.row < keys.count {
			let removed:String = keys[ip.row]
			keys.remove(at: ip.row)
			sessions.removeValue(forKey: removed)
			if currentSession == ip.row && keys.count > 0 {
				currentSession = 0
			} else if keys.count > 0 && currentSession > ip.row {
				currentSession -= 1
			}
			saveCurrentState()
		}
	}
	
}
