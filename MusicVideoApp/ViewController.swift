//
//  ViewController.swift
//  MusicVideoApp
//
//  Created by Kumar, Vimal on 28/09/16.
//  Copyright © 2016 Kumar, Vimal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var _videos = [MusicVideo]()

     override func viewDidLoad() {
        super.viewDidLoad()
       
       let api = APIManager()
        
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
      /*  {
            (result:String) in
                print(result)
        }*/
        
    }
    
    
    func didLoadData(videos : [MusicVideo])
    {
       // print(result)
        
        self._videos =  videos
        
        for item in videos{
            
            
            print("Name is \(item.name)")
        }
        
        
        for(index,item) in videos.enumerate() {
            
            print("\(index) name is \(item.name)")
        }
        
       
        
       /* let alert = UIAlertController(title: result, message: nil, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default){
            action -> Void  in
            
        }
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true, completion: nil)*/
    }
    
    


}

