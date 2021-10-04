//
//  TweetViewController.swift
//  Twitter
//
//  Created by Bryan Diaz  on 10/3/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        postTweet.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Tweet(_ sender: Any) {
        if(!postTweet.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: postTweet.text , success: {
                    self.dismiss(animated: true, completion: nil)
                }, failure: { (error) in
                    print("Error posting tweet!!!\(error)")
                    self.dismiss(animated: true, completion: nil)
                })
            }
        else{ self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var postTweet: UITextView!
    
}
