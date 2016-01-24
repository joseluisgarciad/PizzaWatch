//
//  VistaQueso.swift
//  PizzaWatch
//
//  Created by Jose Luis Garcia Dueñas on 23/1/16.
//  Copyright © 2016 Jose Luis Garcia Dueñas. All rights reserved.
//

import WatchKit
import Foundation


class VistaQueso: WKInterfaceController {

    var TamanoPizza:String=""
    var TipoMasaLabel:String=""
    var TipoQueso:String=""
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var pickerItems: [WKPickerItem] = []
        for i in 0...2 {
            let item = WKPickerItem()
            item.title = Quesos[i]
            pickerItems.append(item)
        }
        self.PickerQueso.setItems(pickerItems)
        Boton.setEnabled(false)
        let Valoresseleccion=context as!Valores
        TamanoPizza=(String(Valoresseleccion.tamano))
        TipoMasaLabel=(String (Valoresseleccion.masa))
        
    }
    
    @IBAction func pickerChanged(value: Int) {
        Etiqueta.setText(Quesos[value])
        Boton.setEnabled(true)
        TipoQueso = Quesos[value]
    }
    
    
    @IBOutlet var Etiqueta: WKInterfaceLabel!
    
    @IBOutlet var PickerQueso: WKInterfacePicker!
    
    @IBOutlet var Boton: WKInterfaceButton!
    @IBAction func ButtonContinuar() {
         let ValorPizza=Valores(ValorTamano: TamanoPizza,
            ValorMasa: TipoMasaLabel,
            ValorQueso: TipoQueso,
            ValorIngredientes: "")
        pushControllerWithName("IdentificadorIngredientes", context: ValorPizza)
    }
    
    
    var Quesos = ["mozarela", "cheddar", "parmesano", "sin queso"]
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
