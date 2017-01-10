//
//  TimeConversion.swift
//  cubeTimer
//
//  Created by Audrey Seo on 4/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import Foundation

enum TimeTypes {
	case minSecMil(minPad:Bool)
	case hrMinSecMil(hrPad:Bool)
	case secMil(secPad:Bool)
	case grow(pad:Bool)
}

class TimeConversion {
	let millisPerSecond:Int = 1000
	let secondsPerMinute:Int = 60
	let minutesPerHour:Int = 60
	var timeType:TimeTypes = .secMil(secPad: true)
	
	init() {
		// Empty
	}
	
	init(newType:TimeTypes) {
		timeType = newType
	}
	
	func timeString(millis:Int) -> String {
		switch timeType {
		case .minSecMil(minPad: true):
			return "\(paddedMinutes(millis: millis)):\(paddedSeconds(millis: millis)).\(paddedMillis(millis:millis))"
		case .minSecMil(minPad: false):
			return "\(minutesFromMilliseconds(millis: millis)):\(paddedSeconds(millis: millis)).\(paddedMillis(millis:millis))"
			
		case .secMil(secPad: true):
			return "\(paddedSeconds(millis: millis)).\(paddedMillis(millis: millis))"
		case .secMil(secPad: false):
			return "\(secondsFromMilliseconds(millis: millis)).\(paddedMillis(millis: millis))"
		default:
			break;
		}
		
		if minutesFromMilliseconds(millis: millis) < 1 {
			return "\(paddedSeconds(millis: millis)).\(paddedMillis(millis: millis))"
		} else {
			return "\(paddedMinutes(millis: millis)):\(paddedSeconds(millis: millis)).\(paddedMillis(millis:millis))"
		}
	}
	
	func paddedNumber(number:Int, numberOfZeroes:Int) -> String {
		var nums:String = ""
		
		for i in 1...numberOfZeroes {
			if Decimal(number) < pow(10, i) {
				nums.append("0")
			}
		}
		
		return "\(nums)\(number)"
	}
	
	func millisFromMilliseconds(millis:Int) -> Int {
		return millis % millisPerSecond
	}
	
	func secondsFromMilliseconds(millis:Int) -> Int {
		return Int(floor(Double(millis) / Double(millisPerSecond))) % secondsPerMinute
	}
	
	func minutesFromMilliseconds(millis:Int) -> Int {
		return Int(floor(Double(millis) / Double(millisPerSecond * secondsPerMinute)))
	}
	
	func paddedMinutes(millis:Int) -> String {
		return paddedNumber(number: minutesFromMilliseconds(millis: millis), numberOfZeroes: 1)
	}
	
	func paddedMillis(millis:Int) -> String {
		return paddedNumber(number: millisFromMilliseconds(millis: millis), numberOfZeroes: 2)
	}
	
	func paddedSeconds(millis:Int) -> String {
		return paddedNumber(number: secondsFromMilliseconds(millis: millis), numberOfZeroes: 1)
	}
}
