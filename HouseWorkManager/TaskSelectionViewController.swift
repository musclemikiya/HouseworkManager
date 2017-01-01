//
//  TaskSelectionViewController.swift
//  HouseWorkManager
//
//  Created by Mikiya Fukuda on 2016/12/30.
//  Copyright © 2016年 Mikiya Fukuda. All rights reserved.
//

import UIKit

class TaskSelectionViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
