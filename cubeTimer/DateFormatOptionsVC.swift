//
//  DateFormatOptionsVC.swift
//  cubeTimer
//
//  Created by Audrey Seo on 10/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

// Months need zero padding from 0 to 1
//	unless the month is a word
//	Can either have January, February, March, April, May, June, July, August, September, October, November, December or
//					Jan,	 Feb,	   Mar,	  Apr,	 May, Jun,	Jul,  Aug,	  Sep,		 Oct,	  Nov,		Dec
// Days need zero padding from 0 to 1
// Years need zero padding from 0 to 1 unless full year, in which case 0
// Could have day of the week, no padding necessary
//	unless is a word
//	Can either have Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
//  or				Mon,	Tue,	 Wed,		Thu,	  Fri,	  Sat,		Sun
//  or				M		T		 W			Th		  F		  Sa		Su

enum DateFormats {
	
}

class DateFormatOptionsViewController: UICollectionViewController {
	var titles:[String] = ["Format", "Options"]
	var items:[[String]] = [["Full Month", "Day of Month", "Full Year"], ["2-digit Year", "0-Padded Month", "Month Digit", "Zero-Padded Day of Month"]]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView?.register(DateFormatCell.self, forCellWithReuseIdentifier: "cellId")
		collectionView?.register(CollectionHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "titleId")
		// custom stuff
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! DateFormatCell
		cell.label.text = items[indexPath.section][indexPath.row]
		cell.frame.size.height = 100
		cell.frame.size.width = 100
		return cell
	}
	
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return items.count
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		var movedRow = items[sourceIndexPath.section]
		let moved = movedRow[sourceIndexPath.row]
		movedRow.remove(at: sourceIndexPath.row)
		var insertRow = (sourceIndexPath.section == destinationIndexPath.section) ? movedRow : items[destinationIndexPath.section]
		insertRow.insert(moved, at: destinationIndexPath.row)
		items[sourceIndexPath.section] = movedRow
		items[destinationIndexPath.section] = insertRow
		collectionView.reloadData()
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items[section].count
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch kind {
		case UICollectionElementKindSectionHeader:
			let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "titleId", for: indexPath) as! CollectionHeader
			cell.label.text = titles[indexPath.section]
			return cell
		default:
			assert(false, "Unexpected Element Kind")
		}
		
	}
}

extension DateFormatOptionsViewController:UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 100, height: 100)
	}
}
