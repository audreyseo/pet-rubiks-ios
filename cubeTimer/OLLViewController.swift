//
//  OLLViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class OLLViewController:UITableViewController {
	var images:[String] = Array(repeating: "", count: 58)
	var titles:[String] = ["Learning", "Learned"]
	var knownCases:[String] = [String]()
	var isEditingKnown = false
	var userdef = UserDefaults()
	
	var knownCasesKey = "knownCasesKey"
	var imagesKey = "imagesKey"
	
	var caseInfo:[String: [String: String]] = [
		"27": ["code": "OCLL1", "solve1alg": "(R U R' U) R U2 R'", "solve1length": "7", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"26": ["code": "OCLL2", "solve1alg": "R U2 R' U' R U' R'", "solve1length": "7", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"22": ["code": "OCLL3", "solve1alg": "[f (R U R' U') f'] [F (R U R' U') F']", "solve1length": "12", "solve2alg": "R U2' R2' U' R2 U' R2' U2 R2", "solve2length": "9", "prob": "\(1.0/54.0)"],
		"21": ["code": "OCLL4", "solve1alg": "F (R U R' U') (R U R' U') (R U R' U') F'", "solve1length": "14", "solve2alg": "y (R' U' R) U' (R' U R) U' (R' U2 R)", "solve2length": "12", "prob": "\(1.0/108.0)"],
		"24": ["code": "OCLL5", "solve1alg": "(r U R' U') (r' F R F')", "solve1length": "8", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"25": ["code": "OCLL6", "solve1alg": "F' (r U R' U') (r' F R)", "solve1length": "8", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"23": ["code": "OCLL7", "solve1alg": "R2 [D (R' U2) R] [D' (R' U2) R']", "solve1length": "9", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"58": ["code": "OCLL8", "solve1alg": "", "solve1length": "0", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/216.0)"],
		"57": ["code": "E1", "solve1alg": "(R U R' U') M' (U R U' r')",  "solve1length": "9", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/108.0)"],
		"28": ["code": "E2", "solve1alg": "M' U M U2 M' U M",  "solve1length": "7", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"44": ["code": "P1", "solve1alg": "f (R U R' U') f'", "solve1length": "6", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"43": ["code": "P2", "solve1alg": "f' (L' U' L U) f", "solve1length": "6", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"32": ["code": "P3", "solve1alg": "R U B' U' R' U R B R'", "solve1length": "9", "solve2alg": "R D L' D' R' U R B R'", "solve2length": "9", "prob": "\(1.0/54.0)"],
		"31": ["code": "P4", "solve1alg": "R' U' F U R U' R' F' R", "solve1length": "9", "solve2alg": "y2 L' d' R d L U' L' B' L", "solve2length": "9", "prob": "\(1.0/54.0)"],
		"38": ["code": "W1", "solve1alg": "(R U R' U) (R U' R' U') (R' F R F')", "solve1length": "12", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"36": ["code": "W2", "solve1alg": "(L' U' L U') (L' U L U) (L F' L' F)", "solve1length": "12", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"6": ["code": "S1", "solve1alg": "r U2 R' U' R U' r'", "solve1length": "7", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"5": ["code": "S2", "solve1alg": "r' U2 (R U R' U) r", "solve1length": "7", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"48": ["code": "L1", "solve1alg": "F (R U R' U') (R U R' U') F'", "solve1length": "10", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"47": ["code": "L2", "solve1alg": "F' (L' U' L U) (L' U' L U) F", "solve1length": "10", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"53": ["code": "L3", "solve1alg": "l' U' L U' L' U L U' L' U2 l", "solve1length": "11", "solve2alg": "y2 r' U' R U' R' U R U' R' U2 r", "solve2length": "12", "prob": "\(1.0/54.0)"],
		"54": ["code": "L4", "solve1alg": "(r U R' U) R U' R' U R U2' r'", "solve1length": "11", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"49": ["code": "L5", "solve1alg": "(R' F R' F') R2 U2 y (R' F R F')", "solve1length": "11", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"50": ["code": "L6", "solve1alg": "R' F R2 B' R2' F' R2 B R'", "solve1length": "9", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"9": ["code": "F1", "solve1alg": "(R' U' R) y' x' (R U') (R' F) (R U R')", "solve1length": "12", "solve2alg": "(R U R' U')R' F R2 U R' U' F'", "solve2length": "11", "prob": "\(1.0/54.0)"],
		"10": ["code": "F2", "solve1alg": "R U R' y R' F R U' R' F' R", "solve1length": "11", "solve2alg": "(R U R' U)(R' F R F') R U2 R'", "solve2length": "11", "prob": "\(1.0/54.0)"],
		"35": ["code": "F3", "solve1alg": "(R U2 R') (R' F R F') (R U2 R')", "solve1length": "10", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"37": ["code": "F4", "solve1alg": "F R U' R' U' R U R' F'", "solve1length": "9", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"30": ["code": "A1", "solve1alg": "R2 U R' B' R U' R2 U R B R'", "solve1length": "11", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"29": ["code": "A2", "solve1alg": "(R U R' U') R U' R' F' U' F R U R'", "solve1length": "13", "solve2alg": "[F (R U R' U') F'] U2 [(R U R' U') (R' F R F')", "solve2length": "15", "prob": "\(1.0/54.0)"],
		"41": ["code": "A3", "solve1alg": "[(R U R' U) R U2 R'] [F (R U R' U') F']", "solve1length": "13", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"42": ["code": "A4", "solve1alg": "[R' U2 (R U R' U) R] y [F (R U R' U') F']", "solve1length": "14", "solve2alg": "(R' F R F') (R' F R F') (R U R' U') (R U R')", "solve2length": "15", "prob": "\(1.0/54.0)"],
		"7": ["code": "LB1", "solve1alg": "(r U R' U) R U2 r'", "solve1length": "7", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"8": ["code": "LB2", "solve1alg": "r' U' R U' R' U2 r", "solve1length": "7", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"11": ["code": "LB3", "solve1alg": "[F' (L' U' L U) F] y [F (R U R' U') F']", "solve1length": "13", "solve2alg": "y (r U R' U) (R' F R F') R U2 r'", "solve2length": "11", "prob": "\(1.0/54.0)"],
		"12": ["code": "LB4", "solve1alg": "[F (R U R' U') F'] U [F (R U R' U') F']", "solve1length": "13", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"39": ["code": "LB5", "solve1alg": "R B' R' U' R U B U' R'", "solve1length": "9", "solve2alg": "y2 L F' (L' U' L U) F U' L'", "solve2length": "10", "prob": "\(1.0/54.0)"],
		"40": ["code": "LB6", "solve1alg": "R' [F (R U R' U') F'] U R", "solve1length": "9", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"45": ["code": "T1", "solve1alg": "F (R U R' U') F'", "solve1length": "6", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"33": ["code": "T2", "solve1alg": "(R U R' U') (R' F R F')", "solve1length": "8", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"46": ["code": "C1", "solve1alg": "R' U' (R' F R F') U R", "solve1length": "8", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"34": ["code": "C2", "solve1alg": "(R U R2' U') (R' F) (R U) (R U') F'", "solve1length": "11", "solve2alg": "(R U R' U') x D' R' U R U' D x'", "solve2length": "12", "prob": "\(1.0/54.0)"],
		"55": ["code": "I1", "solve1alg": "R' U2 R2 U R' U R U2 x' U' R' U", "solve1length": "12", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/108.0)"],
		"52": ["code": "I2", "solve1alg": "(R U R' U) R d' R U' R' F'", "solve1length": "10", "solve2alg": "R' U' R U' R' d R' U R B", "solve2length": "10", "prob": "\(1.0/54.0)"],
		"56": ["code": "I3", "solve1alg": "F (R U R' U') R F' (r U R' U') r'", "solve1length": "12", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/108.0)"],
		"51": ["code": "I4", "solve1alg": "f (R U R' U') (R U R' U') f'", "solve1length": "10", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"16": ["code": "K1", "solve1alg": "(r U r') (R U R' U') (r U' r')", "solve1length": "10", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"15": ["code": "K2", "solve1alg": "(l' U' l) (L' U' L U) (l' U l)", "solve1length": "10", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"13": ["code": "K3", "solve1alg": "F U R U' R2 F' R (U R U' R')", "solve1length": "11", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"14": ["code": "K4", "solve1alg": "R' F R U R' F' R y' R U' R'", "solve1length": "11", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"1": ["code": "O1", "solve1alg": "R U2 R' (R' F R F') U2 (R' F R F')", "solve1length": "12", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/108.0)"],
		"2": ["code": "O2", "solve1alg": "[F (R U R' U') F'] [f (R U R' U') f']", "solve1length": "12", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"3": ["code": "O3", "solve1alg": "[f (R U R' U') f'] U' [F (R U R' U') F']", "solve1length": "13", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"4": ["code": "O4", "solve1alg": "[f (R U R' U') f'] U [F (R U R' U') F']", "solve1length": "13", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"18": ["code": "O5", "solve1alg": "[F (R U R' U) F'] y' U2 (R' F R F')", "solve1length": "12", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"19": ["code": "O6", "solve1alg": "M U (R U R' U') M' (R' F R F')",  "solve1length": "11", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"17": ["code": "O7", "solve1alg": "(R U R' U) (R' F R F') U2 (R' F R F')", "solve1length": "13", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/54.0)"],
		"20": ["code": "O8", "solve1alg": "M U (R U R' U') M2 (U R U' r')",  "solve1length": "11", "solve2alg": "", "solve2length": "0", "prob": "\(1.0/216.0)"]]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		registrationStuff()
		
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 140
	}
	
	func registrationStuff() {
		// do stuff here
		for i in 1...58 {
			images[i - 1] = "\(i)"
		}
		
		tableView.register(CubeCaseCell.self, forCellReuseIdentifier: "caseCellId")
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditing))
		getKnown()
		saveKnown()
	}
	
	func getKnown() {
		if userdef.array(forKey: knownCasesKey) != nil {
			knownCases = userdef.array(forKey: knownCasesKey) as! [String]
		}
		
		if userdef.array(forKey: imagesKey) != nil {
			images = userdef.array(forKey: imagesKey) as! [String]
		}
	}
	
	func saveKnown() {
		userdef.set(knownCases, forKey: knownCasesKey)
		userdef.set(images, forKey: imagesKey)
	}
	
	func toggleEditing() {
		let title = navigationItem.rightBarButtonItem?.title
		navigationItem.rightBarButtonItem?.title = (title?.contains("Edit"))! ? "Done" : "Edit"
		isEditingKnown = !isEditingKnown
		tableView.setEditing(isEditingKnown, animated: true)
		if !isEditingKnown {
			saveKnown()
		}
	}

	
	func imageName(ip: IndexPath) -> String {
		if titles[ip.section].contains("Learned") {
			return knownCases[ip.row]
		}
		return images[ip.row]
	}
	
	func nameLabelText(indexPath: IndexPath) -> String {
		let num:String = imageName(ip: indexPath)
		return caseInfo[num]!["code"]!
	}
	
	func probLabelText(indexPath: IndexPath) -> String {
		let name = imageName(ip: indexPath)
		let str = (caseInfo[name]?["prob"]!)
		let index = str?.index((str?.startIndex)!, offsetBy: 5)
		return (str?.substring(to: index!))!
	}
	
	func firstAlgLabel(ip: IndexPath) -> String {
		let name = imageName(ip: ip)
		return (caseInfo[name]?["solve1alg"]!)!
	}
	
	func secondAlgLabel(ip: IndexPath) -> String {
		let name = imageName(ip: ip)
		return (caseInfo[name]?["solve2alg"]!)!
	}
	
	override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		return isEditingKnown
	}
	
	override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		print("Negative?: \(sourceIndexPath.section), \(sourceIndexPath.row), \(destinationIndexPath.section), \(destinationIndexPath.row)")
		if isEditingKnown {
			moveRows(source: sourceIndexPath, dest: destinationIndexPath)
		}
	}
	
	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		cell.separatorInset = UIEdgeInsets(top: 0, left: 55 + 16, bottom: 0, right: 0)
	}
	
	func moveRows(source:IndexPath, dest:IndexPath) {
		if source.section >= 0 && source.row >= 0 && dest.section >= 0 && dest.row >= 0 {
			if source.section == 1 {
				if dest.section == 1 {
					removeReinsert(array: &knownCases, source: source, dest: dest)
				} else {
					removeReinsert(array: &knownCases, source: source, dest: dest, destArray: &images)
				}
			} else {
				if dest.section == 0 {
					removeReinsert(array: &images, source: source, dest: dest)
				} else {
					removeReinsert(array: &images, source: source, dest: dest, destArray: &knownCases)
				}
			}
		}
	}
	
	func removeReinsert( array:inout [String], source:IndexPath, dest:IndexPath) {
		let moved = array[source.row]
		array.remove(at: source.row)
		array.insert(moved, at: dest.row)
	}
	
	func removeReinsert( array:inout [String], source:IndexPath, dest:IndexPath, destArray:inout [String]) {
		let moved = array[source.row]
		array.remove(at: source.row)
		destArray.insert(moved, at: dest.row)
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let myCell = tableView.dequeueReusableCell(withIdentifier: "caseCellId") as! CubeCaseCell
		myCell.nameLabel.text = nameLabelText(indexPath: indexPath)
		myCell.probLabel.text = probLabelText(indexPath: indexPath)
		myCell.algLabel.text = firstAlgLabel(ip: indexPath)
		myCell.algLabel1.text = secondAlgLabel(ip: indexPath)
		let image = UIImage(named: imageName(ip: indexPath))
		myCell.customImageView.image = image
		
		myCell.customImageView.frame.size.width = 50
		myCell.customImageView.frame.size.height = 50
		myCell.setupViews()
		return myCell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if isEditingKnown {
			if indexPath.section == 0 {
				knownCases.append(images[indexPath.row])
				images.remove(at: indexPath.row)
				tableView.reloadData()
			} else {
				images.append(knownCases[indexPath.row])
				knownCases.remove(at: indexPath.row)
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
			return images.count
		} else {
			return knownCases.count
		}
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return titles.count
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return titles[section]
	}
}
