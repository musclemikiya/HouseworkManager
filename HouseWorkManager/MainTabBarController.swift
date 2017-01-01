//
//  MainTabBarController.swift
//  HouseWorkManager
//
//  Created by Mikiya Fukuda on 2016/12/31.
//  Copyright © 2016年 Mikiya Fukuda. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstSB = UIStoryboard.init(name: "Dashboard", bundle: nil)
        let firstVC = firstSB.instantiateInitialViewController()
        
        let secondSB = UIStoryboard.init(name: "Timer", bundle: nil)
        let secondVC = secondSB.instantiateInitialViewController()
        
        viewControllers = [firstVC!, secondVC!]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
