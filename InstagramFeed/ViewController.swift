//
//  ViewController.swift
//  InstagramFeed
//
//  Created by Mo, Kevin on 7/25/15.
//  Copyright (c) 2015 Mo, Kevin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var photos: NSArray = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var clientId = "d0abc6bca5464a08a94e382a6b4d5cdd"
        
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            self.photos = responseDictionary["data"] as NSArray
            self.tableView.reloadData()
            
            println("response: \(self.photos)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

