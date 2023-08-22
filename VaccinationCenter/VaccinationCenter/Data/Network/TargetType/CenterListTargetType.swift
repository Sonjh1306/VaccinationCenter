import Foundation
import Moya

enum CenterListTargetType {
    case getCenterList(_ perPage: String)
}

extension CenterListTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Constants.BASE_URL)!
    }
    
    var path: String {
        return Constants.CENTER_LIST_PATH
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getCenterList(let perPage):
            let serviceKey: String = Bundle.main.apiKey
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

