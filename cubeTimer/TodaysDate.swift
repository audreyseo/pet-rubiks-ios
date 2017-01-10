//
//  TodaysDate.swift
//  cubeTimer
//
//  Created by Audrey Seo on 10/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit


// needs the case, the title, the date format string

//enum MyDateFormats {
//	case yearShort(title: )
//}

class TodaysDate {
	var form:DateFormatter
	var today:Date
	var formats:[[String]] = [["Year Short", "Year Long"], ["Month 1-Digit", "Month 2-Digit", "Month Abbreviation", "Month Full"], ["Day", "Day 2-Digit"]]
	var types:[String] = ["Year", "Month", "Day"]
	init() {
		today = Date.init()
		form = DateFormatter()
		form.dateFormat = "yy|yyyy:|:M|MM|MMM|MMMM:|:d|dd"
	}
}
