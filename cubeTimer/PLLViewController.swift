//
//  PLLViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit


class PLLViewController:OLLViewController {
	var cases:[String] = ["Aa", "Ab", "E", "F", "Ga", "Gb", "Gc", "Gd", "H", "Ja", "Jb", "Na", "Nb", "Ra", "Rb", "T", "Ua", "Ub", "V", "Y", "Z", "Solved"]
//	let casesToNums:[String:String] = [String:String]()
	var knownImages:[String] = [String]()
	var removedIndices:[Int] = [Int]()
	let casesKey = "PLLcasesKey"
	let knownImagesKey = "PLLknownImagesKey"
//	var isEditingKnown = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		caseInfo = [
			"1": ["code":"Ub","solve1alg":"R2 U (R U R' U')(R' U')(R' U R')","solve1length":"11","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"EdgesOrCorners"],
			"2": ["code":"Ua","solve1alg":"(R U')(R U)(R U)(R U') R' U' R2","solve1length":"11","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"EdgesOrCorners"],
			"3": ["code":"Z","solve1alg":"(M2 U M2 U M' U2 M2 U2 M' U2","solve1length":"10","solve2alg":"U2 (R U R' U)(R' U' R' U)(R U' R' U') R2 U R","solve2length":"16","prob":"\(1.0/36.0)","descript":"EdgesOrCorners"],
			"4": ["code":"H","solve1alg":"M2 U M2 U2 M U M2","solve1length":"7","solve2alg":"","solve2length":"0","prob":"\(1.0/72.0)","descript":"EdgesOrCorners"],
			"5": ["code":"Aa","solve1alg":"x [(R' U R') D2][(R U' R') D2] R2","solve1length":"10","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"EdgesOrCorners"],
			"6": ["code":"Ab","solve1alg":"x' [(R U' R) D2][(R' U R) D2] R2","solve1length":"10","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"EdgesOrCorners"],
			"7": ["code":"E","solve1alg":"x'[(R U' R')D(R U R')] D' [(R U R')D(R U' R')]D'","solve1length":"17","solve2alg":"x'[(R U' R') D (R U R')] u2 [(R' U R) D (R' U' R)]","solve2length":"16","prob":"\(1.0/36.0)","descript":"EdgesOrCorners"],
			"8": ["code":"Solved","solve1alg":"","solve1length":"0","solve2alg":"","solve2length":"0","prob":"\(1.0/72.0)","descript":"EdgesOrCorners"],
			"9": ["code":"Ra","solve1alg":"(L U2' L' U2')(L F')(L' U' L U)(L F) L2' U","solve1length":"14","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"SwapAdjacentCorners"],
			"10": ["code":"Rb","solve1alg":"(R' U2 R U2)(R' F)(R U R' U')(R' F') R2 U'","solve1length":"14","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"SwapAdjacentCorners"],
			"11": ["code":"Ja","solve1alg":"(R' U L')(U2 R U' R' U2)(R L U')","solve1length":"11","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"SwapAdjacentCorners"],
			"12": ["code":"Jb","solve1alg":"(R U R' F')[(R U R' U')(R' F)(R2 U' R') U']","solve1length":"14","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"SwapAdjacentCorners"],
			"13": ["code":"T","solve1alg":"(R U R' U')(R' F)(R2 U' R') U' (R U R' F')","solve1length":"14","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"SwapAdjacentCorners"],
			"14": ["code":"F","solve1alg":"(R' U2 R' d')(R' F')(R2 U' R' U)(R' F R U' F)","solve1length":"15","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"SwapAdjacentCorners"],
			"15": ["code":"V","solve1alg":"(R' U R' d')(R' F')(R2 U' R' U)(R' F R F)","solve1length":"14","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"SwapDiagonalCorners"],
			"16": ["code":"Y","solve1alg":"F R U' R' U' (R U R' F')[(R U R' U')(R' F R F')]","solve1length":"17","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"SwapDiagonalCorners"],
			"17": ["code":"Na","solve1alg":"[(L U' R) U2 (L' U R')][L U' R) U2 (L' U R')] U","solve1length":"15","solve2alg":"y (R U' R' U)(l U)(F U' R' F')(R U' R U)(l' U R')","solve2length":"18","prob":"\(1.0/72.0)","descript":"SwapDiagonalCorners"],
			"18": ["code":"Nb","solve1alg":"[(R' U L') U2 (R U' L)][(R' U L') U2 (R U' L')] U'","solve1length":"15","solve2alg":"","solve2length":"0","prob":"\(1.0/72.0)","descript":"SwapDiagonalCorners"],
			"19": ["code":"Ga","solve1alg":"R2 u R' U R' U' R u' R2 (y' R' U R)","solve1length":"13","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"DoubleSpins"],
			"20": ["code":"Gc","solve1alg":"R2 u' R U' R U R' u R2 (y R U' R')","solve1length":"13","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"DoubleSpins"],
			"21": ["code":"Gd","solve1alg":"(R U R') y' R2 u' R U' R' U R' u R2","solve1length":"13","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"DoubleSpins"],
			"22": ["code":"Gb","solve1alg":"(R' U' R) y R2 u R' U R U' R u' R2","solve1length":"13","solve2alg":"","solve2length":"0","prob":"\(1.0/18.0)","descript":"DoubleSpins"]
		]
		
		knownCasesKey = "PLLknownCasesKey"
		imagesKey = "PLLimagesKey"
		
		images = Array(repeating: "1", count: cases.count)
		for i in 1...images.count {
			images[i-1] = "\(i)"
		}
		for i in 0..<images.count {
			cases[i] = (caseInfo[images[i]]?["code"]!)!
			print("\(i): \(images[i])")
		}
		//super.viewDidLoad()
		// do other stuff here
		tableView.register(CubeCaseCell.self, forCellReuseIdentifier: "caseCellId")
		
		
		
		
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditing))
		getKnown()
		saveKnown()
	}
	
	override func registrationStuff() {
		// do nothing -> this is the point
	}
	
	override func getKnown() {
		super.getKnown()
		if userdef.array(forKey: knownImagesKey) != nil {
			knownImages = userdef.array(forKey: knownImagesKey) as! [String]
		}
		
		if userdef.array(forKey: casesKey) != nil {
			cases = userdef.array(forKey: casesKey) as! [String]
		}
	}
	
	override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		if isEditingKnown {
			moveRows(source: sourceIndexPath, dest: destinationIndexPath)
//			if sourceIndexPath.section == 1 {
//				let moved = knownCases[sourceIndexPath.row]
//				let movedImage = knownImages[sourceIndexPath.row]
//				knownCases.remove(at: sourceIndexPath.row)
//				knownImages.remove(at: sourceIndexPath.row)
//				knownCases.insert(moved, at: destinationIndexPath.row)
//				knownImages.insert(movedImage, at: destinationIndexPath.row)
//			} else {
//				let moved = images[sourceIndexPath.row]
//				let movedCase = cases[sourceIndexPath.row]
//				images.remove(at: sourceIndexPath.row)
//				cases.remove(at: sourceIndexPath.row)
//				images.insert(moved, at: destinationIndexPath.row)
//				cases.insert(movedCase, at: destinationIndexPath.row)
//			}
		}
	}
	
	override func moveRows(source: IndexPath, dest: IndexPath) {
		if source.section >= 0 && source.row >= 0 && dest.section >= 0 && dest.row >= 0 {
			if source.section == 1 {
				if dest.section == 1 {
					removeReinsert(array: &knownCases, source: source, dest: dest)
					removeReinsert(array: &knownImages, source: source, dest: dest)
				} else {
					removeReinsert(array: &knownCases, source: source, dest: dest, destArray: &cases)
					removeReinsert(array: &knownImages, source: source, dest: dest, destArray: &images)
				}
			} else {
				if dest.section == 0 {
					removeReinsert(array: &cases, source: source, dest: dest)
					removeReinsert(array: &images, source: source, dest: dest)
				} else {
					removeReinsert(array: &cases, source: source, dest: dest, destArray: &knownCases)
					removeReinsert(array: &images, source: source, dest: dest, destArray: &knownImages)
				}
			}
		}
	}

	
	override func saveKnown() {
		super.saveKnown()
		
		userdef.set(knownImages, forKey: knownImagesKey)
		userdef.set(cases, forKey: casesKey)
	}
	
	override func toggleEditing() {
		let title = navigationItem.rightBarButtonItem?.title
		navigationItem.rightBarButtonItem?.title = (title?.contains("Edit"))! ? "Done" : "Edit"
		isEditingKnown = !isEditingKnown
		tableView.setEditing(isEditingKnown, animated: true)
		if !isEditingKnown {
			saveKnown()
		}
	}
	
	override func imageName(ip: IndexPath) -> String {
		if ip.section == 1 && knownCases.count > 0 && knownCases.count > ip.row {
			return knownImages[ip.row]
		}
		return images[ip.row]
	}
	
	func imageNameForLabel(ip: IndexPath) -> String {
		if ip.section == 1 && knownCases.count > 0 && knownCases.count > ip.row {
			return knownCases[ip.row]
		}
		return cases[ip.row]
	}
	
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let myCell = tableView.dequeueReusableCell(withIdentifier: "caseCellId") as! CubeCaseCell
		myCell.nameLabel.text = imageNameForLabel(ip: indexPath)
		myCell.probLabel.text = probLabelText(indexPath: indexPath)
		myCell.algLabel.text = firstAlgLabel(ip: indexPath)
		myCell.algLabel1.text = secondAlgLabel(ip: indexPath)
		let image = UIImage(named: imageNameForLabel(ip: indexPath))
		myCell.customImageView.image = image
		
		myCell.customImageView.frame.size.width = 50
		myCell.customImageView.frame.size.height = 50
		return myCell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if isEditingKnown {
			if indexPath.section == 0 {
				knownCases.append(cases[indexPath.row])
				cases.remove(at: indexPath.row)
				knownImages.append(images[indexPath.row])
				images.remove(at: indexPath.row)
				removedIndices += [indexPath.row]
				tableView.reloadData()
			} else {
				cases.append(knownCases[indexPath.row])
				knownCases.remove(at: indexPath.row)
				images.append(knownImages[indexPath.row])
				knownImages.remove(at: indexPath.row)
				tableView.reloadData()
			}
		} else {
			tableView.deselectRow(at: indexPath, animated: true)
		}
		
		let c = tableView.cellForRow(at: indexPath)
		print("Separator Insets for cell at (\(indexPath.section), \(indexPath.row)): Left: \(c?.separatorInset.left), Right: \(c?.separatorInset.right)")
	}
	
	override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return 55
	}
	
//	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//		return 55
//	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if titles[section].contains("Learning") {
			return cases.count
		} else {
			return knownCases.count
		}
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
}
