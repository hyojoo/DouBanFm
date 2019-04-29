//
//  channelViewController.swift
//  DouBanFm
//
//  Created by caulifeld on 2019/4/29.
//  Copyright © 2019 caulifeld. All rights reserved.
//

import UIKit

class channelViewController:UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "channel"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "标题:\(indexPath.row)"
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
