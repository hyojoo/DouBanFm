//
//  HTTPController.swift
//  DouBanFm
//
//  Created by caulifeld on 2019/4/29.
//  Copyright © 2019 caulifeld. All rights reserved.
//
import Alamofire
import Foundation
import UIKit
class HttpController: NSObject {
    //定义一个代理
    var delegate:HttpProtocol?
    //接网址，回调代理方法传回数据
    func requestChannels() {
        let url = "https://www.douban.com/j/app/radio/channels"
        Alamofire.request(url, method: .get).responseJSON(options: JSONSerialization.ReadingOptions.mutableContainers) { (data) -> Void in
                        if let DATA = data.result.value {
                            self.delegate?.didReciveResults(results: DATA as AnyObject)
                        } else {
                            print("DATA获取失败")
                        }
             self.delegate?.didReciveResults(results: data as AnyObject)
            
        }
    }
    func requestMusic() {
        let url = "https://douban.fm/j/mine/playlist?type=n&channel=0&from=mainsite"
        for _ in 0...10 {
            
            Alamofire.request(url, method: .get).responseJSON(options: JSONSerialization.ReadingOptions.mutableContainers) { (data) -> Void in
                if let DATA = data.result.value {
                    self.delegate?.didReciveResults(results: DATA as AnyObject)
                } else {
                    print("DATA获取失败")
                }
                self.delegate?.didReciveResults(results: data as AnyObject)

            }
        }

    }
}
    //定义http协议
    protocol HttpProtocol {
//        定义一个方法接受一个参数是AnyObject
        func didReciveResults(results:AnyObject)
//        func didReciveResultsmusic(results:AnyObject)
}

