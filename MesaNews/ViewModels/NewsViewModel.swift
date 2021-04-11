//
//  NewsViewModel.swift
//  MesaNews
//
//  Created by Fernando Carneiro on 09/04/21.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var author: String {
        return news.author ?? "Unknow"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String{
        return news.image_url ?? "https://scontent.fsod1-2.fna.fbcdn.net/v/t31.18172-8/17621805_1361900770540286_8085846935899828510_o.jpg?_nc_cat=101&ccb=1-3&_nc_sid=e3f864&_nc_ohc=nuoqXFbu5NMAX95bY2v&_nc_ht=scontent.fsod1-2.fna&oh=3259e1a0dd0f41af448486b37038ed68&oe=60981BA0"
    }
}
