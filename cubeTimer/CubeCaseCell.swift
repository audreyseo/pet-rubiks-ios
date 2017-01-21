//
//  CubeCaseCell.swift
//  cubeTimer
//
//  Created by Audrey Seo on 5/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit

class CubeCaseCell:UITableViewCell {
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.imageView?.translatesAutoresizingMaskIntoConstraints = false
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	let customImageView: UIImageView = {
		let iv = UIImageView(image: UIImage(named: "2"))
		iv.translatesAutoresizingMaskIntoConstraints = false
		iv.frame.size.width = 50
		iv.frame.size.height = 50
		return iv
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Sample Item"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 14)
		label.adjustsFontSizeToFitWidth = true
		label.numberOfLines = 0
		label.textAlignment = .center
		return label
	}()
	
	let algLabel: UILabel = {
		let label = UILabel()
		label.text = "Sample Item"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 11)
		label.numberOfLines = 0
		label.baselineAdjustment = .alignCenters
		return label
	}()
	
	let algLabel1: UILabel = {
		let label = UILabel()
		label.text = "Sample Item"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 11)
		label.numberOfLines = 0
		return label
	}()
	
	let probLabel: UILabel = {
		let label = UILabel()
		label.text = "Sample Item"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 10)
		label.numberOfLines = 0
		return label
	}()
	
	let algStacker:UIStackView = {
		let stck = UIStackView()
		stck.translatesAutoresizingMaskIntoConstraints = false
		stck.alignment = .center
		stck.axis = .horizontal
		return stck
	}()
	
	let imageNameStack:UIStackView = {
		let stck = UIStackView()
		stck.translatesAutoresizingMaskIntoConstraints = false
		stck.alignment = .center
		stck.axis = .vertical
		return stck
	}()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.imageView?.removeFromSuperview()
	}
	
	func addLayoutConstraint(format: String, viewsDictionary: [String: Any]) {
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
	}
	
	func setupViews() {
		var viewsDict: [String: Any] = ["v0": imageNameStack, "v1": probLabel, "v2": algStacker]
		self.separatorInset = UIEdgeInsets(top: 0, left: 55 + 16, bottom: 0, right: 0)
		self.separatorInset = UIEdgeInsets(top: 0, left: 55 + 16, bottom: 0, right: 0)
		
		// Setup other subviews
		self.setupAlgorithmStackView()
		self.setupImageStackView()
		
		
		// Add subviews
		addSubview(imageNameStack)
		addSubview(probLabel)
		addSubview(algStacker)
		
		
		// Add constraints
		addLayoutConstraint(format: "H:|-8-[v0(60)]-4-[v2]->=4-[v1(>=20,<=35)]-8-|", viewsDictionary: viewsDict)
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0(60)]-4-[v2]->=4-[v1(>=20,<=35)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageNameStack, "v1": probLabel, "v2": algStacker]))
		addConstraint(NSLayoutConstraint(item: algStacker, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
		
		addLayoutConstraint(format: "V:|-8-[v0(70)]-8-|", viewsDictionary: viewsDict)
		addLayoutConstraint(format: "V:|-8-[v1]-8-|", viewsDictionary: viewsDict)
		addLayoutConstraint(format: "V:|-8-[v2]-8-|", viewsDictionary: viewsDict)
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(70)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageNameStack]))
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": probLabel]))
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algStacker]))
	}
	
	func setupAlgorithmStackView() {
		if algLabel.text != "" {
			algLabel.removeFromSuperview()
			algLabel1.removeFromSuperview()
			
			algStacker.addSubview(algLabel)
			if algLabel1.text != "" {
				algStacker.addSubview(algLabel1)
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel]))
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel1]))
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]->=4-[v1]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel, "v1": algLabel1]))
				
			} else {
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel]))
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|->=27-[v0]->=27-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel]))
			}
		}
	}
	
	func setupImageStackView() {
		imageNameStack.addSubview(self.customImageView)
		imageNameStack.addSubview(self.nameLabel)
		imageNameStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v0(50)]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": self.customImageView]))
		imageNameStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(60)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		imageNameStack.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: customImageView, attribute: .centerX, multiplier: 1.0, constant: 0.0))
		
		imageNameStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(50)]-[v1(<=15)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": self.customImageView, "v1": self.nameLabel]))
	}
}
