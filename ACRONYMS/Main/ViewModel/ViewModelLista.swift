//
//  ViewModelLista.swift
//  ACRONYMS
//
//  Created by Javier Prado on 21-10-21.
//

import Foundation

class ViewModelLista{
    var refreshData = { () -> () in}
    var dataArray: [Lista] = [] {
        didSet {
            refreshData();
        }
    }
    var dataArray2: [ListaVar] = []{
        didSet {
            refreshData();
        }
    }
    
    func retriveData(sf:String){
        let urlConsumo:String = "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf="+sf
        print(urlConsumo)
        guard let url = URL(string: urlConsumo) else { return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                self.dataArray = try! JSONDecoder().decode([Lista].self, from:data)
                if(self.dataArray.count != 0){
                self.dataArray2 = self.dataArray[0].lfs
                }else{
                    print("No hay datos")
                }
            }
            
        }.resume()
    
        
    }
    
    func retriveDataLf(lf:String){
        let urlConsumo:String = "http://www.nactem.ac.uk/software/acromine/dictionary.py?lf="+lf
        print(urlConsumo)
        guard let url = URL(string: urlConsumo) else { return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                self.dataArray = try! JSONDecoder().decode([Lista].self, from:data)
                if(self.dataArray.count != 0){
                self.dataArray2 = self.dataArray[0].lfs
                }else{
                    print("No hay datos")
                }
            }
            
        }.resume()
        
}
    
}
