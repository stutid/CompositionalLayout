//
//  ViewController.swift
//  Compositional Layout
//
//  Created by Stuti Dobhal on 08.04.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonComp: UIButton!
    @IBOutlet weak var buttonTrad: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonComp.layer.cornerRadius = 5.0
        buttonTrad.layer.cornerRadius = 5.0
    }

    @IBAction func buttonCompClicked(_ sender: UIButton) {
        
    }

    @IBAction func buttonTradClicked(_ sender: UIButton) {

    }

}
