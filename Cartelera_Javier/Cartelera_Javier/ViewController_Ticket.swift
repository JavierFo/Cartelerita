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
    
    var TotalDeTodo : Double = 0.0
    
    var CostoBoletosNino : Double = 40.0
    var CostoBoletosAdulto : Double = 60.0
    var CostoTotalBoletos : Double = 0.0
    var LugaresTotal : Int = 48
    var LugaresRestantes : Int = 0
    
    var Titulo : String!
    var Sala : String!
    var Hora : String!
    
    var Ninos : Double!
    var Adultos : Double!
    
    var TotalNinos : Double!
    var Totaladultos : Double!
    var TotalAdultosNinos : Double!
    
    var ListaProductosCompleta : String!
    var PrecioTotalDulces : Double!
    
    var numeracionButtonCounter : [Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TotalDeTodo = TotalAdultosNinos + PrecioTotalDulces
        
//        ticketLbl.text = "Muchas Gracias por Realizar Su Compra Con Nosotros.\nUsted ha adquirido \(Int(Ninos)) boletos de niños por $\(String(describing: TotalNinos)), y \(Int(Adultos)) boletos de adultos por $\(String(describing: Totaladultos)).\nLa numeracion de sus asientos es la siguiente: \(String(describing: numeracionButtonCounter)).\nPrecio total: $\(String(describing: TotalAdultosNinos)).\n\nHa hecho la siguiente adquisicion de productos es nuestra dulceria: \(String(describing: ListaProductosCompleta)) por un precio total de \(String(describing: PrecioTotalDulces)).\n\nEl costo final de su compra de boletos y productos es: $\(TotalDeTodo).\nDe Nuevo Muchas Gracias Por Su Compra!"
        
        ticketLbl.text = "Muchas Gracias Por Su Compra.\nSu pelicula es:\(Titulo)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
