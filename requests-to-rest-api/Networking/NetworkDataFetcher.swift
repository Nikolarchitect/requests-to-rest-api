//
//  NetworkDataFetcher.swift
//  requests-to-rest-api
//
//  Created by Nikolay Kiyko on 16.10.2022.
//  Copyright ⓒ Nikolay Kiyko 2022. All rights reserved.
//

import UIKit

class NetworkDataFetcher {
    
    // Объект класса NetworkService
    let networkService = NetworkService()
    
    // Парсинг JSON
    func fetchFilms(urlString: String, response: @escaping (CellWithFilmsViewModel?) -> Void) {
        networkService.request(urlString: urlString) { result in
            switch result {
            case .success(let data):
                // JSON парсится через do / catch
                do {
                    let films = try JSONDecoder().decode(CellWithFilmsViewModel.self, from: data)
                    response(films)
                } catch let jsonError{
                    print("JSON decoding failed", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error received requesting data:, \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
