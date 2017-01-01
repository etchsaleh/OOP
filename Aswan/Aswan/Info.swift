//
//  Info.swift
//  Aswan
//
//  Created by Hesham Saleh on 11/19/16.
//  Copyright © 2016 Hesham Saleh. All rights reserved.
//

import UIKit

class Info: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
