//
//  CartCollectionViewCell.swift
//  PerfectPair
//
//  Created by Nada Alansari on 16/04/1443 AH.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    
    var yourobj : (() -> Void)? = nil

    @IBAction func saveCell(_ sender: Any) {
        if let btnAction = self.yourobj
              {
                  btnAction()
                //  user!("pass string")
              }

    }
    
    
    @IBOutlet weak var imageInCart: UIImageView!
    @IBOutlet weak var sizeSegment: UISegmentedControl!
    @IBOutlet weak var cartNameLable: UILabel!
    @IBOutlet weak var qtyTextField: UITextField!
    

}
