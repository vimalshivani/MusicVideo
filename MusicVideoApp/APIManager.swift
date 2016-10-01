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
            
                    if(error != nil)
                    {
                        dispatch_async(dispatch_get_main_queue())
                        {
                            completion(error!.localizedDescription)
                        }
                    }
                    else
                    {
                        //completion("URL Successful")
                        print(data!)
                        
                        do
                        {
                           
                        
                           
                        
                        if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String:AnyObject]
                            {
                                print(json)
                                
                                let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                                
                                dispatch_async(dispatch_get_global_queue(priority, 0))
                                {
                                    dispatch_async(dispatch_get_main_queue())
                                    {
                                        completion("Serialization successful")
                                    }
                                    
                                }
                                
                                
                            }
                            
                        }
                        
                        catch
                        {
                            dispatch_async(dispatch_get_main_queue()) {
                             
                                completion("Error in NSJSonSerialization")
                            }
                        }
                        
                        
                    }
                    
                    
                    
                    
                    
            
            
            
        }
        task.resume()
    }
}
 