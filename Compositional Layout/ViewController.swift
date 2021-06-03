//
//  ViewController.swift
//  Compositional Layout
//
//  Created by Stuti Dobhal on 08.04.21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var buttonComp: UIButton!
    @IBOutlet weak var buttonTrad: UIButton!

    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonComp.layer.cornerRadius = 5.0
        buttonTrad.layer.cornerRadius = 5.0
    }

    @IBAction func buttonCompClicked(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompositionalVC")
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func buttonTradClicked(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TraditionalVC")
        navigationController?.pushViewController(vc, animated: true)
    }

}
