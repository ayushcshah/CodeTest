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
    case decodingError(Error)
    case encodingError(Error)
    case apiError(message: String)
}
