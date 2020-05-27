//
//  HomeTableViewCell.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/05/24.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var ProductCategoryLabel: UILabel!
    static let identifier:String = "ProductCell"



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setProductInformation(ProductCategory:String){
        self.ProductCategoryLabel.text = ProductCategory
    }
}
