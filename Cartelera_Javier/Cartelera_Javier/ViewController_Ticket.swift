//
//  ViewController_Ticket.swift
//  Cartelera_Javier
//
//  Created by Javier Ferrer on 10/12/19.
//  Copyright © 2019 Javier Ferrer. All rights reserved.
//

import UIKit

class ViewController_Ticket: UIViewController {

    @IBOutlet weak var ticketLbl: UILabel!
    
    var totalDeTodo : Double = 0.0
    
    var costoBoletosNino : Int = 40
    var costoBoletosAdulto : Int = 60
    var costoTotalBoletos : Int = 0
    
    var lugaresTotal : Int = 48
    var lugaresRestantes : Int = 0
    
    var totalNinos : Int = 0
    var totaladultos : Int = 0
    var totalAdultosNinos : Int = 0
    var precioP : Int = 0
    
    var mensajeTicket : String = "Muchas Gracias Por Su Preferencia!\n\n"
    
    struct MovieKeys {
        static let keyTitulo = "keyTitulo"
        static let keySala = "keySala"
        static let keyHora = "keyHora"
        static let keyNinos = "keyNinos"
        static let keyAdultos = "keyAdultos"
        static let keyListaProductos = "keyListaProductos"
        static let keyPrecioProductos = "keyPrecioProductos"
        static let keyNumeracion = "keyNumeracion"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let titulo = defaults.string(forKey: MovieKeys.keyTitulo){
            mensajeTicket = mensajeTicket + "El Titulo de su pelicula es: \(titulo),\n"
        }
        if let sala = defaults.string(forKey: MovieKeys.keySala){
            mensajeTicket = mensajeTicket + "En la \(sala),\n"
        }
        if let hora = defaults.string(forKey: MovieKeys.keyHora){
            mensajeTicket = mensajeTicket + "A las \(hora) horas.\n"
        }
        if let ninos = defaults.string(forKey: MovieKeys.keyNinos){
            mensajeTicket = mensajeTicket + "\nUsted selecciono \(ninos) asientos de niño y "
            totalNinos = Int(ninos)! * costoBoletosNino
        }
        if let adultos = defaults.string(forKey: MovieKeys.keyAdultos)  {
            mensajeTicket = mensajeTicket + "\(adultos) asientos de adulto.\n"
            totaladultos = Int(adultos)! * costoBoletosAdulto
        }
            totalAdultosNinos = totaladultos + totalNinos
        
        if(totalAdultosNinos > 0){
            mensajeTicket = mensajeTicket + "El costo de sus boletos es de: $ \(totalAdultosNinos)\n"
        }
        
        if let listaProductos = defaults.string(forKey: MovieKeys.keyListaProductos)  {
            mensajeTicket = mensajeTicket + "\nEn nuestra dulceria usted adquirio:\n\(listaProductos) "
        }
        if let precioProductos = defaults.string(forKey: MovieKeys.keyPrecioProductos)  {
            mensajeTicket = mensajeTicket + "\nPor un total de $\(precioProductos).\n"
            //precioP = Int(precioProductos)!
            totalDeTodo = Double(precioProductos)! + Double(totalAdultosNinos)
        }
        
        if(totalDeTodo > 0){
            mensajeTicket = mensajeTicket + "\nEl costo total de su compra es de: $ \(totalDeTodo)\n"
        }
        
        if let numeracion = defaults.array(forKey:  MovieKeys.keyNumeracion){
            mensajeTicket = mensajeTicket + "\nLa numeracion de sus asientos en la sala\nes la siguiente:\n\n\(numeracion)"
        }
        ticketLbl.text = mensajeTicket
    }

}
