//
//  ArticleCell.swift
//  News App
//
//  Created by Sơn Nguyễn on 04/08/2022.
//

import UIKit
import SDWebImage

class ArticleCell: UITableViewCell {

    static let identifier = "ArticleCell"
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    var article: Article?
    override func awakeFromNib() {
        super.awakeFromNib()
        fetchData()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    private func fetchData(){
        let imageURL = URL(string: article?.urlToImage ?? "")
        self.photoView.sd_setImage(with: imageURL)
        self.titleLabel.text = article?.title
        sourceLabel.text = article?.source?.name
        authorLabel.text = article?.author
    }
    
}
