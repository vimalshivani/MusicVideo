//
//  ViewController.swift
//  MusicVideoApp
//
//  Created by Kumar, Vimal on 28/09/16.
//  Copyright © 2016 Kumar, Vimal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     override func viewDidLoad() {
        super.viewDidLoad()
       
       let api = APIManager()
        
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
      /*  {
            (result:String) in
                print(result)
        }*/
        
    }
    
    
    func didLoadData(result: String)
    {
       // print(result)
        
        let alert = UIAlertController(title: result, message: nil, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default){
            action -> Void  in
            
        }
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

    


}

