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
    
    var viewModel: SearchViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        acceptedImage.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureData(items: Items){
        title.text = items.title
        
        if let username = items.owner?.display_name {
            askedBy.text = "asked by " + username
        }
        
        if let score = items.score {
            votedNumberLabel.text = String(score) + " Votes"
        }
        
        
        
        if let views = items.view_count {
            viewedNumberlabel.text = String(views) + " Views"
        }
        
        if let _ = items.accepted_answer_id {
            tileLeadingConstraint.constant = 30
            askedByLeadingConstraint.constant = 30
            acceptedImage.isHidden = false
        }
    }
    
}
