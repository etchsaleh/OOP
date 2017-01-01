//
//  Home.swift
//  Aswan
//
//  Created by Hesham Saleh on 11/18/16.
//  Copyright © 2016 Hesham Saleh. All rights reserved.
//

import UIKit

class Home: UIViewController {

    @IBOutlet weak var moreBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreBtn.layer.cornerRadius = 2.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
