//
//  CustomTableViewCell.swift
//  desafioemsala
//
//  Created by Digital House on 20/09/19.
//  Copyright © 2019 br.com.esther. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nomeCarro: UILabel!
    @IBOutlet weak var corCarro: UILabel!
    @IBOutlet weak var imagemCarro: UIImageView!
    @IBOutlet weak var anoCarro: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCell(carro: CarroElement?) {
        if let _carro = carro {
            self.nomeCarro.text = _carro.modelo
            
            self.imagemCarro.image = UIImage(named: _carro.imagem)
            
            self.anoCarro.text = String(_carro.ano)
            self.corCarro.text = _carro.cor
        }
    }
}


