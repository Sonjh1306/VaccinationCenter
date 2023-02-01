import Foundation
import Moya

enum CenterListAPI {
    case getCenterList(_ perPage: String)
}

extension CenterListAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.odcloud.kr")!
    }
    
    var path: String {
        return "api/15077586/v1/centers"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getCenterList(let perPage):
            let serviceKey: String = "2jsCVzMSSDkIqkKkzbkjZEMwHztQBWhc5ZkosBtG5H68kNKzJ0XB4j0LEQifKK67lOaqaPVgLh1XoiahHaCaqA=="
            let page: String = "1"
            let perPage: String = perPage
            
            let params: [String: Any] = ["serviceKey": serviceKey, "page": page, "perPage": perPage]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

