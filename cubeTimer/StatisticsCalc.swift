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
		"mean", "best", "worst", "median", "var", "stdDev", "last5", "3of5", "last10", "10of12", "last100"
	]
	let displayNames:[String:String] = [
		"median": "Median",
		"mean": "Mean",
		"best": "Best",
		"worst": "Worst",
		"best3of5": "Best 3 of 5",
		"best5": "Best Avg. of 5",
		"3of5": "Avg. of 3 out of 5",
		"last5": "Avg. of Last 5",
		"stdDev": "Std. Dev.",
		"var": "Var.",
		"last10": "Last 10",
		"10of12": "10 of 12",
		"last100": "Last 100"
	]
	let statsRequiredCounts:[Int:[String]] = [
		2: ["mean", "stdDev", "var", "best", "worst"],
		3: ["median"],
		5: ["3of5", "last5"],
		6: ["best3of5", "best5"],
		10: ["last10"],
		11: ["best10"],
		12: ["10of12"],
		13: ["best10of12"],
		100: ["last100"],
		101: ["best100"]
	]
	var countsRequiredStats:[String: Int] = [String:Int]()
	var count = 0
	
	init() {
		// Initialize things...
		for (key, item) in statsRequiredCounts {
			for it in item {
				countsRequiredStats[it] = key
			}
		}
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
		for item in statNames {
			if data.count >= countsRequiredStats[item]! {
				avail += [item]
			}
		}
//		if data.count >= 3 {
//			avail += ["median"]
//		}
//		if data.count >= 2 {
//			avail += ["mean"]
//		}
//		
//		if data.count >= 5 {
//			avail += ["last5", "3of5"]
//		}
//		
//		if data.count >= 2 {
//			avail += ["stdDev", "var"]
//		}
//		
//		if data.count >= 10 {
//			avail += ["last10"]
//		}
//		
//		if data.count >= 12 {
//			avail += ["10of12"]
//		}
//		
//		if data.count >= 100 {
//			avail += ["last100"]
//		}
		
		return avail
	}
	
	func calculate() {
		self.stats["median"] = self.data.count >= 3 ? self.median() : 0.0
		self.stats["mean"] = self.data.count >= 2 ? self.average() : 0.0
		self.stats["best"] = self.data.count >= 2 ? Double(self.best()) : 0.0
		self.stats["worst"] = self.data.count >= 2 ? Double(self.worst()) : 0.0
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
	
	func best() -> Int {
		return self.data.min()!
	}
	
	func worst() -> Int {
		return self.data.max()!
	}
	
	func median() -> Double {
		if self.data.count >= 3 {
			let sortedData:[Int] = dataSorted()
			let sortedCount = sortedData.count
			let median = Int(Float(sortedCount) / 2.0)
			print("Median: \(median), Count: \(sortedCount)")
			print(sortedData[median])
			print(sortedData[median + 1])
			if count % 2 == 0 {
				return (Double(sortedData[median] + sortedData[median + 1])) / 2.0
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
		print("Array Slice Count: \(array.count)")
		for i in 0..<array.count {
			print("i: \(i)")
			total += array[i]
		}
		
		return Double(total) / Double(array.count)
	}
	
	func sliceMean(start:Int, end:Int) -> Double {
		var slice:ArraySlice<Int> = data[start...end - 1]
		var total:Int = 0
		for i in start..<end {
			total += slice[i]
		}
		
		return Double(total) / Double(end - start)
	}
	
	func sliceMeanExclude(start:Int, end:Int) -> Double {
		let slice:ArraySlice<Int> = data[start...end - 1]
		let regMean = sliceMean(start: start, end: end)
		let fraction:Double = Double(slice.min()! + slice.max()!) / Double(end - start)
		return (regMean - fraction) * (Double(end - start) / Double(end - start - 2))
	}
	
	
	func variance() -> Double {
		if data.count >= 2 {
			let mean = average()
			var total:Double = 0
			for i in 0...data.count - 1 {
				total += pow(Double(data[i]) - mean, 2)
			}
			
			// Need to divide by an extra 1000 because otherwise it will be milliseconds * milliseconds or microseconds
			return total / Double(data.count * 1000)
		}
		
		return -1.0
	}
	
	func standardDeviation() -> Double {
		if data.count >= 2 {
			// Need to multiply by 1000.0 to make it accurate again
			// because we assume it's in microseconds anyway
			return pow(variance() * 1000.0, 0.5)
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
