//
//  AuthService.swift
//  ZARA
//
//  Created by 장서현 on 2020/12/18.
//

import Foundation

import Alamofire

struct AuthService {
    static let shared = AuthService()
    
    func getProductData(completoin: @escaping (NetworkResult<Any>) -> Void) {
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let header: HTTPHeaders = ["Content-Type":"application/json","token":token]
        
        let dataRequest = Alamofire.request(APIConstants.baseURL, method: .get, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { (dataResponse) in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(status: statusCode, data: value)
                
                completoin(networkResult)
                
            case .failure(let error):
                print(error.localizedDescription)
                completoin(.networkFail)
            }
        }
    }
    
    private func judge(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<ProductData>.self, from: data) else { return .pathErr }
        switch status {
        case 200:
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
