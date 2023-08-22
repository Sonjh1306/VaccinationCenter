//
//  NetworkWrapper.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/22.
//

import Moya

class NetworkWrapper<Target: TargetType>: MoyaProvider<Target> {
    
    init(endPointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
         stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
         plugins: [PluginType]) {
        
        let session = MoyaProvider<Target>.defaultAlamofireSession()
        session.sessionConfiguration.timeoutIntervalForRequest = 10
        session.sessionConfiguration.timeoutIntervalForResource = 10
        
        super.init(endpointClosure: endPointClosure, stubClosure: stubClosure, session: session, plugins: plugins)
    }
    
    func request<T: Codable>(target: Target, decodingType: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        self.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(decodedData))
                } catch (let error) {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
