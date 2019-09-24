//
//  Carro.swift
//  desafioemsala
//
//  Created by Digital House on 20/09/19.
//  Copyright © 2019 br.com.esther. All rights reserved.
//

import Foundation

// MARK: - Carro
struct Carro: Codable {
    let carros: [CarroElement]
}

// MARK: - CarroElement
struct CarroElement: Codable {
    let id, modelo: String
    let ano: Int
    let cor, imagem: String
}
