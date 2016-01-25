//
//  Valores.swift
//  PizzaWatch
//
//  Created by Jose Luis Garcia Dueñas on 23/1/16.
//  Copyright © 2016 Jose Luis Garcia Dueñas. All rights reserved.
//

import WatchKit

 class Valores: NSObject {
    var tamano:String = ""
    var masa:String = ""
    var queso:String = ""
    var ingredientes:String = ""
    
    init(ValorTamano:String,
         ValorMasa:String,
         ValorQueso:String,
         ValorIngredientes:String)
    {
        tamano = ValorTamano
        masa = ValorMasa
        queso = ValorQueso
        ingredientes = ValorIngredientes
    }
}
