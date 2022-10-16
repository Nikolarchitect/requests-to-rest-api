//
//  NetworkService.swift
//  requests-to-rest-api
//
//  Created by Nikolay Kiyko on 16.10.2022.
//  Copyright ⓒ Nikolay Kiyko 2022. All rights reserved.
//

import UIKit

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        // Запрос данных у REST API
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Подгрузка данных в асинхронном потоке
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        task.resume()
    }
}
