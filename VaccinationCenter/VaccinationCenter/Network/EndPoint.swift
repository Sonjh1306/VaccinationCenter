import Foundation

enum Scheme: String {
    case https = "https"
}

enum Host: String {
    case base = "api.odcloud.kr"
}

enum Path: String {
    case basePath = "/api"
    case centerPath = "/15077586/v1/centers"
}

enum Key: String {
    case serviceKey = "2jsCVzMSSDkIqkKkzbkjZEMwHztQBWhc5ZkosBtG5H68kNKzJ0XB4j0LEQifKK67lOaqaPVgLh1XoiahHaCaqA=="
}

struct EndPoint {

    func url(perPage: String) -> URL? {
        var component = URLComponents()
        component.scheme = Scheme.https.rawValue
        component.host = Host.base.rawValue
        component.path = Path.basePath.rawValue + Path.centerPath.rawValue
        
        let serviceKey = URLQueryItem(name: "serviceKey", value: Key.serviceKey.rawValue)
        let page = URLQueryItem(name: "page", value: "1")
        let perPage = URLQueryItem(name: "perPage", value: perPage)
        
        component.queryItems = [serviceKey, page, perPage]
        return component.url
    }
    
}
