//
//  ViewController.swift
//  Cartelera_Javier
//
//  Created by Javier Ferrer on 10/7/19.
//  Copyright © 2019 Javier Ferrer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var elTitulo: UILabel!
    
    @IBOutlet weak var stepperAdulto: UIStepper!
    
    @IBOutlet weak var stepperNino: UIStepper!
    
    @IBOutlet weak var lblAdulto: UILabel!
    
    @IBOutlet weak var lblNino: UILabel!
    
    @IBOutlet weak var hraBtn: UIButton!
    
    var movie : [Peliculas] = [
        Peliculas(peliculas: "Toyminator"), Peliculas(peliculas: "The Godmother"), Peliculas(peliculas: "The Real Black Swan"), Peliculas(peliculas: "The Dork Knight"), Peliculas(peliculas: "Star Shrek"), Peliculas(peliculas: "Puggy Potter"), Peliculas(peliculas: "Pride & Predator"), Peliculas(peliculas: "Llamaface"), Peliculas(peliculas: "i.phone"), Peliculas(peliculas: "GoBackTo...GetTheBeers"), Peliculas(peliculas: "Cat Fury Road"), Peliculas(peliculas: "Dead Sushi")
    ]
    
    var saveMovie : String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return movie.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return movie[row].peliculas
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 270
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let miPeli = UIView(frame: CGRect( x: 0, y: 0, width: pickerView.bounds.width + 270, height: 300))
        
        let misPelis = UIImageView(frame: CGRect(x: picker.center.x, y: 0, width: 240, height: 300))
        
        misPelis.image = UIImage(named: movie[row].peliculas)
        
        miPeli.addSubview(misPelis)
    
        return miPeli
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveMovie = movie[0].peliculas
        
        picker.dataSource = self
        picker.delegate = self
        
        stepperNino.maximumValue = 10
        stepperNino.autorepeat = false
        stepperNino.wraps = false
        
        stepperAdulto.maximumValue = 10
        stepperAdulto.autorepeat = false
        stepperAdulto.wraps = false
        
    }
    
    @IBAction func unwindToDulceria(unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func unwindToHorarios(unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func unwindToticket(_ unwindSegue: UIStoryboardSegue) {
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print("Usted ha escogido la pelicula:  \(movie[row].peliculas)")
        
        saveMovie = movie[row].peliculas
        
        elTitulo.font = UIFont(name: "AmericanTypewriter" , size: 32)
        elTitulo.text = movie[row].peliculas
        
    }
    
    var numeroNinos : Double = 0.0
    var numeroAdultos : Double = 0.0
    
    @IBAction func stepAdulto(_ sender: UIStepper) {
        
        numeroAdultos = sender.value
        
        lblAdulto.text = String(Int(numeroAdultos))
        
        print(String(Int(sender.value)))
    }
    
    @IBAction func stepNino(_ sender: UIStepper) {
        
        numeroNinos = sender.value
        
        lblNino.text = String(Int(numeroNinos))
        
        print(String(Int(sender.value)))
    }
    
    @IBAction func horariosBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "horarioSegue", sender: hraBtn)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "horarioSegue"{
            let peliculasCartelera = segue.destination as!  TableViewController_Peliculas
            peliculasCartelera.pelis = saveMovie
            let numeroninos = segue.destination as!  TableViewController_Peliculas
            numeroninos.numeroNinos = numeroNinos
            let numeroadultos = segue.destination as! TableViewController_Peliculas
            numeroadultos.numeroAdultos = numeroAdultos
        }
    }
}

