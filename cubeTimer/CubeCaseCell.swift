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
		setupViews()
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
		label.numberOfLines = 0
		return label
	}()
	
	let algLabel: UILabel = {
		let label = UILabel()
		label.text = "Sample Item"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 11)
		label.numberOfLines = 0
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
		// This combination kind of works - as in everything is the right size
		// it's just that the image view doesn't show up.
		super.layoutSubviews()
		self.imageView?.removeFromSuperview()
		
		
//		self.separatorInset = UIEdgeInsets(top: 0, left: 55 + 16, bottom: 0, right: 0)
//		self.separatorStyle = .singleLine
//		super.layoutSubviews()
		// Do nothing
	}
	
	func setupViews() {
		self.separatorInset = UIEdgeInsets(top: 0, left: 55 + 16, bottom: 0, right: 0)
		super.layoutSubviews()
		self.imageView?.removeFromSuperview()
		self.separatorInset = UIEdgeInsets(top: 0, left: 55 + 16, bottom: 0, right: 0)
		
		//algStacker.alignment = .center
		//algStacker.axis = .horizontal
		if algLabel.text != "" {
			algStacker.addSubview(algLabel)
			if algLabel1.text != "" {
				algStacker.addSubview(algLabel1)
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel]))
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel1]))
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-4-[v0]-[v1]-4-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel, "v1": algLabel1]))
				
			} else {
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel]))
				algStacker.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-<=8-[v0(40)]-<=8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algLabel]))
			}
		}
		
		imageNameStack.addSubview(self.customImageView)
		imageNameStack.addSubview(self.nameLabel)
		imageNameStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-2-[v0(50)]-2-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": self.customImageView]))
		imageNameStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-2-[v0(>=10)]-2-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		imageNameStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(50)]-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": self.customImageView, "v1": self.nameLabel]))
		
		
		
//		let sepView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width - 55, height: 1))
//		sepView.backgroundColor = UIColor.gray
		
//		addSubview(sepView)
		
		addSubview(imageNameStack)
//		addSubview(nameLabel)
		addSubview(probLabel)
		addSubview(algStacker)
		//addSubview(algLabel)
		
		
//		addSubview(statLabel)
		//		addSubview(actionButton)
		
		//		actionButton.addTarget(self, action: "handleAction", forControlEvents: .TouchUpInside)
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(<=60)]-4-[v2]->=4-[v1(>=20,<=35)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageNameStack, "v1": probLabel, "v2"
			: algStacker]))
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-55-[v0]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": sepView]))
		//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-85-[v0(>=15)]-4-[v2]->=4-[v1(>=20,<=35)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": probLabel, "v2"
		//			: algStacker]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(70)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageNameStack]))
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": probLabel]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": algStacker]))
	}
}
