//
//  Horarios.swift
//  Cartelera_Javier
//
//  Created by Javier Ferrer on 10/10/19.
//  Copyright © 2019 Javier Ferrer. All rights reserved.
//

import Foundation

struct Horarios{
    
    var hora: String
    var sala: String
    
    init(hora: String, sala: String){
        self.hora = hora
        self.sala = sala
    }
    
}

struct Peliculas {
    
    var peliculas: String
    
    init(peliculas: String) {
        self.peliculas = peliculas
    }
    
}

struct Dulceria {

    var dulces: String
    var costo : Double

    init(dulces: String, costo: Double) {
        self.dulces = dulces
        self.costo = costo
    }

}
