//
//  viewModelListaDetail.swift
//  ACRONYMS
//
//  Created by Javier Prado on 24-10-21.
//

import Foundation

class ViewModelListaDetail{
    
    var refreshData = { () -> () in}
    var dataArray: [ListaVarVar] = [] {
        didSet {
            refreshData();
        }
    }
    
}
