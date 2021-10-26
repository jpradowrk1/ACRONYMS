//
//  ListaVar.swift
//  ACRONYMS
//
//  Created by Javier Prado on 21-10-21.
//

import Foundation

struct ListaVar: Codable {
    let lf: String
    let freq:Int
    let since: Int
    let vars: [ListaVarVar]
}

