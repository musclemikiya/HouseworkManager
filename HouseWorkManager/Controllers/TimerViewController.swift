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
        startButton.isUserInteractionEnabled = !startButton.isUserInteractionEnabled
    }

    @IBAction func startTimer(_ sender: Any) {
        // pickerとカウントダウンのlabelを切り替え
        reverseStatus()
        startSeconds = minutes[timerPickerView.selectedRow(inComponent: 0)] * 60
        countDownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            if self.isPaused {
                return
            }
            
            let minutes = String(abs(self.startSeconds) / 60)
            let seconds = String(format:"%02d" ,abs(self.startSeconds) % 60)
            
            var labelString = ""
            if self.startSeconds < 0 {
                labelString = "- " + minutes + ":" + seconds
            } else {
                labelString = minutes + ":" + seconds
            }
            
            self.countDownLabel.text = labelString
            self.startSeconds = self.startSeconds - 1
        })
        countDownTimer.fire()
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        isPaused = !isPaused
    }
    
    @IBAction func reset(_ sender: Any) {
        if countDownTimer.isValid {
            reverseStatus()
            countDownTimer.invalidate()
        }
    }
}
