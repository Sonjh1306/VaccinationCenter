import Foundation
import Alamofire

class NetworkManager {
    
    var endPoint: EndPoint
    
    init() {
        self.endPoint = EndPoint()
    }
    
    func sendRequest<T: Decodable>(perPage: String, type: T.Type, completion: @escaping ((Error?, T?) -> Void)) {
        let url = endPoint.url(perPage: perPage)
        AF.request(url!, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: type) { response in
                if let error = response.error {
                    return completion(error, nil)
                }
                if let list = response.value {
                    return completion(nil, list)
                }

            }
    }
    
}
