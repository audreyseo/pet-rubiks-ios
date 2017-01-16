//
//  Session.swift
//  cubeTimer
//
//  Created by Audrey Seo on 7/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import Foundation

class Session {
	var name:String
	var cubeType:String?
	var cubeManufacturer:String?
	var startDate:Date
	var endDate:Date
	var numTimes:Int
	var data:[Int]
	var timeStamps:[Date]
	var userDefsKey:String
	var defs = UserDefaults()
	var converter = TimeConversion()
	
	init(name:String) {
		self.name = name
		userDefsKey = "\(name)SessionKey"
		
		startDate = Date.init()
		endDate = Date.init()
		numTimes = 0
		data = [Int]()
		timeStamps = [Date]()
		
		get()
		save()
	}
	
	func save() {
		defs.set(self, forKey: userDefsKey)
	}
	
	func hasSavedBefore() -> Bool {
		return (defs.object(forKey: userDefsKey) as? Session) != nil
	}
	
	func get() {
		if hasSavedBefore() {
			let oldSelf = defs.object(forKey: userDefsKey) as! Session
			self.cubeType = oldSelf.cubeType
			self.cubeManufacturer = oldSelf.cubeManufacturer
			self.startDate = oldSelf.startDate
			self.endDate = oldSelf.endDate
			self.data = oldSelf.data
			self.numTimes = oldSelf.numTimes
			self.timeStamps = oldSelf.timeStamps
		}
	}
	
	func getName() -> String {
		return self.name
	}
	
	func append(newValue:Int) {
		data += [newValue]
		numTimes = data.count
		timeStamps += [Date.init()]
		// End date should store the date of the last time added
		endDate = timeStamps[timeStamps.endIndex - 1]
	}
	
	func remove(index:Int) {
		if index < numTimes {
			data.remove(at: index)
			numTimes -= 1
			timeStamps.remove(at: index)
			
			endDate = timeStamps[timeStamps.endIndex - 1]
		}
	}
	
	func remove(ip:IndexPath) {
		remove(index: ip.row)
	}
	
	func time(index:Int) -> Int {
		if index < numTimes {
			return data[index]
		}
		// Value that means something went wrong
		return -1
	}
	
	func csvData() -> String {
		var rowArray:[String] = [String]()
		
		rowArray.append("time,millis,timeStamp")
		
		for i in 0..<data.count {
			rowArray.append("\(converter.timeString(millis: data[i])),\(data[i]),\(timeStamps[i])")
		}
		return rowArray.joined(separator: "\n")
	}
}
