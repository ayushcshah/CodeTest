//
//  CTError.swift
//  CodeTest
//
//  Created by Ayush Shah on 9/4/22.
//

import Foundation

enum CTError: Error {
    case invalidURL
    case keyNotFound
    case dataNotFound
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
}

extension CTError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Please Check URL", comment: "")
        case .keyNotFound:
            return NSLocalizedString("error_while_decoding_JSON", comment: "")
        case .dataNotFound:
            return NSLocalizedString("no_data_received_from_server", comment: "")
        case .transportError(_):
            return NSLocalizedString("transport_error", comment: "")
        case .serverError(statusCode: let statusCode):
            return NSLocalizedString("server_error" + String(statusCode), comment: "")
        case .noData:
            return NSLocalizedString("no_data", comment: "")
        }
    }
}
