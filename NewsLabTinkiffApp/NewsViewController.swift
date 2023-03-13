//
//  ViewController.swift
//  NewsLabTinkiffApp
//
//  Created by poskreepta on 06.02.23.
//

import UIKit


class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource   {
    
    @IBOutlet var table: UITableView!

    var news = NewsData(articles: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        fetchData()
    }
    
    
    func fetchData() {
        let newsURL = "https://newsapi.org/v2/everything?q=Apple&from=2023-03-01&sortBy=popularity&apiKey=0c7a2ca4a2a3484399bc79bc4aca5136"
            
            guard let url = URL(string: newsURL) else {return}
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data else {
                    return
                }
                
               
                do {
                    let decoder = JSONDecoder()
                    self.news = try decoder.decode(NewsData.self, from: data) //в кач-ве возвращаемых данных объект типa NewsData, данные сохраняются в news типо NewsData
                    self.news.articles = self.news.articles.filter {
                    $0.urlToImage != nil
                    }
                    DispatchQueue.main.async {
                       self.table.reloadData()
                    }
                } catch let error {
                    print("Error serialization json", error)
                }
            } .resume()
        }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: - TableView Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        customCell.configure(with: news.articles[indexPath.row])
        
        return customCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
     //MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    


}

