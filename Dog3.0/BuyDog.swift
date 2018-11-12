//
//  BuyDog.swift
//  Dog3.0
//
//  Created by Kelsy McColgan on 11/11/18.
//  Copyright © 2018 Kelsy McColgan. All rights reserved.
//

import UIKit
var dogList: [UIImage] = [#imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "13"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "download"), #imageLiteral(resourceName: "12"), #imageLiteral(resourceName: "17"), #imageLiteral(resourceName: "19"), #imageLiteral(resourceName: "8"), #imageLiteral(resourceName: "25"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "0"), #imageLiteral(resourceName: "24")]
var ownedDogList = [Int]()
var ownedDogs = [UIImage]()
var dogCounter = Int.random(in: 0..<19)  //CHANGE ARRAY SIZE BASED ON NUM DOGS
class BuyDog: UIViewController {
    
    

    @IBOutlet weak var dog_image_view: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dogCounter = Int.random(in: 0..<19)
        for (index, element) in ownedDogList.enumerated() {
            while(index == dogCounter){
                if(index >= dogList.count){
                    return;
                }
                dogCounter = Int.random(in: 0..<19)
            }
        }
        dog_image_view.image = dogList[dogCounter]
        ownedDogs.append(dogList[dogCounter])
        ownedDogList.append(dogCounter);
        dogList.remove(at: dogCounter);
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
