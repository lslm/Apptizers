//
//  NetworkManager.swift
//  Apptizers
//
//  Created by Lucas Santos on 23/09/23.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
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

    func downloadImage(from URLString: String, _ completed: @escaping (UIImage?) -> Void)  {
        let cacheKey = NSString(string: URLString)

        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }

        guard let url = URL(string: URLString) else {
            completed(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: NSString(string: URLString))
            completed(image)
        }

        task.resume()
    }
}
