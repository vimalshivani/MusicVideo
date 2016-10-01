//
//  MusicVideo.swift
//  MusicVideoApp
//
//  Created by Kumar, Vimal on 01/10/16.
//  Copyright © 2016 Kumar, Vimal. All rights reserved.
//

import Foundation

class MusicVideo {
    
    private var _name:String
    private var _image:String
    private var _video:String
    private var _rights:String
    private var _price:String
    private var _artist:String
    private var _imid:String
    private var _genre:String
    private var _linkToItunes:String
    private var _releaseDate:String
    
    
    
    
    var name : String
        {
        return _name
    }
    
    var image : String {
        return _image
    }
    
    var video:String {
        return _video
    }
    
    var rights:String {
        return _rights
    }
    
    var price:String {
        return _price
    }
    
    var artist:String {
        return _artist
    }
    
    var imid : String {
        return _imid
    }
    
    var genre : String {
        return _genre
    }
    
    var linkToITunes:String {
        return _linkToItunes
    }
    
    var releaseDate : String {
        return _releaseDate
    }
    
    init(data: NSJSONDictionary)
    {
        
        
        
        if let name = data["im:name"] as? NSJSONDictionary, realName = name["label"] as? String{
            _name = realName
        }
        else{
            _name = ""
        }
        
        
        if let comimage = data["im.image"] as? NSJSONArray,
        
             img = comimage[2] as? NSDictionary,
        
             image = img["label"] as? String
           
        {
            self._image = image.stringByReplacingOccurrencesOfString("100x100", withString: "300x300")
        }
        
        else{
            _image = ""
        }
        
        
        if let video = data["link"] as? NSJSONArray,
        videoatt = video[1] as? NSJSONDictionary,
        videoas = videoatt["attributes"] as? NSJSONDictionary,
        
        videourl = videoas["href"] as? String
        {
            self._video =  videourl
        }
       
        
        else{
            _video = ""
        }
        
        if let rig = data["rights"] as? NSJSONDictionary, rights = rig["label"] as? String
        {
            self._rights = rights
        }
        else {
            _rights = ""
        }
        
        
        
        if let art = data["im.artist"] as? NSJSONDictionary,  artis = art["label"] as? String
        {
            self._artist = artis
        }
        else{
            _artist = ""
        }
        
        
        if let relData = data["im.releaseDate"] as? NSJSONDictionary, date = relData["label"] as? String{
            self._releaseDate =  date
        }
        else {
            _releaseDate = ""
        }
        
        if let pricez = data["im.price"] as? NSJSONDictionary,  price = pricez["label"] as? String
        {
            self._price = price
        }
        else{
            _price = ""
        }
        
        if let cat = data["category"] as? NSJSONDictionary, attrib = cat["attributes"] as? NSJSONDictionary, category = attrib["term"] as? String{
            self._genre = category
        }
        else{
            _genre = ""
        }
        
        
        if let id = data["id"] as? NSJSONDictionary, attrs = id["attributes"] as? NSJSONDictionary,
        imid = attrs["im:id"] as? String
        {
            self._imid = imid
        }
        else{
            _imid = ""
        }
        
        
        if let link = data["id"] as?  NSJSONDictionary,
        
        linkToITunes  = link["label"] as? String
        {
            self._linkToItunes = linkToITunes
        }
        else {
            _linkToItunes = ""
        }
 
        
        
    }
}
