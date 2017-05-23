//
//  ViewController.swift
//  REST test
//
//  Created by Snehal Patel on 2017-05-23.
//  Copyright © 2017 Snehal Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var listData = [[String : AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url:String = ""
        
        let urlRequest = URL(string: url)
        
        URLSession.shared.dataTask(with: urlRequest!, completionHandler: {
        (data, response, error) in
            if (error != nil)
            {
               // print(error.debugDescription)
            }
            else{
                do{
                    self.listData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]; OperationQueue.main.addOperation {
                        print("Load data")
                    }
                }
                catch let error as NSError {
                    
                    print(error)
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

