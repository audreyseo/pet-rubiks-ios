//
//  SecondViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 27/12/2016.
//  Copyright © 2016 Audrey Seo. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
	var hasTabControl:Bool = false
	var tbc:InfoSharingTabController = InfoSharingTabController()
	var data:[Int] = [Int]()
	var activeData:[Int] = [Int]()
	var oldSize:Int = 0
	
	var titles:[String] = ["Statistics", "Times"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "Statistics and Times"
		
		// Assigns the class MyCell to the type of cell that we use in the table view
		tableView.register(StatsCell.self, forCellReuseIdentifier: "cellId")
		
		// Assigns the class Header to the type of header cell that we use
//		tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "headerId")
		
//		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Choose Hall", style: .plain, target: self, action: #selector(SecondViewController.showPickerView))
		
		tableView.sizeToFit()
		
		// ty to this tutorial for the following code for auto-height for cells: https://www.raywenderlich.com/129059/self-sizing-table-view-cells
		tableView.estimatedRowHeight = 140
		
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if self.tabBarController != nil {
			self.tbc = self.tabBarController as! InfoSharingTabController
			self.hasTabControl = true
			
			if tbc.data.count > 0 {
				for i in 0...tbc.data.count - 1 {
					print("Data \(i): \(tbc.data[i])")
				}
				oldSize = self.data.count
				activeData = self.data
				self.data = tbc.data
				
				if oldSize < self.data.count && oldSize > 0 {
					performInsertion()
				} else {
					activeData = self.data
				}
			}
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let myCell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! StatsCell
		myCell.nameLabel.text = "\(indexPath.row + 1)"
		myCell.statLabel.text = "\(activeData[indexPath.row])"
		
		return myCell
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return titles.count
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return titles[section]
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if titles[section].contains("Statistics") {
			return 0
		} else if titles[section].contains("Times") {
			return activeData.count
		} else {
			return 0
		}
	}
	
	func performInsertion() {
		if (data.count >= 1) {
			let originalSize:Int = oldSize
			let newSize:Int = data.count
			
			print("Old Size, New Size: ", originalSize, ", ", newSize, separator: "")
			var indexPaths = [IndexPath]()
			var originalPaths = [IndexPath]()
			var bottomHalfIndexPaths = [IndexPath]()
			
			if (newSize >= originalSize) {
				let isAbsoluteDiffGreaterThanOne:Bool = newSize - originalSize > 1
				for i in 0...data.count - 1 {
					if (i < data.count) {
						if (i < originalSize) {
							activeData[i] = data[i]
						} else {
							activeData.append(data[i])
						}
					}
					if (i >= originalSize) {
						indexPaths.append(IndexPath(row: i, section: 1))
					} else {
						originalPaths.append(IndexPath(row: i, section: 1))
					}
				}
				
				if (isAbsoluteDiffGreaterThanOne) {
					for _ in 0...indexPaths.count / 2 - 1 {
						bottomHalfIndexPaths.append(indexPaths.removeLast())
					}
				}
				
				tableView.beginUpdates()
				tableView.reloadRows(at: originalPaths, with: .fade)
				if (isAbsoluteDiffGreaterThanOne) {
					tableView.insertRows(at: indexPaths, with: .right)
					tableView.insertRows(at: bottomHalfIndexPaths, with: .left)
				} else if (newSize - originalSize == 1) {
					tableView.insertRows(at: indexPaths, with: .right)
				}
				tableView.endUpdates()
				adjustHeightOfTableview()
			} else if (newSize < originalSize) {
				for i in 0...originalSize - 1 {
					
					if (i < newSize) {
						activeData[i] = data[i]
					} else {
						activeData.removeLast()
					}
					
					if (i >= newSize) {
						indexPaths.append(IndexPath(row: i, section: 1))
					} else {
						originalPaths.append(IndexPath(row: i, section: 1))
					}
				}
				
				if indexPaths.count > 2 {
					for _ in 0...indexPaths.count / 2 - 1 {
						bottomHalfIndexPaths.append(indexPaths.removeLast())
					}
					
					tableView.beginUpdates()
					tableView.reloadRows(at: originalPaths, with: .fade)
					tableView.deleteRows(at: indexPaths, with: .right)
					tableView.deleteRows(at: bottomHalfIndexPaths, with: .left)
					tableView.endUpdates()
					adjustHeightOfTableview()
				} else {
					tableView.beginUpdates()
					tableView.reloadRows(at: originalPaths, with: .fade)
					tableView.deleteRows(at: indexPaths, with: .right)
					tableView.endUpdates()
					adjustHeightOfTableview()
				}
			}
		}
	}
	
	func adjustHeightOfTableview() {
		//		let height:CGFloat = CGFloat(items.count * 50);
		var height:CGFloat = 0;
		
		for i in 0...activeData.count - 1 {
			if (tableView.cellForRow(at: IndexPath(row: i, section: 0)) != nil) {
				let cell:StatsCell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as! StatsCell
				height = height + cell.frame.height;
			}
		}
		//		let maxHeight:CGFloat = self.tableView.superview!.frame.size.height - self.tableView.frame.origin.y;
		
		if tableView.contentSize.height != height {
			tableView.contentSize = CGSize(width: tableView.contentSize.width, height: height)
		}
	}

}

