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
    var IndiceActual:Int=0
    var CantidadIngredientes:Int=0
    
    var ListaIngredientes = ["jamón", "pepperoni", "pavo", "salchicha", "aceituna","cebolla","pimiento","piña","anchoa", "ternera"]


    var DiccIngredientes:[Int: String] = [99:" "]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var pickerItems: [WKPickerItem] = []
        for i in 0...9 {
            let item = WKPickerItem()
            item.title = ListaIngredientes[i]
            pickerItems.append(item)
        }
        self.PickerIngredientes.setItems(pickerItems)
        Boton.setEnabled(false)

        let Valoresseleccion=context as!Valores
        TamanoPizza=(String(Valoresseleccion.tamano))
        TipoMasaLabel=(String (Valoresseleccion.masa))
        TipoQueso=(String (Valoresseleccion.queso))
        Ingredientes=(String (Ingredientes))
    }
    
    @IBAction func pickerChanged(value: Int) {
        Ingredientes = Ingredientes + " " + ListaIngredientes[value]
        IngredientesLabel.setText(Ingredientes)
        Boton.setEnabled(true)
    }

    @IBAction func BotonSeleccionar() {
        if VerificarSiEstaSeleccionado(IndiceActual) == true {
            Mensaje(ListaIngredientes[IndiceActual] + " Ya ha sido seleccionado")
        } else {
            if CantidadIngredientes == 0 {
                CantidadIngredientes = 1
            }
        
            if CantidadIngredientes > 5 {
                Mensaje("No se pueden seleccionar mas de 5 Ingredientes")
            } else {
                Ingredientes = Ingredientes + " " +     ListaIngredientes[IndiceActual]
                IngredientesLabel.setText(Ingredientes)
                DiccIngredientes[IndiceActual] = ListaIngredientes[IndiceActual]
                Boton.setEnabled(true)
                CantidadIngredientes++
            }
        }
    }
    
    @IBAction func BotonBorrar() {
        for (myKey,myValue) in DiccIngredientes {
            if myKey == IndiceActual {
                if ActualizarListaIngredientesSeleccionados() == true {
                  print(myValue)
                }
            }
        }
             
    }
    
    func ActualizarListaIngredientesSeleccionados() -> Bool {
        var lista:String = ""
        DiccIngredientes.removeValueForKey(IndiceActual)
        CantidadIngredientes=CantidadIngredientes-1

        for (myKey,myValue) in DiccIngredientes {
            lista=lista + myValue
            print(myKey)
            }
        IngredientesLabel.setText(lista)
        Ingredientes = lista
        return true
    }
    
    func VerificarSiEstaSeleccionado(Indice: Int)-> Bool {
        
        for (myKey,myValue) in DiccIngredientes {
            if myKey == Indice {
               print(myValue)
               return true
            }
        }
        return false
    }
    
    //incluir funcion que revise si se ha seleccionado un elemento que ya fué seleccionado
    
    @IBAction func pickerSelected(value: Int) {
        IndiceActual=value

    }
    @IBOutlet var IngredientesLabel: WKInterfaceLabel!

    @IBOutlet var PickerIngredientes: WKInterfacePicker!
    @IBOutlet var Etiqueta: WKInterfaceLabel!
    @IBOutlet var Boton: WKInterfaceButton!
    @IBAction func ButtonContinuar() {
        let ValorPizza=Valores(ValorTamano: TamanoPizza,
            ValorMasa: TipoMasaLabel,
            ValorQueso: TipoQueso,
            ValorIngredientes: Ingredientes)
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
    
    func Mensaje(Texto:String){
        
        let h0 = { print("ok")}
        
        let action1 = WKAlertAction(title: "Ok", style: .Default, handler:h0)
//        let action2 = WKAlertAction(title: "Decline", style: .Destructive) {}
//        let action3 = WKAlertAction(title: "Cancel", style: .Cancel) {}
        
        presentAlertControllerWithTitle("Error", message: Texto, preferredStyle: .ActionSheet, actions: [action1])
        
        
    }

}
