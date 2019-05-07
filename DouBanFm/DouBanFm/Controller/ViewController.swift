//
//  ViewController.swift
//  DouBanFm
//
//  Created by Caulifeld on 2019/4/28.
//  Copyright © 2019 caulifeld. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
//import AlamofireImage
class ViewController:UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    //背景
    @IBOutlet weak var bg: UIImageView!
    //歌曲封面
    @IBOutlet weak var cover: EkoImage!
//    歌曲列表
    @IBOutlet weak var musicList: UITableView!
//  定义一个变量接收歌曲数据
    var songDate:[JSON] = []
//    定义一个变量接收频道数据
    var channelData:[JSON] = []
    //网络操作实例
    var ehttp:HttpController = HttpController()
    override func viewDidLoad() {
        super.viewDidLoad()
        cover.onRotaion()
        //设置背景模糊
//        设置模糊样式
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
//        定义模糊大小
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
//        添加模糊
        bg.addSubview(blurView)
//        设置tableview 数据源和代理
        musicList.dataSource = self
        musicList.delegate = self
//        获取频道
//        ehttp.requestChannels()
//        获取频道0的歌曲
        ehttp.requestMusic { (results) in
            let json = JSON(results)
            let song = json["song"].array
                //self.songDate = song
            self.songDate.append(contentsOf: song!)
            self.musicList.reloadData()
                //                     print(songDate)
                
                
            
            
            
        }
//        ehttp.onSearch(url: "https://douban.fm/j/mine/playlist?type=s&sid=331663&pt=112.3&channel=3770138&pb=64&from=mainsite&r=a91682610b")
        
        
        // Do any additional setup after loading the view.
    }
    //实现表格代理协议
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songDate.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "douban") as! UITableViewCell
        let rowData = songDate[indexPath.row]
//                设置标题
        cell.textLabel?.text = rowData["title"].string
        cell.detailTextLabel?.text = rowData["artist"].string
        let url1 = rowData["picture"].string ?? ""
        let urlStr = URL(string: url1)
//        let data = NSData(contentsOf: urlStr! as URL)
//        let image = UIImage(data: data! as Data)
        cell.imageView?.bounds = CGRect.init(x:0,y:0,width: cell.bounds.height, height: cell.bounds.height)
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
//        cell.imageView?.kf.indicatorType = .activity
        cell.imageView?.kf.setImage(with: urlStr, placeholder: UIImage(named: "defult"))
        
        
        

//        let url = URL(string: url1)!
//        cell.imageView?.af_setImage(withURL: url)
//        print(url1)
//
//     Alamofire.request(url1, method: .get).streamImage(){ (data) -> Void in
//      Alamofire.request(url1, method: .get).res(){ (data) -> Void in
//        let image:UIImage? = data
//        
//        // cell.imageView?.image = image
//        }
        return cell
        
    }
    


}

