//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Bryan Diaz  on 9/26/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var reTweetButtom: UIButton!
    @IBOutlet weak var favButtom: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var favorited:Bool = true
    var tweetId:Int = -1
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorite: true)
            }, failure: { (error) in
                print("Favorite didn't succeed\(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorite: false)
            }, failure: { (error) in
                print("Unfavorite didn't succeed\(error)")
            })
        }
    }
    @IBAction func re_Tweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(isRetweeted: true)
        }, failure: { (error) in
            print("Error  retweeting!!!\(error)")
        })
    }
    //favorited
  
    
    func setRetweeted( isRetweeted:Bool ){
        if (isRetweeted){
            reTweetButtom.setImage(UIImage(named:"retweet-icon-green" ), for: UIControl.State.normal)
            reTweetButtom.isEnabled = false
        }
        else{
            reTweetButtom.setImage(UIImage(named:"retweet-icon" ), for: UIControl.State.normal)
            reTweetButtom.isEnabled = true
        }
    }
    
    
    func setFavorite(   isFavorite:Bool ){
         favorited = isFavorite
        if(favorited ){
            favButtom.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButtom.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)

        }
    }
    
}
