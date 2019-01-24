//
//  Constants.swift
//  MovieAppChallenge
//
//  Created by Kumar,Sunil on 24/01/19.
//  Copyright © 2019 Kumar,Sunil. All rights reserved.
//

import Foundation

struct NetworkConstants {
    struct ServerUrl {
        static let baseURL : String = "https://api.myjson.com/bins/18buhu"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
