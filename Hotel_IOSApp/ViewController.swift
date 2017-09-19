//
//  ViewController.swift
//  Hotel_IOSApp
//
//  Created by Ayşe on 14.09.2017.
//  Copyright © 2017 Ayşe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableview: UITableView!
    var baslik = [String]()
    var resim = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlString = "http://www.bucayapimarket.com/json.php"
        let url = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print(error!)
            }
            else
            {
                do
                {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSArray
                    
                    if let jsonDic = json
                    {
                        for i in 0..<jsonDic.count
                        {
                            if let basliklar = jsonDic[i] as? NSDictionary
                            {
                                if let baslikArray = basliklar["baslik"] as? NSString
                                {
                                    self.baslik.append(baslikArray as String)
                                }
                            }
                        }
                        print(self.baslik)
                    }
                    self.tableview.reloadData()
                }
                    
                catch
                {
                    print(error)
                }
            }
        }
        
        
        task.resume()
    }
    
    
    // tableView Methodları
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baslik.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
        cell.InfoLabel.text = baslik[indexPath.row]
//        cell.InfoImage.image = resim[UIImage]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}



