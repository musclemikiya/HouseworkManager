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
    
    let minutes: [Int] = ([Int])(1...59)
    var startSeconds: Int!
    var countDownTimer: Timer!
    
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

    @IBAction func startTimer(_ sender: Any) {
        // TODO: pickerをカウントダウンに切り替え
        startSeconds = minutes[timerPickerView.selectedRow(inComponent: 0)] * 60
        countDownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            let minutes = String(abs(self.startSeconds) / 60)
            let seconds = String(format:"%02d" ,abs(self.startSeconds) % 60)
            
            if self.startSeconds < 0 {
                print("- " + minutes + ":" + seconds)
            } else {
                print(minutes + ":" + seconds)
            }
            
            self.startSeconds = self.startSeconds - 1
        })
        countDownTimer.fire()
    }
}
