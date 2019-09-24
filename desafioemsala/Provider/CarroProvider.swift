//
//  CarroProvider.swift
//  desafioemsala
//
//  Created by Digital House on 20/09/19.
//  Copyright © 2019 br.com.esther. All rights reserved.
//

import Foundation

typealias completion <T> = (_ result: T, _ failure: Bool) -> Void

class CarroProvider {
    
    func getListCarros(completion: @escaping completion<Carro?>) {
        if let path = Bundle.main.path(forResource: "carros", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                //Pode usar o mesmo catch pois esta dentro do DO, obrigatorio por o optional
                let decodeObject = try JSONDecoder().decode(Carro.self, from: data)
                print(decodeObject)
                
                completion(decodeObject, false)
            } catch {
                completion(nil, true)
            }
        }
    }
}
