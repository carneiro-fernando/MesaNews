//
//  Network.swift
//  MesaNews
//
//  Created by Fernando Carneiro on 08/04/21.
//

import Foundation

class NetworkManager{
    let imageCache = NSCache<NSString,NSData>()
    
    //Singleton para conexão
    static let shared = NetworkManager()
    private init() { }
    private let baseUrlString = "https://mesa-news-api.herokuapp.com"
    private let USTopHeadline = "/v1/client/news/highlights"
    
    //Pegar notícias, também a definição da sessão
    func getNews(completion: @escaping ([News]?) -> Void){
        let urlString = "\(baseUrlString)\(USTopHeadline)"
        guard let url = URL(string: urlString) else {return}
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(APIKey.key)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            let newsEnvelope = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsEnvelope == nil ? completion(nil) : completion(newsEnvelope!.data)
            
        }.resume()
    }

    func getImage (urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
}
