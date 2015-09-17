//
//  PhotoViewController.swift
//  
//
//  Created by Mo, Kevin on 7/25/15.
//
//

import UIKit

class PhotoViewController: UIViewController {
    
    var photos: NSArray?
    
    @IBOutlet weak var photoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=d0abc6bca5464a08a94e382a6b4d5cdd")!
        
        let request = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            print (response)
            if let d = data {
                let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(d, options: [])
                print (responseDictionary)
            } else {
                if let e = error {
                    NSLog("Error: \(e)")
                }
            }
        }
    }
}
