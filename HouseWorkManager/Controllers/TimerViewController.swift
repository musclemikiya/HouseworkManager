//
//  TimerViewController.swift
//  HouseWorkManager
//
//  Created by Mikiya Fukuda on 2017/01/01.
//  Copyright © 2017年 Mikiya Fukuda. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var timerPickerView: UIPickerView!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    let minutes: [Int] = ([Int])(1...59)
    var startSeconds: Int!
    var countDownTimer: Timer!
    var isPaused = false
    var isFirstStart = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerPickerView.delegate = self
        timerPickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return minutes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(minutes[row])
    }
    
    private func reverseStatus() {
        minutesLabel.isHidden = !minutesLabel.isHidden
        timerPickerView.isHidden = !timerPickerView.isHidden
        countDownLabel.isHidden = !countDownLabel.isHidden
    }
    
    private func countDown(timer: Timer) {
        if self.isPaused {
            return
        }
        
        // format time
        let minutes = String(abs(self.startSeconds) / 60)
        let seconds = String(format:"%02d" ,abs(self.startSeconds) % 60)
        
        // update time label
        var labelString = ""
        if self.startSeconds < 0 {
            labelString = "- " + minutes + ":" + seconds
        } else {
            labelString = minutes + ":" + seconds
        }
        self.countDownLabel.text = labelString
        self.startSeconds = self.startSeconds - 1
    }

    @IBAction func startTimer(_ sender: UIButton) {
        if isFirstStart && !sender.isSelected {
            // start
            reverseStatus()
            startSeconds = minutes[timerPickerView.selectedRow(inComponent: 0)] * 60
            countDownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: countDown)
            countDownTimer.fire()
            isFirstStart = false
        } else {
            isPaused = !isPaused
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func reset(_ sender: Any) {
        if countDownTimer.isValid {
            isPaused = false
            isFirstStart = true
            startButton.isSelected = false
            reverseStatus()
            countDownTimer.invalidate()
        }
    }
}
