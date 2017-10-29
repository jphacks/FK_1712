//
//  Router.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/29.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case sendAvailableTime(params: Parameters)
    case registerUser(params: Parameters)
    case getUser(params: Parameters)
    
    static let baseURL = "http://172.16.30.63:8080"
    static let suffix = ""
    
    var method: HTTPMethod {
        switch self {
        case .sendAvailableTime:
            return .post
        case .registerUser:
            return .post
        case .getUser:
            return .get
        }
    }
    
    var path: String {
        switch self {
        //TODO: implement path string
        case .sendAvailableTime:
            return "/"
        case .registerUser:
            return "/"
        case .getUser:
            return "/"
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let baseURLString = Router.baseURL + Router.suffix
        let url = try baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .sendAvailableTime(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .registerUser(let parameters):
            urlRequest = try URLEncoding.methodDependent.encode(urlRequest, with: parameters)
        case .getUser(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        
        return urlRequest
    }
}
