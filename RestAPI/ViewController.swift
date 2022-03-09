//
//  ViewController.swift
//  RestAPI
//
//  Created by Gevorg Hovhannisyan on 06.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func getTopped(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, respons, error) in
            if let respons = respons {
                print(respons)
            }
            
            guard data == data else { return }
            print(data as Any)
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                
                print(error)
            }
            
        } .resume()
    }
    
    @IBAction func postTopped(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let parameters = ["username": "Gevor", "massage": "Hello Jack!"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue( "application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, respons, error) in
            if let respons = respons {
                print(respons)
            }
            guard let data = data else { return }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }catch {
                print(error)
            }
        }.resume()
    }
}

