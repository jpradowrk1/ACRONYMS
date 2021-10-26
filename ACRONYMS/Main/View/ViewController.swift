//
//  ViewController.swift
//  ACRONYMS
//
//  Created by Javier Prado on 21-10-21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sf: UITextField!
    @IBOutlet weak var lf: UITextField!
    
    @IBOutlet weak var lfLabel: UILabel!
    @IBOutlet weak var sfLabel: UILabel!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    
    
    @IBOutlet weak var bEnviar: UIButton!
    
    @IBOutlet weak var bEnviar1: UIButton!
    
    var viewModel = ViewModelLista()
    var selectTermsVars = ViewModelListaDetail()
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        
        configureView()
        bind()
    }

    
    private func configureView(){
        activity.isHidden = true
        activity.startAnimating()
        
        sfLabel.center = CGPoint(x: 40, y: 80)
        sfLabel.frame.size.width = 50
        sf.center = CGPoint(x:190, y: 80)
        sf.frame.size.width = 150
        
        bEnviar.center = CGPoint(x:80, y: 120)
        bEnviar.frame.size.width = 100
        bEnviar.frame.size.height = 40
        
        lfLabel.center = CGPoint(x: 40, y: 190)
        lfLabel.frame.size.width = 50
        lf.center = CGPoint(x:190, y: 190)
        lf.frame.size.width = 150
        
        
        bEnviar1.center = CGPoint(x:80, y: 230)
        bEnviar1.frame.size.width = 100
        bEnviar1.frame.size.height = 40
        
    }
    
    @IBAction func bEnviar(_ sender: Any) {
        activity.isHidden = true
        activity.startAnimating()
        viewModel.retriveData(sf: sf.text ?? "")
        configureView()
        bind()
        
    }
    
    @IBAction func bEnviar1(_ sender: Any) {
        activity.isHidden = true
        activity.startAnimating()
        viewModel.retriveDataLf(lf: lf.text ?? "")
        configureView()
        bind()
    }
    
    private func bind(){
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activity.stopAnimating()
                self?.activity.isHidden = true
            }
        }
    }
       
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.dataArray2.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! cellView
        
        let object = viewModel.dataArray2[indexPath.row]
        
        cell.llf.text = object.lf
        cell.freq.text = String(object.freq)
        cell.since.text = String(object.since)
        
        cell.llf.lineBreakMode = .byWordWrapping
        cell.llf.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectTermsVars.dataArray = viewModel.dataArray2[indexPath.row].vars
        print("row: \(indexPath.row)")
        
        performSegue(withIdentifier: "segueViewDetail", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueViewDetail"{
            let viewDetail = segue.destination as! ViewControllerDetail            
            viewDetail.viewModelDetail.dataArray = selectTermsVars.dataArray
        }
    }
  

    
}

class cellView: UITableViewCell{
    
    @IBOutlet weak var llf: UILabel!
    @IBOutlet weak var freq: UILabel!
    @IBOutlet weak var since: UILabel!
    
}
