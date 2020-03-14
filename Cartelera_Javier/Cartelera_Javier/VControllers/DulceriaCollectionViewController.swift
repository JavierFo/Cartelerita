//
//  Collection_Dulceria.swift
//  Cartelera_Javier
//
//  Created by Javier Ferrer on 10/10/19.
//  Copyright © 2019 Javier Ferrer. All rights reserved.
//

import UIKit

class Collection_Dulceria: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    struct MovieKeys {
        static let keyListaProductos = "keyListaProductos"
        static let keyPrecioProductos = "keyPrecioProductos"
    }
    
    var dulces_ : [Dulceria] = [
        Dulceria(dulces: "pizza", costo: 40.00),
        Dulceria(dulces: "nachos", costo: 28.00),
        Dulceria(dulces: "palomitas", costo: 25.00),
        Dulceria(dulces: "paleta", costo: 22.50),
        Dulceria(dulces: "soda", costo: 20.00),
        Dulceria(dulces: "chocolate", costo: 15.00),
        Dulceria(dulces: "panque", costo: 22.50),
        Dulceria(dulces: "hotdog", costo: 35.50),
        Dulceria(dulces: "helado", costo: 35.00),
        Dulceria(dulces: "crepa", costo: 35.00),
        Dulceria(dulces: "agua", costo: 12.50),
        Dulceria(dulces: "pastel", costo: 28.00),
    ]
        
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var stepperDulces: UIStepper!
    
    @IBOutlet weak var lblDulces: UILabel!
    
    @IBOutlet weak var productoComprado: UIImageView!
    
    @IBOutlet weak var descripcionProductoComprado: UILabel!
    
    @IBOutlet weak var agregarProductoComprado: UIButton!
    
    @IBOutlet weak var mostrarProductoComprado: UILabel!
    
    @IBOutlet weak var agregarProductos: UIButton!
    
    @IBOutlet weak var totalPrecioProductos: UILabel!
    
    var precioDulce : Double = 0.0
    
    override func viewDidLoad() {
        
        stepperDulces.maximumValue = 10
        stepperDulces.autorepeat = false
        stepperDulces.wraps = false
        
        CollectionView.dataSource = self
        CollectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dulces_.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath as IndexPath)
        
        let imageview : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height))
        
        imageview.image = UIImage(named:dulces_[indexPath.item].dulces)
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        cell.contentView.addSubview(imageview)
        
        return cell
    }
    
    var  nombreDulce : String = ""
    var  cantidadStepperSender : Int = 0
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.green
        
        nombreDulce = dulces_[indexPath.item].dulces
        precioDulce = dulces_[indexPath.item].costo
        
        productoComprado.image = UIImage(named:dulces_[indexPath.item].dulces)
        
        descripcionProductoComprado.text = dulces_[indexPath.item].dulces + " " + ": $" + String(dulces_[indexPath.item].costo)
        
        lblDulces.text = "$ 0.0"
        cantidadStepperSender = 0
        stepperDulces.value = 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .none
    }
    
    var cantidadProductos : Int = 0
    
    var precioCalculado : Double = 0.0
    
    @IBAction func stepCantidadDulces(_ sender: UIStepper) {
        
        cantidadStepperSender = Int(sender.value)
        precioCalculado = calcularPrecioDulces(precioDulce: precioDulce, cantidad: cantidadStepperSender)
        
        cantidadProductos = Int(sender.value)
        
        lblDulces.text = String(cantidadStepperSender) + ": $" + String(precioCalculado)
        
        print(String(cantidadStepperSender))
        
    }
    
    func calcularPrecioDulces(precioDulce: Double, cantidad: Int) -> Double {
        
        var precioTotal : Double
        
        let cantidadDouble : Double = Double(cantidad)
        
        precioTotal = cantidadDouble * precioDulce
        
        return precioTotal
    }
    
    var precioTotal : Double = 0.0
    
    var listaProductos : [String] = []
    
    var listaProductosCompleta : String = ""

    @IBAction func agregarProducto(_ sender: UIButton) {
        
        cantidadStepperSender = 0
        stepperDulces.value = 0.0
        if(cantidadProductos == 1){
            
            let listaProducto = String(cantidadProductos) + " " + nombreDulce + ": $ " + String(precioCalculado)
            listaProductosCompleta = listaProductosCompleta + listaProducto + "\n"
            
            mostrarProductoComprado.text = listaProductosCompleta
        }
        else if(cantidadProductos > 1){
            
            let listaProducto = String(cantidadProductos) + " " + nombreDulce + "s : $ " + String(precioCalculado)
            listaProductosCompleta = listaProductosCompleta + listaProducto + "\n"
            
            mostrarProductoComprado.text = listaProductosCompleta
        }
        
        precioTotal = precioTotal + precioCalculado
        totalPrecioProductos.text = "Total:\n$ " + String(precioTotal)
    }
    
    @IBOutlet weak var cancelarProductos: UIButton!
    
    @IBAction func cancelarProductos(_ sender: UIButton) {
        
        stepperDulces.value = 0.0
        precioTotal = 0.0
        listaProductosCompleta = ""
        cantidadStepperSender = 0
        //Inicializar Variables
        productoComprado.image = .none
        descripcionProductoComprado.text = "Producto"
        lblDulces.text = "$"
        mostrarProductoComprado.text = "!"
        totalPrecioProductos.text = "$ 0.0"
    }
    
    @IBAction func comprarDulces(_ sender: UIButton) {
        
        showAlert(withTitleAndMessage: "Felicidades!", message: "Usted a adquirido los siguientes productos: \(listaProductosCompleta).\nPrecio total: $\(precioTotal)")
        
    }
    
    func showAlert(withTitleAndMessage title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Confirmar", style: UIAlertAction.Style.default, handler: {
            action in
            
                let defaults = UserDefaults.standard
                defaults.set(self.listaProductosCompleta, forKey: MovieKeys.keyListaProductos)
                defaults.set(self.precioTotal, forKey: MovieKeys.keyPrecioProductos)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
