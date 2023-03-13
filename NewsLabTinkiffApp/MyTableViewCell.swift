//
//  MyTableViewCell.swift
//  NewsLabTinkiffApp
//
//  Created by poskreepta on 06.02.23.
//

import UIKit
import SDWebImage

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet var newsLabel: UILabel!

    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    public func configure(with model: Article) {
        
        self.newsLabel.text = model.title
    
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: model.urlToImage ?? "no picture") else { return }
            
//            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.newsImageView.sd_setImage(with: imageUrl)
//                self.newsImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
