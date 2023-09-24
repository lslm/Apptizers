//
//  NetworkManager.swift
//  Apptizers
//
//  Created by Lucas Santos on 23/09/23.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static private let baseURL = "https://seanallen-course-backend.herokuapp.com"
    private let apptizerURL = baseURL + "/swiftui-fundamentals/appetizers"
    
    private init() {}
    
    func getApptizers(completed: @escaping (Result<[Apptizer], APError>) -> Void) {
        guard let url = URL(string: apptizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ApptizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
