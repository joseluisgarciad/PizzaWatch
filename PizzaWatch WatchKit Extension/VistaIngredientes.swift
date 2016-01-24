//
//  VistaIngredientes.swift
//  PizzaWatch
//
//  Created by Jose Luis Garcia Dueñas on 24/1/16.
//  Copyright © 2016 Jose Luis Garcia Dueñas. All rights reserved.
//

import WatchKit
import Foundation


class VistaIngredientes: WKInterfaceController {

    var TamanoPizza:String=""
    var TipoMasaLabel:String=""
    var TipoQueso:String=""
    var Ingredientes:String=""
    
    var Quesos = ["jamón", "pepperoni", "pavo", "salchicha", "aceituna","cebolla","pimiento","piña","anchoa", "ternera"]


    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        

   //     Boton.setEnabled(false)
        let Valoresseleccion=context as!Valores
        TamanoPizza=(String(Valoresseleccion.tamano))
        TipoMasaLabel=(String (Valoresseleccion.masa))
        TipoQueso=(String (Valoresseleccion.queso))
        
    }
    
 
    @IBOutlet var Etiqueta: WKInterfaceLabel!
    @IBOutlet var Boton: WKInterfaceButton!
    @IBAction func ButtonContinuar() {
        let ValorPizza=Valores(ValorTamano: TamanoPizza,
            ValorMasa: TipoMasaLabel,
            ValorQueso: TipoQueso,
            ValorIngredientes: Quesos[1] + "-" + Quesos[3] + "-" + Quesos[5])
        pushControllerWithName("IdentificadorConfirmacion", context: ValorPizza)
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
