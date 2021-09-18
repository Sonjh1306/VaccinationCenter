import Foundation
import Alamofire

class NetworkManager {
    
    var endPoint: EndPoint
    
    init() {
        self.endPoint = EndPoint()
    }
    
    private func sendRequest(_ perPage: String, completion: @escaping ((Error?, [Center]?) -> Void)) {
        let url = endPoint.url(perPage: perPage)
        AF.request(url!, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: CenterResponse.self) { response in
                if let error = response.error {
                    return completion(error, [])
                }
                if let list = response.value {
                    return completion(nil, list.data)
                }

            }
    }
    
}
