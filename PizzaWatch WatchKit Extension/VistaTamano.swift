//
//  VistaTamano.swift
//  PizzaWatch
//
//  Created by Jose Luis Garcia Dueñas on 22/1/16.
//  Copyright © 2016 Jose Luis Garcia Dueñas. All rights reserved.
//

import WatchKit
import Foundation


class VistaTamano: WKInterfaceController {

    @IBOutlet var PickerTamano: WKInterfacePicker!
    
    @IBAction func ButtonContinuar() {
        
    }
    @IBOutlet var Boton: WKInterfaceButton!
    @IBOutlet var Etiqueta: WKInterfaceLabel!
    
    var Tamanos = ["Pequeña", "Mediana", "Grande"]
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var pickerItems: [WKPickerItem] = []
        for i in 0...2 {
            let item = WKPickerItem()
            item.title = Tamanos[i]
            pickerItems.append(item)
        }
        self.PickerTamano.setItems(pickerItems)
        Boton.setEnabled(false)
    }
    
    @IBAction func pickerChanged(value: Int) {
        Etiqueta.setText(Tamanos[value])
        Boton.setEnabled(true)
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
