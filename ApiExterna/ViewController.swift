//
//  ViewController.swift
//  ApiExterna
//
//  Created by ednardo alves on 07/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chamarBtn: UIButton!
    @IBOutlet weak var resultado: UILabel!
    
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var loading: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        spiner.isHidden = true
        loading.isHidden = true
        spiner.startAnimating()
        loading.text = "Carregando..."
        
        
    }

    @IBAction func chamar(_ sender: Any) {
        spiner.isHidden = false
        loading.isHidden = false
    }
    
}

