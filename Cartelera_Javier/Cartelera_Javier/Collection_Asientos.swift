//
//  Collection_Asientos.swift
//  Cartelera_Javier
//
//  Created by Javier Ferrer on 10/11/19.
//  Copyright © 2019 Javier Ferrer. All rights reserved.
//

import UIKit

class Collection_Asientos: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var asientos = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    var titulo : String!
    
    var Ninos : Double!
    var Adultos : Double!
    
    var Sala : String!
    var Hora : String!
    
    struct MovieKeys {
        static let keyTitulo = "keyTitulo"
        static let keySala = "keySala"
        static let keyHora = "keyHora"
        static let keyNinos = "keyNinos"
        static let keyAdultos = "keyAdultos"
        static let keyNumeracion = "keyNumeracion"
    }
    
    @IBOutlet weak var collectionAsientos: UICollectionView!
    
    @IBOutlet weak var navbar2: UINavigationItem!
    
    var buttonCounter = [Int]()
    
    override func viewDidLoad() {
        navigationItem.title = titulo
        navbar2.title = titulo
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.asientos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_Identifier", for: indexPath as IndexPath)
        
        cell.backgroundColor = UIColor.green
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        if buttonCounter.contains(indexPath.row){
            cell.backgroundColor = UIColor.blue
        } else {
            cell.backgroundColor = UIColor.green
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItem(at: indexPath)
        if buttonCounter.contains(indexPath.row){
            let index = buttonCounter.firstIndex(of: indexPath.row)
            buttonCounter.remove(at: index!)
            collectionView.reloadItems(at: [indexPath])
        }
        else{
            buttonCounter.append(indexPath.row)
            collectionView.reloadItems(at: [indexPath])
        }
        print(buttonCounter)
    }
    
    var costoBoletosNino : Double = 40.0
    var costoBoletosAdulto : Double = 60.0
    var costoTotalBoletos : Double = 0.0
    var lugaresTotal : Int = 48
    var lugaresRestantes : Int = 0
    
    var totalNinos : Double = 0.0
    var totaladultos : Double = 0.0
    var totalAdultosNinos : Double = 0.0
    
    @IBAction func ComprarBoletos(_ sender: UIButton) {
        
        lugaresRestantes = lugaresTotal - buttonCounter.count
        totalNinos = Ninos * costoBoletosNino
        totaladultos = Adultos * costoBoletosAdulto
        totalAdultosNinos = totalNinos + totaladultos
        
        showAlert(withTitleAndMessage: "Felicidades!", message: "Usted a seleccionado \(Int(Ninos)) asiento(s) de Niño y \(Int(Adultos)) asiento(s) de Adulto con la siguiente numeracion: \(buttonCounter).\nPrecio Total: $\(totalAdultosNinos).\nQuedan \(lugaresRestantes) asientos en la sala.")
        
    }
    
        func showAlert(withTitleAndMessage title:String, message:String) {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.actionSheet)
            
            alert.addAction(UIAlertAction(title: "Confirmar", style: UIAlertAction.Style.default, handler: {
                action in
        
                let defaults = UserDefaults.standard
                    defaults.set(self.titulo, forKey: MovieKeys.keyTitulo)
                    defaults.set(self.Sala, forKey: MovieKeys.keySala)
                    defaults.set(self.Hora, forKey: MovieKeys.keyHora)
                    defaults.set(self.Ninos, forKey: MovieKeys.keyNinos)
                    defaults.set(self.Adultos, forKey: MovieKeys.keyAdultos)
                    defaults.set(self.buttonCounter, forKey: MovieKeys.keyNumeracion)
                
            } ))
            alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: {
                action in print ("Bye")
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    
}
