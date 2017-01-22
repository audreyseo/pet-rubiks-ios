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
		
//		self.contentView.addSubview(imageNameStack)
//		self.contentView.addSubview(algStacker)
//		self.contentView.addSubview(probLabel)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("Did implement init(coder:)")
	}
	
	override func addLayoutConstraint(format: String, viewsDictionary: [String: Any]) {
		self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
	}
	
	override func setupViews() {
		// Add subviews to the content view
		self.contentView.frame = self.bounds
		
		let viewsDict: [String: Any] = ["v0": imageNameStack, "v1": probLabel, "v2": algStacker]
		
		self.setupImageStackView()
		self.setupAlgorithmStackView()
		
		self.contentView.addSubview(imageNameStack)
		self.contentView.addSubview(algStacker)
		self.contentView.addSubview(probLabel)
		
		
		// Add constraints to the cell's view
		addLayoutConstraint(format: "H:|-4-[v0(60)]-4-[v2]->=4-[v1(>=20,<=35)]-8-|", viewsDictionary: viewsDict)
		addLayoutConstraint(format: "V:|-8-[v0(70)]-8-|", viewsDictionary: viewsDict)
		addLayoutConstraint(format: "V:|-8-[v1]-8-|", viewsDictionary: viewsDict)
		addLayoutConstraint(format: "V:|-8-[v2]-8-|", viewsDictionary: viewsDict)
		
		addConstraint(equalityConstraint(item: algStacker, other: self, attributeToUse: .centerY))
		
//		addConstraint(equalityConstraint(item: self.contentView, other: self, attributeToUse: .bottom))
//		addConstraint(equalityConstraint(item: self.contentView, other: self, attributeToUse: .top))
		
//		self.layoutSubviews()
	}
}
