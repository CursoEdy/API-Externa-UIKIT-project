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
    }

    @IBAction func chamar(_ sender: Any) {
        spiner.isHidden = false
        loading.isHidden = false
        spiner.startAnimating()
        loading.text = "Carregando..."
        
        let queue = DispatchQueue(label: "donwloader")
        queue.async(execute: {
            let api = API()
            api.buscarElemento(completion: {
                result in
                DispatchQueue.main.async(execute: {
                    let statusCode = (result?["statusCode"] as! NSString).integerValue
                    if(statusCode == 200) {
                        print(result!)
                        self.resultado.text = (result?["data"] as? NSDictionary)?["title"] as? String ?? "error"
                        self.loading.isHidden = true
                    } else {
                        self.loading.text = result?["statusCode"] as? String ?? "error"
                    }
                    self.spiner.isHidden = true
                    self.spiner.stopAnimating()
                })
            })
        })
    }
    
}

