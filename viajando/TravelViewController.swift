//
//  TravelViewController.swift
//  viajando
//
//  Created by Lab on 12/05/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import UIKit

class TravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var _rowIndex: Int = 0;
    
    @IBOutlet weak var viagensTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viagensTable.delegate = self
        self.viagensTable.dataSource = self
        self.viagensTable.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viagensTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "Viajar", image: UIImage(named: "travel"), tag: 2)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViagemDados.instancia.viagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "minhaCell", for: indexPath)
        
        cell.textLabel?.text = ViagemDados.instancia.viagens[indexPath.row].titulo
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndex = self.viagensTable.indexPath(for: sender as! UITableViewCell)
        self._rowIndex = selectedIndex!.row
        let travelFormView = segue.destination as! TravelFormViewController
        travelFormView._rowIndex = self._rowIndex
        
        print("tableView prepareForSegue: " + String(_rowIndex))
    }
}
