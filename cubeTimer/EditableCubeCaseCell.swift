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
		
		self.setupImageStackView()
		self.setupAlgorithmStackView()
		
		
		// Add constraints to the cell's view
		
	}
}
