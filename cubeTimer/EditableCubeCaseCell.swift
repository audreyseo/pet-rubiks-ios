//
//  EditableCubeCaseCell.swift
//  cubeTimer
//
//  Created by Audrey Seo on 21/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit


class EditableCubeCaseCell: CubeCaseCell {
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("Did implement init(coder:)")
	}
	
	
	override func setupViews() {
		// Add subviews to the content view
		self.contentView.addSubview(imageNameStack)
		self.contentView.addSubview(algStacker)
		self.contentView.addSubview(probLabel)
		
		let viewsDict: [String: Any] = ["v0": imageNameStack, "v1": probLabel, "v2": algStacker]
		
		self.setupImageStackView()
		self.setupAlgorithmStackView()
		
		
		// Add constraints to the cell's view
		addLayoutConstraint(format: "H:|-8-[v0(60)]-4-[v2]->=4-[v1(>=20,<=35)]-8-|", viewsDictionary: viewsDict)
		addLayoutConstraint(format: "V:|-8-[v0(70)]-8-|", viewsDictionary: viewsDict)
		addLayoutConstraint(format: "V:|-8-[v1]-8-|", viewsDictionary: viewsDict)
		addLayoutConstraint(format: "V:|-8-[v2]-8-|", viewsDictionary: viewsDict)
		
		addConstraint(equalityConstraint(item: algStacker, other: self, attributeToUse: .centerY))
	}
}
