//
//  DetailViewController.swift
//  CountryNews-MVC
//
//  Created by Christian Tanputra on 03/09/20.
//  Copyright © 2020 Christian Tanputra. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var readMoreText: UILabel!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClickLabel(sender:)))
        if let article = article {
            self.imgView?.load(url: URL(string: article.urlToImage ?? "https://www.apple.com/newsroom/images/values/corporate/standard/Apple_google-partner-on-covid-19-contact-tracing-technology_04102020_inline.jpg.large.jpg")!)
            self.descriptionText.text = article.content
            self.readMoreText.text = "Read more on Safari"
            self.readMoreText.isUserInteractionEnabled = true
            self.readMoreText.addGestureRecognizer(tap)
            
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func onClickLabel(sender:UITapGestureRecognizer) {
        openUrl(urlString: article?.url)
    }

    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
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
