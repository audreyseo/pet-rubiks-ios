//
//  CollectionHeader.swift
//  cubeTimer
//
//  Created by Audrey Seo on 10/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit


class CollectionHeader:UICollectionReusableView {
	let label:UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.text = "Sample"
		l.font = UIFont.systemFont(ofSize: 30)
		l.frame.size.width = 90
		l.numberOfLines = 0
		l.frame.size.height = 40
		return l
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	func myConstraints(vf:String, views: [String: Any]) {
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vf, options: NSLayoutFormatOptions(), metrics: nil, views: views))
	}
	
	func setupViews() {
		addSubview(label)
		
		addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
		
		myConstraints(vf: "H:|->=16-[v0]->=16-|", views: ["v0": label])
		myConstraints(vf: "V:|-8-[v0]-8-|", views: ["v0": label])
	}
}
