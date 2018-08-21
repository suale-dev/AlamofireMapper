//
//  ViewController.swift
//  Example
//
//  Created by Sua Le on 8/21/18.
//  Copyright © 2018 Sua Le. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //default key
        let url1 = "https://raw.githubusercontent.com/sua8051/AlamofireMapper/master/user1.json"
        Alamofire.request(url1, method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<UserResponse>) in
                switch response.result {
                case let .success(data):
                    dump(data)
                case let .failure(error):
                    dump(error)
                }
        }
        
        //custom coding key
        let url2 = "https://raw.githubusercontent.com/sua8051/AlamofireMapper/master/movie.json"
        Alamofire.request(url2, method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<Movie>) in
                switch response.result {
                case let .success(data):
                    dump(data)
                case let .failure(error):
                    dump(error)
                }
        }
        
        //response array
        let url3 = "https://raw.githubusercontent.com/sua8051/AlamofireMapper/master/user2.json"
        Alamofire.request(url3, method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<[User]>) in
                switch response.result {
                case let .success(data):
                    dump(data)
                case let .failure(error):
                    dump(error)
                }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

