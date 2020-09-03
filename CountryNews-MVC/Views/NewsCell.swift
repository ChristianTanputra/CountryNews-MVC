//
//  NewsCell.swift
//  CountryNews-MVC
//
//  Created by Christian Tanputra on 31/08/20.
//  Copyright © 2020 Christian Tanputra. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var detailTextLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    func configure(article: Article){
        self.textLbl?.text = article.title
        self.detailTextLbl?.text = article.articleDescription
        self.imgView?.load(url: URL(string: article.urlToImage ?? "https://www.apple.com/newsroom/images/values/corporate/standard/Apple_google-partner-on-covid-19-contact-tracing-technology_04102020_inline.jpg.large.jpg")!) 
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
