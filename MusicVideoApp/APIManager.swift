//
//  APIManager.swift
//  MusicVideoApp
//
//  Created by Kumar, Vimal on 29/09/16.
//  Copyright © 2016 Kumar, Vimal. All rights reserved.
//

import Foundation

class APIManager
{
    
    
    func loadData(url: String, completion: (String) -> Void)
    {
        //let session = NSURLSession.sharedSession()
        
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let urlS = NSURL(string: url)!
        
        let task = session.dataTaskWithURL(urlS)
        {
            (data,response,error) -> Void in
            
                dispatch_async(dispatch_get_main_queue())
                {
                    if(error != nil)
                    {
                        completion(error!.localizedDescription)
                    }
                    else
                    {
                        completion("URL Successful")
                        print(data!)
                    }
                    
                    
                }
            
            
        }
        task.resume()
    }
}
 