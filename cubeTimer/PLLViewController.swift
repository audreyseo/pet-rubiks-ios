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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// do other stuff here
		tableView.register(CubeCaseCell.self, forCellReuseIdentifier: "caseCellId")
		
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
		
		images = Array(repeating: "1", count: cases.count)
		for i in 1...images.count {
			images[i-1] = "\(i)"
		}
		for i in 0..<images.count {
			cases[i] = (caseInfo[images[i]]?["code"]!)!
		}
	}
	
	override func imageName(ip: IndexPath) -> String {
		return cases[ip.row]
	}
	
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let myCell = tableView.dequeueReusableCell(withIdentifier: "caseCellId") as! CubeCaseCell
		myCell.nameLabel.text = nameLabelText(indexPath: indexPath)
		myCell.probLabel.text = probLabelText(indexPath: indexPath)
		myCell.algLabel.text = firstAlgLabel(ip: indexPath)
		myCell.algLabel1.text = secondAlgLabel(ip: indexPath)
		let image = UIImage(named: imageName(ip: indexPath))
		myCell.imageView?.image = image
		
		myCell.imageView?.frame.size.width = 50
		myCell.imageView?.frame.size.height = 50
		return myCell
	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 55
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cases.count
	}
}
