//
//  ViewController.swift
//  News App
//
//  Created by Sơn Nguyễn on 03/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var articles: [Article?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        title = "News"
        setTableView()
        
    }
    
    private func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "ArticleCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ArticleCell.identifier)
    }
    
    private func fetchData(){
        APICaller.shared.getTopStories { result in
            switch result {
            case.success(let headlines):
                self.articles = headlines.articles
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
        cell.article = articles[indexPath.row]
        // TODO: - add constrants func
        addConstraintForCell(cell: ArticleCell)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
}
