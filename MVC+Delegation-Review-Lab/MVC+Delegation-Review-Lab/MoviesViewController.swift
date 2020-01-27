//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, fontSizeDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentFontSize1 = CGFloat(20) {
        didSet{
            tableView.reloadData()
        }
    }
    
    var movies = [Movie](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        loadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let editingViewController = segue.destination as? EditingViewController else{
                fatalError("could not segue properly")
            }
            editingViewController.currentFontSize = currentFontSize1
        editingViewController.delegate = self
    }
    
    func changedFontSize(_ size: CGFloat) {
        self.currentFontSize1 = size
    }
    
    func loadData() {
        movies = Movie.allMovies
    }
}

extension MoviesViewController: UITableViewDelegate {
    
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") else {
            fatalError("")
        }
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        cell.textLabel?.font = UIFont.systemFont(ofSize: currentFontSize1)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: currentFontSize1)
        return cell
    }
    
    
}

