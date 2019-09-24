//
//  CadastroCarroController.swift
//  desafioemsala
//
//  Created by Digital House on 23/09/19.
//  Copyright © 2019 br.com.esther. All rights reserved.
//

import Foundation

class CadastroCarroController {
    
    weak var delegate: CadastroCarroControllerDelegate?
    
    func salvarCarro(id: String, modelo: String, cor: String, ano: String) {
        
        self.delegate?.successCarSaved(carro: CarroElement(id: id, modelo: modelo, ano: Int(ano) ?? 0, cor: cor, imagem: "Civic_image"))
    }
}
