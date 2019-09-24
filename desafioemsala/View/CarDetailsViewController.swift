//
//  CarDetailsViewController.swift
//  desafioemsala
//
//  Created by Digital House on 23/09/19.
//  Copyright © 2019 br.com.esther. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var idCarro: UILabel!
    @IBOutlet weak var anoCarro: UILabel!
    @IBOutlet weak var corCarro: UILabel!
    @IBOutlet weak var nomeCarro: UILabel!
    @IBOutlet weak var imageCar: UIImageView!
    
    var controller: CarroController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalhes"

        if self.controller == nil {
            self.controller = CarroController()
        }
        
        if let controller = controller {
            if let _carro = controller.loadCarSelected() {
                self.nomeCarro.text = _carro.modelo
                
                self.imageCar.image = UIImage(named: _carro.imagem)
                
                self.anoCarro.text = String(_carro.ano)
                self.corCarro.text = _carro.cor
                
                self.idCarro.text = "ID: \(_carro.id)"
            }
        }
    }
    
    @IBAction func close(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

