//
//  UIImage+Ext.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import UIKit

extension UIImageView {
    func loadImage(at path: String, placeHolder: UIImage? = nil) {
        
        self.image = placeHolder
        let imageServerUrl = Constants.getImagesUrlBase + path
        let urlComponents = URLComponents(string: imageServerUrl)
        
        if let url = urlComponents?.url {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error != nil {
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
