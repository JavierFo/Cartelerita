//
//  TableViewController_Peliculas.swift
//  Cartelera_Javier
//
//  Created by Javier Ferrer on 10/9/19.
//  Copyright © 2019 Javier Ferrer. All rights reserved.
//

import UIKit

class TableViewController_Peliculas: UITableViewController {

    var pelis : String!
    var numeroNinos : Double!
    var numeroAdultos : Double!
    
    @IBOutlet weak var navBar: UINavigationItem!
        
    var hra_1 : [Horarios] = [
        Horarios(hora: "14.00", sala: "Sala 1"),
        Horarios(hora: "19.30", sala: "Sala 4"),
        Horarios(hora: "21.00", sala: "Sala 2")
    ]
    
    var hra_2 : [Horarios] = [
        Horarios(hora: "13.00", sala: "Sala 2"),
        Horarios(hora: "20.30", sala: "Sala 1"),
        Horarios(hora: "20.00", sala: "Sala 4"),
        Horarios(hora: "18.30", sala: "Sala 3")
    ]
    
    var hra_3 : [Horarios] = [
        Horarios(hora: "11.20", sala: "Sala 2"),
        Horarios(hora: "16.30", sala: "Sala 1"),
        Horarios(hora: "14.00", sala: "Sala 4"),
        Horarios(hora: "20.30", sala: "Sala 3"),
        Horarios(hora: "10.30", sala: "Sala 5")
    ]
    
    var hra_4 : [Horarios] = [
        Horarios(hora: "22.30", sala: "Sala 3"),
        Horarios(hora: "12.30", sala: "Sala 5"),
        Horarios(hora: "22.15", sala: "Sala 4"),
    ]
    
    var hra_5 : [Horarios] = [
        Horarios(hora: "15.00", sala: "Sala 2"),
        Horarios(hora: "18.30", sala: "Sala 1"),
    ]
    
    var hra_6 : [Horarios] = [
        Horarios(hora: "16.00", sala: "Sala 3"),
    ]
    
    var hra_7 : [Horarios] = [
        Horarios(hora: "17.00", sala: "Sala 2"),
        Horarios(hora: "22.45", sala: "Sala 1"),
        Horarios(hora: "16.10", sala: "Sala 4"),
        Horarios(hora: "12.00", sala: "Sala 3"),
        Horarios(hora: "14.15", sala: "Sala 3")
    ]
    
    var hra_8 : [Horarios] = [
        Horarios(hora: "07.00", sala: "Sala 5"),
        Horarios(hora: "08.30", sala: "Sala 1")
    ]
    
    var hra_9 : [Horarios] = [
        Horarios(hora: "19.10", sala: "Sala 2")
    ]
    
    var hra_10 : [Horarios] = [
        Horarios(hora: "11.30", sala: "Sala 1"),
        Horarios(hora: "07.00", sala: "Sala 1"),
        Horarios(hora: "07.50", sala: "Sala 4")
    ]
    
    var hra_11 : [Horarios] = [
        Horarios(hora: "09.00", sala: "Sala 5"),
        Horarios(hora: "09.30", sala: "Sala 4")
    ]
    
    var hra_12 : [Horarios] = [
        Horarios(hora: "17.35", sala: "Sala 5"),
        Horarios(hora: "18.45", sala: "Sala 4"),
        Horarios(hora: "09.00", sala: "Sala 3"),
        Horarios(hora: "07.30", sala: "Sala 2")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = pelis
    }
    
    @IBAction func unwindToAsientos(unwindSegue: UIStoryboardSegue) {
    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        var hras : Int = 0
        
        if (pelis == "Toyminator"){
            hras = hra_1.count
        } else if (pelis == "The Godmother"){
            hras = hra_2.count
        }else if (pelis == "The Real Black Swan"){
            hras = hra_3.count
        }else if (pelis == "The Dork Knight"){
            hras = hra_4.count
        }else if (pelis == "Star Shrek"){
            hras = hra_5.count
        }else if (pelis == "Puggy Potter"){
            hras = hra_6.count
        }else if (pelis == "Pride & Predator"){
            hras = hra_7.count
        }else if (pelis == "Llamaface"){
            hras = hra_8.count
        }else if (pelis == "i.phone"){
            hras = hra_9.count
        }else if (pelis == "GoBackTo...GetTheBeers"){
            hras = hra_10.count
        }else if (pelis == "Cat Fury Road"){
            hras = hra_11.count
        }else if (pelis == "Dead Sushi"){
            hras = hra_12.count
        }
        
        return hras
    }

    var peli : Horarios!
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        if (pelis == "Toyminator"){
            peli = hra_1[indexPath.row]
        } else if (pelis == "The Godmother"){
            peli = hra_2[indexPath.row]
        } else if (pelis == "The Real Black Swan"){
            peli = hra_3[indexPath.row]
        } else if (pelis == "The Dork Knight"){
            peli = hra_4[indexPath.row]
        } else if (pelis == "Star Shrek"){
            peli = hra_5[indexPath.row]
        } else if (pelis == "Puggy Potter"){
            peli = hra_6[indexPath.row]
        } else if (pelis == "Pride & Predator"){
            peli = hra_7[indexPath.row]
        } else if (pelis == "Llamaface"){
            peli = hra_8[indexPath.row]
        } else if (pelis == "i.phone"){
            peli = hra_9[indexPath.row]
        } else if (pelis == "GoBackTo...GetTheBeers"){
            peli = hra_10[indexPath.row]
        } else if (pelis == "Cat Fury Road"){
            peli = hra_11[indexPath.row]
        } else if (pelis == "Dead Sushi"){
            peli = hra_12[indexPath.row]
        }
        
        cell.textLabel?.text = "\(peli.hora)"
        cell.detailTextLabel?.text = "\(peli.sala)"

        return cell
    }
    
    var sala_ : String!
    var hora_ : String!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sala_ = peli.sala
        hora_ = peli.hora
    
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "asientosSegue", sender: cell)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "asientosSegue"{
            let tituloCartelera = segue.destination as!  Collection_Asientos
            tituloCartelera.titulo = pelis
            let numeroninos = segue.destination as! Collection_Asientos
            numeroninos.Ninos = numeroNinos
            let numeroadultos = segue.destination as! Collection_Asientos
            numeroadultos.Adultos = numeroAdultos
            
            let sala = segue.destination as! Collection_Asientos
            sala.Sala = sala_
            let hora = segue.destination as! Collection_Asientos
            hora.Hora = hora_
        }
    }
}
