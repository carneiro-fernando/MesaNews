//
//  News.swift
//  MesaNews
//
//  Created by Fernando Carneiro on 08/04/21.
//

import Foundation

struct News: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}

struct NewsEnvelope: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}

