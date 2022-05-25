//
//  APICaller.swift
//  Stocks-And
//
//  Created by Andrey Kim on 26.05.2022.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private struct Constant {
        static let apiKey = ""
        static let sandboxApiKey = ""
        static let baseUrl = ""
    }
    
    private init() {}
    
    // MARK: - Public
    
    
    // MARK: - Private
    
    private enum Endpoint: String {
        case search
    }
    
    private enum APIError: Error {
        case noDataReturned
        case invalidAPI
    }
    
    private func url(for endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
        return nil
    }
    
    private func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(APIError.invalidAPI))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturned))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
