//
//  Extensions.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func downloadFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }

    func downloadFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit, completion: @escaping () -> Void) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
                completion()
            }
            }.resume()
    }
    
    func downloadFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit, completion: @escaping () -> Void) {
        guard let url = URL(string: link) else { return }
        downloadFrom(url: url) {
            completion()
        }
       
    }
    
}

extension String{
    func UTCToLocal() -> String {
        let calendar = Calendar.current
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let localDate = formatter.date(from: self)
        
        let m = calendar.component(.month, from: localDate!)
        let month = DateFormatter().monthSymbols[m - 1]
        let day = calendar.component(.day, from: localDate!)
        print(month + " " + String(day))
        return month + " " + String(day)
       
    }
    func UTCToLocalAndYear() -> String {
        let calendar = Calendar.current
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let localDate = formatter.date(from: self)
        
        let m = calendar.component(.month, from: localDate!)
        let month = DateFormatter().monthSymbols[m - 1]
        let day = calendar.component(.day, from: localDate!)
        let year = calendar.component(.year, from: localDate!)
        print(month + " " + String(day))
        return month + " " + String(day) + ", " + String(year)
       
    }
}


extension UIViewController {
    
}
