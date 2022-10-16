//
//  ViewController.swift
//  requests-to-rest-api
//
//  Created by Nikolay Kiyko on 10.10.2022.
//  Copyright ⓒ Nikolay Kiyko 2022. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let networkDataFetcher = NetworkDataFetcher()
    var searchResponse: CellWithFilmsViewModel? = nil
    private var timer: Timer?
    
    private let searchController = UISearchController(searchResultsController: nil)

    // Идентификатор таблицы
    let cellWithFilms = "cellWithFilms"
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
//        tableView.separatorColor =
        tableView.backgroundColor = .white
        tableView.rowHeight = 90
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupViews()
        setupConstraints()
    }
        
    private func setupViews() {
        view.backgroundColor = .systemGray4

        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Enter the movie"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellWithFilms)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.left.right.equalToSuperview().inset(16)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Поколдовать!!
        return searchResponse?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellWithFilms, for: indexPath)
        let film = searchResponse?.results[indexPath.row]
        cell.textLabel?.text = film?.title
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // Прямая ссылка на REST API
        let urlString = "https://imdb-api.com/API/Search/k_1wey9sae/\(searchText)"

        // Реализация таймера / задержки при вводе поискового запроса
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false, block: { _ in
            self.networkDataFetcher.fetchFilms(urlString: urlString) { [weak self] searchResponse in
                guard let searchResponse = searchResponse else { return }
                self?.searchResponse = searchResponse
                self?.tableView.reloadData()
            }
        })
    }
}
