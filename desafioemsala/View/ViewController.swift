//
//  ViewController.swift
//  desafioemsala
//
//  Created by Digital House on 20/09/19.
//  Copyright © 2019 br.com.esther. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var controller: CarroController?
    var arrayCarros: Carro?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Lista de Carros"
        // Do any additional setup after loading the view, typically from a nib.
        
        self.controller = CarroController()
        
        self.controller?.getListCarros(completion: { (success, error) in
            if success {
                self.tableView.dataSource = self
                self.tableView.delegate = self
            }
        })
        
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                                         for: indexPath) as? CustomTableViewCell

        cell?.configCell(carro: self.controller?.loadCurrentCar(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let car = self.storyboard?.instantiateViewController(withIdentifier: "CarDetailsViewController") as? CarDetailsViewController {
            self.controller?.loadCarSelected(index: indexPath.row)
            car.controller = self.controller
            self.navigationController?.pushViewController(car, animated: true)
        }
    }
    
   
}
