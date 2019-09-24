//
//  CadastroCarroViewController.swift
//  desafioemsala
//
//  Created by Digital House on 23/09/19.
//  Copyright © 2019 br.com.esther. All rights reserved.
//

import UIKit

class CadastroCarroViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var modeloTextField: UITextField!
    @IBOutlet weak var corTextField: UITextField!
    @IBOutlet weak var anoTextField: UITextField!
    
    var controller: CadastroCarroController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controller = CadastroCarroController()
        
        
        self.idTextField.placeholder = "Id"
        self.modeloTextField.placeholder = "Modelo"
        self.corTextField.placeholder = "Cor"
        self.anoTextField.placeholder = "Ano"
        // Do any additional setup after loading the view.
    }

    @IBAction func salvar(_ sender: UIButton) {
        self.controller?.salvarCarro(id: self.idTextField.text ?? "", modelo: self.modeloTextField.text ?? "", cor: self.corTextField.text ?? "", ano: self.anoTextField.text ?? "")
    }
}

extension CadastroCarroViewController: CadastroCarroControllerDelegate {
    func successCarSaved(carro: CarroElement?) {
        print("Carro cadastrado!")
    }
    
    
}

protocol CadastroCarroControllerDelegate: class {
    
    func successCarSaved(carro: CarroElement?)
}

class CadastroCarroController {
    
    weak var delegate: CadastroCarroControllerDelegate?
    
    func salvarCarro(id: String, modelo: String, cor: String, ano: String) {
        
        self.delegate?.successCarSaved(carro: CarroElement(id: id, modelo: modelo, ano: Int(ano) ?? 0, cor: cor, imagem: "Civic_image"))
    }
}
