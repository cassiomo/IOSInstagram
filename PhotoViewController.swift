//
//  PhotoViewController.swift
//  
//
//  Created by Mo, Kevin on 7/25/15.
//
//

import UIKit
import AFNetworking

class PhotoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var photos: NSArray?
    
    @IBOutlet weak var photoTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoTableView!.delegate = self;
        self.photoTableView!.dataSource = self;
        
        self.photoTableView!.rowHeight = 320;
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=d0abc6bca5464a08a94e382a6b4d5cdd")!
        
        let request = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            print (response)
            if let d = data {
                let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(d, options: [])
                self.photos = responseDictionary["data"] as! NSArray
                self.photoTableView!.reloadData()
                print (responseDictionary)
            } else {
                if let e = error {
                    NSLog("Error: \(e)")
                }
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.photos != nil) {
            return self.photos!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mycell") as! PhotoTableViewCell
        
        let data = self.photos![indexPath.row] as! NSDictionary;
        let images = data["images"] as! NSDictionary
        let standardImage = images["standard_resolution"] as! NSDictionary
        let url = standardImage["url"]
        cell.setThumbnail(url as! String)
        
        return cell
    }
}
