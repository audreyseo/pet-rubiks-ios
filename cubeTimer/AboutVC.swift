//
//  AboutViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 15/1/2017.
//  Copyright © 2017 Audrey Seo. All rights reserved.
//

import UIKit
import MessageUI


class AboutViewController:UITableViewController, MFMailComposeViewControllerDelegate {
	
	var items:[String] = [
		"Cube Timer",
		"by Audrey Seo",
		"",
		"Created for the purpose of providing an easy way to record one's speedcubing times and to track one's progress on learning both Orientation of the Last Layer and Permutation of the Last Layer, hereon referred to as OLL and PLL respectively.",
		"Tap here to contribute to the CubeTimer open-source project on GitHub.",
		"Credits",
		"App Testers",
		"PlaceHolder",
		"PlaceHolder",
		"iPhone Compatibility",
		"PlaceHolder",
		"PlaceHolder",
		"Consultants",
		"Graphics",
		"Claire Seo",
		"App Icon",
		"Audrey Seo",
		"Comments? Questions? Bugs? Email me."]
	let types:[AboutCellStyle] = [
		.title,
		.subtitle,
		.version,
		.paragraph,
		.button,
		.firstLevel,
		.secondLevel,
		.thirdLevel,
		.thirdLevel,
		.secondLevel,
		.thirdLevel,
		.thirdLevel,
		.secondLevel,
		.thirdLevel,
		.fourthLevel,
		.secondLevel,
		.thirdLevel,
		.button
	]
	
	let aboutId = "aboutId"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.separatorStyle = .none
		tableView.register(AboutCell.self, forCellReuseIdentifier: aboutId)
		
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 140
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let c = tableView.dequeueReusableCell(withIdentifier: aboutId) as! AboutCell
		c.setStyle(newStyle: types[indexPath.row])
		c.selectionStyle = .none
		if types[indexPath.row] == .version {
			items[indexPath.row] = "Version: \(getAppVersion())"
		}
		
		if types[indexPath.row] == .button {
			c.setButtonTitle(titleString: items[indexPath.row])
			
			switch items[indexPath.row] {
			case items[4]:
				c.actionButton.addTarget(self, action: #selector(gotoSourceCode), for: .touchUpInside)
			case items[items.endIndex - 1]:
				c.actionButton.addTarget(self, action: #selector(contactMe), for: .touchUpInside)
			default:
				break
			}
			
		} else {
			c.setLabel(labelString: items[indexPath.row])
		}
		c.setupViews()
		
		return c
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	
	func gotoSourceCode() {
		let alert = UIAlertController(title: "Open Page in Safari", message: "Are you sure you want to open up the GitHub source code in Safari?", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
			UIApplication.shared.open(URL(string: "https://github.com/audreyseo/pet-rubiks-ios")!, options: [:], completionHandler: nil)
//			UIApplication.shared.openURL(URL(string: "https://github.com/audreyseo/pet-rubiks-ios")!)
			return;
		}))
		alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
	
	func contactMe() {
		let contactor = configuredMailComposeViewController("aseo@wellesley.edu")
		if MFMailComposeViewController.canSendMail() {
			contactor.navigationItem.title = "Contact and Feedback"
			self.present(contactor, animated: true, completion: nil)
			//self.navigationController?.pushViewController(contactor, animated: true)
		}
	}
	
	func getAppVersion() -> String {
		let nsObject: AnyObject? = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String as AnyObject?
		return nsObject as! String
	}
	
	func configuredMailComposeViewController(_ target:String) -> MFMailComposeViewController {
		let mailComposerVC = MFMailComposeViewController()
		mailComposerVC.mailComposeDelegate = self
		
		mailComposerVC.setToRecipients([target])
		//		let nsObject: AnyObject? = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String as AnyObject?
		let version = getAppVersion()
		
		//if version != nil {
		mailComposerVC.setSubject("[CubeTimer - v\(version)]: ")
		mailComposerVC.setMessageBody("", isHTML: false)
		//}
		
		return mailComposerVC
	}
	
	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: false, completion: nil)
	}
}
