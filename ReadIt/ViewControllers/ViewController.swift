//
//  ViewController.swift
//  ReadIt
//
//  Created by Shen-Chieh Yen on 1/3/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        request(subredditName: "valorant")
    }
    
    private func request(subredditName: String) {
        guard let url = URL(string: "https://www.reddit.com/r/\(subredditName).json?limit=5") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {
                      return
                  }
            
            if (200...299).contains(response.statusCode) {
                do {
                    let decoder = JSONDecoder()
                    let jsonResponse = try decoder.decode(SubredditResponse.self, from: data)
                    print(jsonResponse)
                }
                catch {
                    print("Error")
                }
            }
//            let responseString = String(data: data, encoding: .utf8)
//            print("responseString = \(String(describing: responseString))")
        }
        task.resume()
    }

}
