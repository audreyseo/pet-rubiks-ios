//
//  FirstViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 27/12/2016.
//  Copyright © 2016 Audrey Seo. All rights reserved.
//

import UIKit
import QuartzCore

class FirstViewController: UIViewController {
	@IBOutlet var longPress: UILongPressGestureRecognizer!
	@IBOutlet weak var scrambleLabel: UILabel!
	@IBOutlet var timeLabel: UILabel!
	var timer:Timer = Timer()
	var millis:Int = 0
	var isTiming:Bool = false
	var timings:[Int] = [Int]()
	var longTouch:Bool = false
	var t1:UInt64 = 0, t2:UInt64 = 0
//	var link:CADisplayLink = CADisplayLink()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
//		timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(FirstViewController.update), userInfo: nil, repeats: true)
		self.view.backgroundColor = UIColor.black
		scrambleLabel.textColor = UIColor.white
		timeLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 87.0, weight: 0.05)
		timeLabel.textColor = UIColor.white
		
//		link = CADisplayLink.init(target: self, selector: #selector(update))
//		CADisplayLinkcreate
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	@IBAction func startStopTimer(_ sender: UILongPressGestureRecognizer) {
		if sender.state == .ended {
			timer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(update), userInfo: nil, repeats: true)
			t1 = mach_absolute_time()
//				isTiming = !isTiming
//			}
		}
	}

	@IBAction func stopTimer(_ sender: Any) {
		timer.invalidate()
		timings += [millis]
		millis = 0
	}
	
	
	func update() {
//		millis += 1
		
//		let seconds = Int(Float(millis) / 1000.0)
//		let millisR = millis % 1000
////		let seconds0 = (seconds < 10) ? "0" : ""
//		let millis0 = (millisR < 100) ? ((millisR < 10) ? "00" : "0") : ""
//		
//		timeLabel.text = "\(seconds).\(millis0)\(millisR)"
		t2 = mach_absolute_time()
//		let elapsed = t2 - t1
		var timeBaseInfo = mach_timebase_info_data_t()
		mach_timebase_info(&timeBaseInfo)
		let elapsedNano = (t2 - t1) * UInt64(timeBaseInfo.numer) / UInt64(timeBaseInfo.denom);
		
		millis += Int(Float(elapsedNano) * 0.000001)
		
		let seconds = Int(Float(millis) / 1000.0)
		let millisR = millis % 1000
//		let seconds0 = (seconds < 10) ? "0" : ""
		let millis0 = (millisR < 100) ? ((millisR < 10) ? "00" : "0") : ""
//		print("Millis: ", millisR)
		timeLabel.text = "\(seconds).\(millis0)\(millisR)"
		t1 = t2
		
	}


}

