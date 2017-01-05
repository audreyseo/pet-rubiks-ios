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
	var conversion:TimeConversion = TimeConversion()
	
	var titles:[String] = ["Statistics", "Times", ""]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "Statistics and Times"
		
		// Assigns the class MyCell to the type of cell that we use in the table view
		tableView.register(StatsCell.self, forCellReuseIdentifier: "cellId")
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "footerId")
		
		// Assigns the class Header to the type of header cell that we use
//		tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "headerId")
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "More", style: .plain, target: self, action: #selector(editOrShare))
		
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
				
				if oldSize != self.data.count && oldSize > 0 {
					performInsertion()
				} else {
					activeData = self.data
				}
			}
		}
		
		let footerView = UITableViewCell(style: .subtitle, reuseIdentifier: "footerId")
//		footerView.nameLabel.text = ""
		footerView.isOpaque = true
		footerView.frame.size.height = 5.0
		
		// Need to delete either one of these but all I wanted is for the background to be normal hallelujah
		self.tableView.backgroundColor = UIColor.groupTableViewBackground
		self.view.backgroundColor = UIColor.groupTableViewBackground
		self.tableView.tableFooterView = footerView
		self.tableView.tableFooterView?.tintColor = UIColor.groupTableViewBackground
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	// ======================================================================================================
	// =									TAB BAR CONTROLLER METHODS										=
	// ======================================================================================================
	
	func editOrShare() {
		let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete the last time?", preferredStyle: .actionSheet)
		let shareAction = UIAlertAction(title: "Share", style: .default, handler: { action in
			print("Responding to handler - share")
		
			// Does sharing stuff here
			// Writes CSV file
			
			// keep it simple here - make string
			var csvContents = ""
			let csvColumns = ["time"]
			csvContents.append(csvColumns.joined(separator: ","))
			csvContents.append("\n")
			var stringData:[String] = Array(repeating: "", count: self.tbc.data.count)
			for i in 0..<self.tbc.data.count {
				stringData[i] = self.conversion.timeString(millis: self.tbc.data[i])
			}
			csvContents.append(stringData.joined(separator: "\n"))
			
			let fileManager = FileManager()
			let fileFolder = String(describing: fileManager.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask))
			
			do {
//				let error = NSError()
				
				
				
				fileManager.changeCurrentDirectoryPath(String(describing: fileManager.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)))
				
				print("Changed directories")
				if !fileManager.fileExists(atPath: "\(fileFolder)/session_data.csv") {
					print("Creating file at path \(fileFolder)...")
					fileManager.createFile(atPath: "\(fileFolder)/session_data.csv", contents: csvContents.data(using: String.Encoding.unicode), attributes: nil)
					print("Created file.")
					let files = try fileManager.contentsOfDirectory(atPath: "\(fileFolder)/")
					for i in 0..<files.count {
						print("#\(i): \(files[i])")
					}
				} else {
					print("Writing to file...")
					try csvContents.write(toFile: "\(fileFolder)/session_data.csv", atomically: true, encoding: String.Encoding.unicode)
				}
				print("It worked!")
				
			} catch {
				print("There was an error woops")
			}
			
			
			
			// Shares
			let fileString = Bundle.main.path(forResource: "cubeTimer/session_data", ofType: "csv")
			print("My file string: \(fileString)")
			let url:URL = URL(fileURLWithPath: fileString!)
			let activityObjects = [url]
			let activity = UIActivityViewController(activityItems: activityObjects, applicationActivities: nil)
			
			let excludedActivities:[UIActivityType] = [.assignToContact, .openInIBooks, .postToFacebook, .postToVimeo, .postToWeibo, .postToFlickr, .postToTwitter, .postToTencentWeibo, .saveToCameraRoll, .addToReadingList]
			activity.excludedActivityTypes = excludedActivities
			self.present(activity, animated: true, completion: nil)
		})
		
		let editAction = UIAlertAction(title: "Edit", style: .default, handler: { action in
			print("Responding to handler - edit")
			
			// Does editing stuff here
		})
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		
		alert.addAction(shareAction)
		alert.addAction(editAction)
		alert.addAction(cancelAction)
		self.present(alert, animated: true, completion: nil)
	}
	
	
	
	// ======================================================================================================
	// =							   TABLEVIEW DELEGATE & DATASOURCE METHODS								=
	// ======================================================================================================
	
	// cellForRowAt indexPath
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let myCell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! StatsCell
		myCell.nameLabel.text = "\(indexPath.row + 1)"
		myCell.statLabel.text =  conversion.timeString(millis: activeData[indexPath.row]) //"\(activeData[indexPath.row])"
		
		return myCell
	}
	
	// didSelectRowAt indexPath
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	// estimatedHeightForHeaderInSection
	override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
		return 50
	}
	
	// numberOfSections
	override func numberOfSections(in tableView: UITableView) -> Int {
		return titles.count
	}
	
	// numberOfRowsInSection
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if titles[section].contains("Statistics") {
			return 0
		} else if titles[section].contains("Times") {
			return activeData.count
		} else {
			return 0
		}
	}
	
	// titleForHeaderInSection
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return titles[section]
	}
	
	// viweForHeaderInSection
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let myCell = tableView.dequeueReusableCell(withIdentifier: "footerId")! as UITableViewCell
		myCell.contentView.backgroundColor = UIColor.groupTableViewBackground
		myCell.textLabel?.text = titles[section]
		return myCell
		
	}
	
	
	
	// ======================================================================================================
	// =									  TABLEVIEW HELPER METHODS									    =
	// ======================================================================================================

	
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

