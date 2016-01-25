//
//  VistaConfirmacion.swift
//  PizzaWatch
//
//  Created by Jose Luis Garcia Dueñas on 24/1/16.
//  Copyright © 2016 Jose Luis Garcia Dueñas. All rights reserved.
//

import WatchKit
import Foundation

var TamanoPizza:String=""
var TipoMasa:String=""
var TipoQueso:String=""
var Ingredientes:String=""


class VistaConfirmacion: WKInterfaceController {
    @IBOutlet var Boton: WKInterfaceButton!
    @IBOutlet var Etiqueta: WKInterfaceLabel!
    @IBOutlet var TamanoPizzaLabel: WKInterfaceLabel!
    @IBOutlet var TipoMasaLabel: WKInterfaceLabel!
    @IBOutlet var TipoQuesoLabel: WKInterfaceLabel!
    @IBOutlet var IngredientesLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let Valoresseleccion=context as!Valores
        TamanoPizza=(String(Valoresseleccion.tamano))
        TipoMasa=(String (Valoresseleccion.masa))
        TipoQueso=(String (Valoresseleccion.queso))
        Ingredientes=(String (Valoresseleccion.ingredientes))
        
        TamanoPizzaLabel.setText(TamanoPizza)
        TipoMasaLabel.setText(TipoMasa)
        TipoQuesoLabel.setText(TipoQueso)
        IngredientesLabel.setText(Ingredientes)
        // Configure interface objects here.
    }

    
    @IBAction func ButtonConfirmar() {

        pushControllerWithName("IdentificadorEnHorno", context: nil)
    }

    

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
