//
//  TimerViewController.swift
//  cubeTimer
//
//  Created by Audrey Seo on 27/12/2016.
//  Copyright © 2016 Audrey Seo. All rights reserved.
//

import UIKit
import QuartzCore

class TimerViewController: UIViewController {
	@IBOutlet var longPress: UILongPressGestureRecognizer!
	@IBOutlet weak var scrambleLabel: UILabel!
	@IBOutlet var panPress: UIPanGestureRecognizer!
	@IBOutlet var timeLabel: UILabel!
	var converter:TimeConversion = TimeConversion()
	var timer:Timer = Timer()
	var millis:Int = 0
	var hasTabControl:Bool = false
	var isTiming:Bool = false
//	var timings:[Int] = [Int]()
	var longTouch:Bool = false
	var t1:UInt64 = 0, t2:UInt64 = 0
	var tbc:InfoSharingTabController = InfoSharingTabController()
	
	var timeTouchingStart:UInt64 = 0
	var colorTimer:Timer = Timer()
	var minimumPressDur:Double = -1.0
	var userdef = UserDefaults()
	
	
	var longPressKey = "longPressDelayKey"
	
//	var link:CADisplayLink = CADisplayLink()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
//		timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(TimerViewController.update), userInfo: nil, repeats: true)
		self.view.backgroundColor = UIColor.black
		scrambleLabel.textColor = UIColor.white
		scrambleLabel.text = generateScramble()
		timeLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 87.0, weight: 0.02)
		timeLabel.textColor = UIColor.white
		
		if self.tabBarController != nil {
			hasTabControl = true
			self.tbc = self.tabBarController as! InfoSharingTabController
			if tbc.loadData() {
				print("Already have data")
			}
		}
		
		longPress.minimumPressDuration = Double(userdef.float(forKey: longPressKey))
		if userdef.float(forKey: longPressKey) < 0.1 || userdef.float(forKey: longPressKey) > 5.0 {
			longPress.minimumPressDuration = 0.5
			userdef.set(0.5, forKey: longPressKey)
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		longPress.minimumPressDuration = Double(userdef.float(forKey: longPressKey))
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func timeElapsed() -> Double {
		return elapsedNano(begin: timeTouchingStart) / pow(10, 9)
	}
	
	func checkTimeElapsed() {
		if timeTouchingStart >= 0 {
//			print("Minimum Press Duration: \(minimumPressDur), \(timeElapsed())")
			
			if timeElapsed() > minimumPressDur && minimumPressDur > 0.0 {
				print("Ready")
				timeLabel.textColor = UIColor.green
				colorTimer.invalidate()
			}
		}
	}
	
	@IBAction func startStopTimer(_ sender: UILongPressGestureRecognizer) {
		if sender.state == .began {
//			timeLabel.textColor = UIColor.red
			timeTouchingStart = mach_absolute_time()
			minimumPressDur = Double(sender.minimumPressDuration)
			colorTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(checkTimeElapsed), userInfo: nil, repeats: true)
		}
		
		
		if sender.state == .ended {
			minimumPressDur = -1.0
			timeLabel.textColor = UIColor.white
			timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(update), userInfo: nil, repeats: true)
			t1 = mach_absolute_time()
			isTiming = true
		}
	}

	@IBAction func stopTimer(_ sender: Any) {
		timer.invalidate()
		if hasTabControl && isTiming {
			self.tbc.data += [millis]
			tbc.saveData()
			isTiming = false
			scrambleLabel.text = generateScramble()
		}
//		timings += [millis]
		millis = 0
	}
	
	func elapsedNano(begin:UInt64, end:UInt64) -> Double {
		var timeBaseInfo = mach_timebase_info_data_t()
		mach_timebase_info(&timeBaseInfo)
		return Double((end - begin) * UInt64(timeBaseInfo.numer) / UInt64(timeBaseInfo.denom))
	}
	
	func elapsedNano(begin:UInt64) -> Double {
		return elapsedNano(begin: begin, end: mach_absolute_time())
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
		
		millis = Int(Float(elapsedNano) * 0.000001)
		
//		let seconds = Int(Float(millis) / 1000.0)
//		let millisR = millis % 1000
//		let seconds0 = (seconds < 10) ? "0" : ""
//		let millis0 = (millisR < 100) ? ((millisR < 10) ? "00" : "0") : ""
//		print("Millis: ", millisR)
		timeLabel.text = converter.timeString(millis: millis)
//		timeLabel.text = "\(seconds).\(millis0)\(millisR)"
//		t1 = t2
		
	}
	
	
	func generateScramble() -> String {
		let length:Int = 25
		let choices:[[String]] = [["R", "R'", "R2"], ["F", "F'", "F2"], ["U", "U'", "U2"], ["L", "L'", "L2"], ["B", "B'", "B2"], ["D", "D'", "D2"]]
//		let types:[String] = [" ", "' ", "2 "]
		var scrambleIndices:[[Int]] = [[Int]]()
		var scramble:[String] = [String]()
		
//		let count = 0
		
		for i in 0..<length {
			var index1 = Int(arc4random_uniform(UInt32(choices.count)))
			let index2 = Int(arc4random_uniform(UInt32(choices[index1].count)))
			
			if i > 0 {
				while index1 == scrambleIndices[i - 1][0] {
					index1 = Int(arc4random_uniform(UInt32(choices.count)))
				}
			}
			scrambleIndices += [[index1, index2]]
		}
		
		for i in 0..<length {
			scramble += [choices[scrambleIndices[i][0]][scrambleIndices[i][1]]]
		}
		
		return scramble.joined(separator: " ")
	}
	
	func absoluteValue(val:Float) -> Float {
		let sign:Float = val < 0 ? -1.0 : 1.0
		return sign * val
	}
	
	func translationLargeEnough(pan: UIPanGestureRecognizer) -> Bool {
		let xTranslation = pan.translation(in: self.view).x
		//let yTranslation = pan.translation(in: self.view).y
		//print(xTranslation / self.view.frame.size.width)
		return absoluteValue(val: (Float(xTranslation) / Float(self.view.frame.size.width))) > 0.25
	}
	
	@IBAction func panGestured(_ sender: UIPanGestureRecognizer) {
		if sender.state == .ended {
			if !isTiming && translationLargeEnough(pan: sender) {
				
				if sender.velocity(in: self.view).x < 0 {
					let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete the last time?", preferredStyle: .alert)
					alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
						//					print("Dropping last")
						if self.tbc.data.startIndex != self.tbc.data.endIndex - 1 {
							self.tbc.data.popLast()
						} else {
							self.tbc.data.remove(at: self.tbc.data.startIndex)
						}
						self.tbc.saveData()
						return;
					}))
					alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
					self.present(alert, animated: true, completion: nil)
					
				} else if sender.velocity(in: self.view).x > 0 {
					scrambleLabel.text = generateScramble()
				}
			} else {
				stopTimer(sender)
			}
		}
	}



}

