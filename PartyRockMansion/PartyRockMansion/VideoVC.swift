//
//  VideoVC.swift
//  PartyRockMansion
//
//  Created by Hesham Saleh on 9/28/16.
//  Copyright © 2016 Hesham Saleh. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }
    
    @IBOutlet weak var videoTitleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videoTitleLbl.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        
    }

}
