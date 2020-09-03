//
//  ViewController.swift
//  CountryNews-MVC
//
//  Created by Christian Tanputra on 31/08/20.
//  Copyright © 2020 Christian Tanputra. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    var news: News?
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        fetchData()
    }
    
    private func setupTableView() {
//        tableView.register(NewsCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
    }
    
    private func fetchData() {
        //self.news = []
        PullData.shared.fetchAPI { (news, err) in
            if let err = err {
                print("Failed to fetch API: ", err)
                return
            }
            
            if let news = news {
                print(news)
                self.news = news
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
            
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(news?.articles.count)
        return news?.articles.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NewsCell
        cell.configure(article: (news?.articles[indexPath.row])!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: news?.articles[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let object = sender as! Article
        let vc = segue.destination as! DetailViewController
        vc.article = object
    }
    

}

