//
//  ViewController.swift
//  DouBanFm
//
//  Created by Caulifeld on 2019/4/28.
//  Copyright © 2019 caulifeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicList.dequeueReusableCell(withIdentifier: "douban") as! UITableViewCell
        
//        设置标题
        cell.textLabel?.text = "标题:\(indexPath.row)"
        cell.detailTextLabel?.text = "子标题:\(indexPath.row)"
        cell.imageView?.image = UIImage(named: "thumb")
        return cell
        
    }
    
    //背景
    @IBOutlet weak var bg: UIImageView!
    //歌曲封面
    @IBOutlet weak var cover: EkoImage!
//    歌曲列表
    @IBOutlet weak var musicList: UITableView!
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
        
        // Do any additional setup after loading the view.
    }


}

