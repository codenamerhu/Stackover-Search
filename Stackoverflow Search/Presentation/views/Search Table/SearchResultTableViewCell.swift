//
//  SearchResultTableViewCell.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var tileLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var acceptedImage: UIImageView!
    
    @IBOutlet weak var askedBy: UILabel!
    @IBOutlet weak var askedByLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var votedNumberLabel: UILabel!
    @IBOutlet weak var answereeNumberLable: UILabel!
    @IBOutlet weak var viewedNumberlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        acceptedImage.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(){
        
    }
    
}
