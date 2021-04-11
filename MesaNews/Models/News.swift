//
//  News.swift
//  MesaNews
//
//  Created by Fernando Carneiro on 08/04/21.
//

import Foundation

struct News: Decodable {
    var title: String?
    var description: String?
    var content: String?
    var author: String?
    var published_at: String?
    var highlight: Bool?
    var url: String?
    var image_url: String?
}

struct NewsEnvelope: Decodable {
    var data: [News]
}

