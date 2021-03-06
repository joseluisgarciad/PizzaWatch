//
//  VistaMasa.swift
//  PizzaWatch
//
//  Created by Jose Luis Garcia Dueñas on 23/1/16.
//  Copyright © 2016 Jose Luis Garcia Dueñas. All rights reserved.
//

import WatchKit
import Foundation


class VistaMasa: WKInterfaceController {
    var TamanoPizza:String=""
    var TipoMasaLabel:String=""
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var pickerItems: [WKPickerItem] = []
        for i in 0...2 {
            let item = WKPickerItem()
            item.title = Tamanos[i]
            pickerItems.append(item)
        }
        self.PickerMasa.setItems(pickerItems)
        Boton.setEnabled(false)
        let Valoresseleccion=context as!Valores
        TamanoPizza=(String(Valoresseleccion.tamano))

    }
    
    @IBAction func pickerChanged(value: Int) {
        Etiqueta.setText(Tamanos[value])
        Boton.setEnabled(true)
        TipoMasaLabel = Tamanos[value]
    }


    
    @IBOutlet var Etiqueta: WKInterfaceLabel!
    @IBOutlet var Boton: WKInterfaceButton!
    @IBOutlet var PickerMasa: WKInterfacePicker!
    
    @IBAction func ButtonContinuar() {
        let ValorPizza=Valores(ValorTamano:TamanoPizza,
                               ValorMasa: TipoMasaLabel,
                               ValorQueso: "",
                               ValorIngredientes: "")
        pushControllerWithName("IdentificadorValoresQueso", context: ValorPizza)
    

    }
    
    var Tamanos = ["Delgada", "Crujiente", "Gruesa"]

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
