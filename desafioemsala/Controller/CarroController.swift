//
//  CarroController.swift
//  desafioemsala
//
//  Created by Digital House on 20/09/19.
//  Copyright © 2019 br.com.esther. All rights reserved.
//

import Foundation

class CarroController {
    private var arrayCarros: [CarroElement] = []
    private var carSelected: CarroElement?
    
    func numberOfRowsInSection() -> Int {
        return self.arrayCarros.count
    }
    
    func loadCarSelected(index: Int) {
        self.carSelected = self.arrayCarros[index]
    }
    
    func loadCarSelected() -> CarroElement? {
        return self.carSelected
    }
    
    func loadCurrentCar(indexPath: IndexPath) -> CarroElement {
        return self.arrayCarros[indexPath.row]
    }
    
    func getListCarros(completion: @escaping completion<Bool>) {
        CarroProvider().getListCarros { (response, error) in
            if let _response = response {
                self.arrayCarros = _response.carros
                
                completion(true, false)
            } else {
                completion(false, true)
            }
        }
    }
}

