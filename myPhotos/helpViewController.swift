//
//  helpViewController.swift
//  myPhotos
//
//  Created by student1 on 3/10/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class helpViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.google.com")!
        let request = NSURLRequest(URL: url)
        myWebView.loadRequest(request)
    }

    
}
