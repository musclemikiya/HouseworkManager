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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(minutes)
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
    }
}
