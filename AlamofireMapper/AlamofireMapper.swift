//
//  AlamofreMapper.swift
//  AlamofireMapper
//
//  Created by Sua Le on 8/21/18.
//  Copyright © 2018 Sua Le. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest {
    
    @discardableResult
    public func responseObject<T: Decodable>(queue: DispatchQueue? = nil, decoder: JSONDecoder? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: DataRequest.serializer(decoder: decoder ?? defaultDecoder), completionHandler: completionHandler)
    }
    
    public static func serializer<T: Decodable>(decoder: JSONDecoder) -> DataResponseSerializer<T> {
        return DataResponseSerializer { request, response, data, error in
            let domain = "come.kesu.AlamofireMapper"
            guard error == nil, let data = data else {
                return .failure(error ?? NSError(domain: domain, code: -1, userInfo: [NSLocalizedFailureReasonErrorKey: "Data is nil"]))
            }
            
            var reason = "JSONDecoder failed to serialize response."
            do {
                let parsed = try decoder.decode(T.self, from: data)
                return .success(parsed)
            } catch let error {
                dump(error)
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                dump(json)
                reason = error.localizedDescription
            }
            return .failure(NSError(domain: domain, code: -2, userInfo: [NSLocalizedFailureReasonErrorKey: reason]))
        }
    }
    
    open var defaultDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .dateDecoding
        return decoder
    }
}

private extension JSONDecoder.DateDecodingStrategy {
    static let dateDecoding = custom { decoder -> Date in
        let container = try decoder.singleValueContainer()
        let string = try? container.decode(String.self)
        if let string = string {
            if let date = Formatter.iso8601.date(from: string) ?? Formatter.iso8601noFS.date(from: string) {
                return date
            }
        } else if let timestamp = try? container.decode(Double.self) {
            return Date(timeIntervalSince1970: timestamp)
        }
        return Date()
    }
}


private extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
    static let iso8601noFS: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        return formatter
    }()
}
