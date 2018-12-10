//
//  ViewController.swift
//  ProjectStructure
//
//  Created by vamshi on 06/12/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    var myModelArray = [Result]()
    
    var spinner = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()

        spinner.frame = CGRect(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2, width: 30, height: 30)
        hitApi()
    }
    func hitApi(){
        
        self.spinner.startAnimating()
        APIManager.fetchData(_success: { (response) in
            for item in (response.feed?.results)!{
                self.myModelArray.append(item)
            }
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.spinner.hidesWhenStopped = true
                self.myTableView.reloadData()
            }
        }) { (error) in
            self.spinner.stopAnimating()
            self.spinner.hidesWhenStopped = true
            print("error")
        }
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItunesTableViewCell", for: indexPath) as! ItunesTableViewCell
        
        cell.configureCell(with: myModelArray[indexPath.row])
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dvc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        dvc.data = myModelArray[indexPath.row]
        self.navigationController?.pushViewController(dvc, animated: true)
        
    }
    
}
