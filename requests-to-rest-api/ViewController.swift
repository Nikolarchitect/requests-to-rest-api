//
//  ViewController.swift
//  requests-to-rest-api
//
//  Created by Nikolay Kiyko on 10.10.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // Инициализация Search Controller
    private let searchController = UISearchController(searchResultsController: nil)
    
    // Инициализация таблицы с ячейками
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
    
    // Инициализация внешнего вида View Controller
    private func setupViews() {
        view.backgroundColor = .systemGray4

        // Дефолтная фраза в строке поиска
        searchController.searchBar.placeholder = "Enter the movie"
        navigationItem.searchController = searchController
        
        view.addSubview(tableView)
    }
    
    // Установка рамок / ограничений
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.left.right.equalToSuperview().inset(16)
        }
    }
}
