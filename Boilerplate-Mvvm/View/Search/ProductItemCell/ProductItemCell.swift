//
//  ProductItemCell.swift
//  Boilerplate-Mvvm
//
//  Created by Muhammad Ario Bagus on 14/05/21.
//

import UIKit

class ProductItemCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
