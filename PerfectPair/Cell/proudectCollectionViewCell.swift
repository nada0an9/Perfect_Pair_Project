//
//  proudectCollectionViewCell.swift
//  PerfectPair
//
//  Created by Nada Alansari on 16/04/1443 AH.
//

import UIKit

class proudectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var proudect_name_Lable: UILabel!
    var yourobj : (() -> Void)? = nil

    @IBAction func addTocart(_ sender: Any) {
        if let btnAction = self.yourobj
              {
                  btnAction()
              }
    }
    @IBOutlet weak var shoseImage: UIImageView!
    @IBOutlet weak var priceLable: UILabel!
    
}
