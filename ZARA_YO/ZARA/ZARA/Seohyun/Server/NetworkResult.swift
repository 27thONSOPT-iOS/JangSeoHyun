//
//  NetworkResult.swift
//  ZARA
//
//  Created by 장서현 on 2020/12/16.
//

import Foundation
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
