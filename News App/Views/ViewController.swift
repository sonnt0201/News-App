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
//    var count : Int = 0
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        title = "News"
        view.addSubview(tableView)
        setTableView()
        fetchData()
        
    }

    private func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "ArticleCell", bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(nib, forCellReuseIdentifier: ArticleCell.identifier)
//        let headerViewCellNib = UI
//        tableView.register(ArticleHeade, forHeaderFooterViewReuseIdentifier: <#T##String#>)
    }
    
    private func fetchData(){
        APICaller.shared.getTopStories { result in
            switch result {
            case.success(let headlines):
                self.articles = headlines.articles
                self.tableView.reloadData()
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
        
//        cell.backgroundColor = .systemRed
        cell.fetchData(article: articles[indexPath.row])
        cell.addConstraints([cell.widthAnchor.constraint(equalToConstant: view.bounds.width),
                             cell.heightAnchor.constraint(equalToConstant: 100)
                            ])
        cell.layer.cornerRadius = 8
        cell.topInset = 10
        cell.bottomInset = 10
        cell.layoutMarginsDidChange()
       // addConstraints(cell: cell)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
