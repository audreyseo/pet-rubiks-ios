//
//  StatisticsCalc.swift
//  cubeTimer
//
//  Created by Audrey Seo on 28/12/2016.
//  Copyright © 2016 Audrey Seo. All rights reserved.
//

import Foundation


class StatisticsCalc {
	var data:[Int] = [Int]()
	var stats:[String:Double] = [
		"median": 0.0,
		"mean": 0.0,
		"3of5": 0.0,
		"last5": 0.0,
		"stdDev": 0.0,
		"var": 0.0,
		"last10": 0.0,
		"10of12": 0.0,
		"last100": 0.0
	]
	let statNames:[String] = [
		"median", "mean", "3of5", "last5", "stdDev", "var", "last10", "10of12", "last100"
	]
	let displayNames:[String:String] = [
		"median": "Median",
		"mean": "Mean",
		"3of5": "3 of 5",
		"last5": "Last 5",
		"stdDev": "Std. Dev.",
		"var": "Var.",
		"last10": "Last 10",
		"10of12": "10 of 12",
		"last100": "Last 100"
	]
	var count = 0
	
	init() {
		// Initialize things...
	}
	
	func updateData(newData:[Int]) {
		self.data = newData
		self.count = self.data.count
		
		calculate()
	}
	
	func getStat(index:Int) -> Double? {
		return stats[availableStats()[index]]
	}
	
	func getName(index:Int) -> String? {
		return availableStats()[index]
	}
	
	func getDisplayName(index:Int) -> String? {
		return displayNames[availableStats()[index]]
	}
	
	func getNumStats() -> Int {
		return availableStats().count
	}
	
	func availableStats() -> [String] {
		var avail:[String] = [String]()
		if data.count >= 3 {
			avail += ["median"]
		}
		if data.count >= 2 {
			avail += ["mean"]
		}
		
		if data.count >= 5 {
			avail += ["last5", "3of5"]
		}
		
		if data.count >= 2 {
			avail += ["stdDev", "var"]
		}
		
		if data.count >= 10 {
			avail += ["last10"]
		}
		
		if data.count >= 12 {
			avail += ["10of12"]
		}
		
		if data.count >= 100 {
			avail += ["last100"]
		}
		
		return avail
	}
	
	func calculate() {
		self.stats["median"] = self.data.count >= 3 ? self.median() : 0.0
		self.stats["mean"] = self.data.count >= 2 ? self.average() : 0.0
		self.stats["3of5"] = self.data.count >= 5 ? self.last3of5() : 0.0
		self.stats["last5"] = self.data.count >= 5 ? self.last5() : 0.0
		self.stats["stdDev"] = self.data.count >= 2 ? self.standardDeviation() : 0.0
		self.stats["var"] = self.data.count >= 2 ? self.variance() : 0.0
		self.stats["last10"] = self.data.count >= 10 ? self.last10() : 0.0
		self.stats["10of12"] = self.data.count >= 12 ? self.last10of12() : 0.0
		self.stats["last100"] = self.data.count >= 100 ? self.last100() : 0.0
	}
	
	func dataSorted() -> [Int] {
		return self.data.sorted()
	}
	
	func median() -> Double {
		if self.data.count >= 3 {
			let sortedData:[Int] = dataSorted()
			let sortedCount = sortedData.count
			let median = Int(Float(sortedCount) / 2.0)
			if count % 2 == 0 {
				return (Double(sortedData[median] + sortedData[median])) / 2.0
			} else {
				return Double(sortedData[median])
			}

		}
		return -1.0
	}
	
	func average() -> Double {
		if self.data.count >= 2 {
			var total:Int = 0
			
			for i in 0...self.data.count - 1 {
				total += self.data[i]
			}
			
			return Double(total) / Double(data.count)
		}
		
		return -1.0
	}
	
	func average(array:ArraySlice<Int>) -> Double {
		var total:Int = 0
		for i in 0...array.count - 1 {
			total += array[i]
		}
		
		return Double(total) / Double(array.count)
	}
	
	func sliceMean(start:Int, end:Int) -> Double {
		var slice:ArraySlice<Int> = data[start...end - 1]
		var total:Int = 0
		for i in 0...slice.count - 1 {
			total += slice[i]
		}
		
		return Double(total) / Double(data.count)
	}
	
	func sliceMeanExclude(start:Int, end:Int) -> Double {
		let slice:ArraySlice<Int> = data[start...end - 1]
		let regMean = average(array: slice)
		let fraction:Double = Double(slice.min()! + slice.max()!) / Double(slice.count)
		return regMean - fraction
	}
	
	
	func variance() -> Double {
		if data.count >= 2 {
			let mean = average()
			var total:Double = 0
			for i in 0...data.count - 1 {
				total += pow(Double(data[i]) - mean, 2)
			}
			return total / Double(data.count)
		}
		
		return -1.0
	}
	
	func standardDeviation() -> Double {
		if data.count >= 2 {
			return pow(variance(), 0.5)
		}
		return -1.0
	}
	
	func last5() -> Double {
		if data.count >= 5 {
			let last = 5
			return sliceMean(start: data.count - 1 - last, end: data.count)
		}
		return -1.0
	}
	
	func last3of5() -> Double {
		if data.count >= 5 {
			let last = 5
			return sliceMeanExclude(start: data.count - 1 - last, end: data.count)
		}
		return -1.0
	}
	
	func last10() -> Double {
		if data.count >= 10 {
			let last = 10
			return sliceMean(start: data.count - 1 - last, end: data.count)
		}
		return -1.0
	}
	
	func last10of12() -> Double {
		if data.count >= 12 {
			let last = 12
			return sliceMeanExclude(start: data.count - 1 - last, end: data.count)
		}
		return -1.0
	}
	
	func last100() -> Double {
		if data.count >= 100 {
			let last = 100
			return sliceMean(start: data.count - 1 - last, end: data.count)
		}
		return -1.0
	}
}
