//
//  NetworkingManager.swift
//  NewsLabTinkiffApp
//
//  Created by poskreepta on 08.02.23.
//

import Foundation

//protocol NetworkingManagerDelegate {
//    func didUpdateNews(_ news: NewsModel)
//    
//    func didFailWithError(error: Error)
//}
//
//struct NetworkingManager {
//    
//    var delegate: NetworkingManagerDelegate?
//    
//    func fetchNews() {
//        let newsURL = "https://newsapi.org/v2/everything?q=Apple&from=2023-02-04&sortBy=popularity&apiKey=0c7a2ca4a2a3484399bc79bc4aca5136"
//        
//        guard let url = URL(string: newsURL) else {return}
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            if error != nil {
//                self.delegate?.didFailWithError(error: error!)
//                return
//            }
//            if let safeData = data {
//                if let news = parseJSON(safeData) {
//                    self.delegate?.didUpdateNews(news)
//                    
//                }
//            }
//        } .resume()
//    }
//    
//    func parseJSON(_ newsData: Data) -> NewsModel? {
//        let decoder = JSONDecoder()
//        do {
//            let decocdedData = try decoder.decode(NewsData.self, from: newsData)
//            let title = decocdedData.articles[0].title
//            let imageUrl = decocdedData.articles[0].urlToImage
//            
//            let news = NewsModel(titleNews: title, imageNewsUrl: imageUrl)
//            print(news.titleNews)
//            return news
//        } catch {
//            delegate?.didFailWithError(error: error)
//            return nil
//        }
//    }
//    
//}
