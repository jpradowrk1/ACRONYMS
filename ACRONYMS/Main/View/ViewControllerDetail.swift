//
//  ViewControllerDetail.swift
//  ACRONYMS
//
//  Created by Javier Prado on 24-10-21.
//


import UIKit

class ViewControllerDetail: UITableViewController{
    
    var viewModelDetail = ViewModelListaDetail()
    
    
    override func viewDidLoad() {
        print("ingreso")
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDetail = tableView.dequeueReusableCell(withIdentifier: "CellDetail") as! cellViewDetail
        
        let object = viewModelDetail.dataArray[indexPath.row]
        cellDetail.llfDetail.text = object.lf
        cellDetail.freqDetail.text = String(object.freq)
        cellDetail.sinceDetail.text = String(object.since)
        
        return cellDetail
    }
    
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (viewModelDetail.dataArray.count)
}

}

class cellViewDetail: UITableViewCell{
    
    @IBOutlet weak var llfDetail: UILabel!
    @IBOutlet weak var sinceDetail: UILabel!
    @IBOutlet weak var freqDetail: UILabel!
}
