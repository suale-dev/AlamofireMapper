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
        Alamofire.request("https://reqres.in/api/users", method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<UserResponse>) in
                switch response.result {
                case let .success(data):
                    dump(data)
                case let .failure(error):
                    dump(error)
                }
        }
        
        //custom coding key
        let params: [String: Any] = ["name": "paul rudd", "movies": ["I Love You Man", "Role Models"]]
        Alamofire.request("https://reqres.in/api/users", method: .post
            , parameters: params, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<Movie>) in
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

