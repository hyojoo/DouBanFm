//
//  channelViewController.swift
//  DouBanFm
//
//  Created by caulifeld on 2019/4/29.
//  Copyright © 2019 caulifeld. All rights reserved.
//

import UIKit
import SwiftyJSON

class channelViewController:UIViewController,UITableViewDataSource,UITableViewDelegate {
    //    定义一个变量接收频道数据
    @IBOutlet weak var channellist: UITableView!
    var channelData:[JSON] = []
    var ehttp:HttpController = HttpController()
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  channelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "channel"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let rowData = channelData[indexPath.row]
        cell.textLabel?.text = rowData["name"].string
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ehttp.requestChannels { (results) in
            let json = JSON(results)
            if  let channels = json["channels"].array{
            self.channelData = channels
                
                print(self.channelData)
                self.channellist.reloadData()
            }
            
            
            
            
            
            }
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
