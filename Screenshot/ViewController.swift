//
//  ViewController.swift
//  Screenshot
//
//  Created by Yusuf UZAN on 04/04/15.
//  Copyright (c) 2015 hx0a1q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func actionScreen(sender: AnyObject) {
        
        
        takeScreenAndReturnImage()
        
        UIImageWriteToSavedPhotosAlbum(takeScreenAndReturnImage(), nil, nil, nil)
        
        
    }
    @IBOutlet weak var label: UILabel!
    var timer:NSTimer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = nil
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timerUpdate"), userInfo: nil, repeats: true)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func takeScreenAndReturnImage()-> UIImage{
    
    let v = view
        
    UIGraphicsBeginImageContextWithOptions(v.bounds.size, true, 1.0)
    v.drawViewHierarchyInRect(v.bounds, afterScreenUpdates: true)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
        return img
    }
    
    
    func timerUpdate(){
        
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        label.text = dateFormatter.stringFromDate(date)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

