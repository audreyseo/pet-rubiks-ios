//
//  DateFormatOptionsVC.swift
//  cubeTimer
//
//  Created by Audrey Seo on 10/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit


class DateFormatOptionsViewController: UICollectionViewController {
	var items:[String] = ["Full Month", "Day of Month", "Full Year", "2-digit Year", "0-Padded Month", "Month Digit", "Zero-Padded Day of Month"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView?.register(DateFormatCell.self, forCellWithReuseIdentifier: "cellId")
		
		// custom stuff
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! DateFormatCell
		cell.label.text = items[indexPath.row]
		cell.frame.size.height = 100
		cell.frame.size.width = 100
		return cell
	}
	
	
	
	override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		let moved = items[sourceIndexPath.row]
		items.remove(at: sourceIndexPath.row)
		items.insert(moved, at: destinationIndexPath.row)
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items.count
	}
	
}

extension DateFormatOptionsViewController:UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 100, height: 100)
	}
}
