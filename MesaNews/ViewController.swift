//
//  ViewController.swift
//  MesaNews
//
//  Created by Fernando Carneiro on 08/04/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    var viewModel = NewsListViewModel()
    
    private lazy var loginStackView: LoginStackView = {
        let v = LoginStackView(fontSize: 22)
        v.isUserInteractionEnabled = true
        v.isMultipleTouchEnabled = true
        return v
    }()
    
    private lazy var loginImageView: LoginImageView = {
        let v = LoginImageView()
        return v
    }()
    
    private lazy var blur: UIView = {
        let v = UIView()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        v.addSubview(blurEffectView)
        return v
    }()
    
    private lazy var headerView: HeaderView = {
        let v = HeaderView(fontSize: 32)
        return v
    }()
    
    private lazy var tableView: UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tableFooterView = UIView()
        v.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
        v.delegate = self
        v.dataSource = self
        v.isUserInteractionEnabled = false
        
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchNews()
        
    }
    
    func setupView(){
        view.backgroundColor = .white
        view.addSubview(headerView)
        view.addSubview(tableView)
        view.addSubview(blur)
        view.addSubview(loginImageView)
        view.addSubview(loginStackView)
        
        
        setupConstraints()
        
    }
    
    //MARK:-Constraints
    
    func setupConstraints() {
        //Header
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        //TableView
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        //LoginStackView
        NSLayoutConstraint.activate([
            loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            loginStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 200),
            loginStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 250),
        ])
        
    }
    
    func fetchNews (){
        viewModel.getNews { (_) in
            self.tableView.reloadData()
        }
    }
}



//MARK:- TableView extension to conform protocol (CollectionView will be here too)
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
        let news = viewModel.newsVM[indexPath.row]
        cell?.newsVM = news
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.newsVM[indexPath.row]
        guard let url = URL(string: news.url) else { return }
        
        let config = SFSafariViewController.Configuration()
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.modalPresentationStyle = .fullScreen
        present(safariViewController, animated: true)
        
    }
}
