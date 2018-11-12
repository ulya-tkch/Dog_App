//
//  DogViewController.swift
//  Dog3.0
//
//  Created by Kelsy McColgan on 11/11/18.
//  Copyright © 2018 Kelsy McColgan. All rights reserved.
//

import UIKit

class DogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ownedDogList.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // #warning Incomplete implementation, return the number of rows
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        /*
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        */
        
        cell.imageView?.image = ownedDogs[indexPath.row]
        
        return(cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
