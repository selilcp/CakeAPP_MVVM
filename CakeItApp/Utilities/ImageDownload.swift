//
//  ImageDownload.swift
//  CakeItApp
//
//  Created by selil on 26/06/23.
//
import UIKit

extension UIImageView {
    func loadImageWithURL(_ url: URL) {
        DispatchQueue.global(qos: .background).async {
            let session = URLSession.shared
            let downloadTask = session.downloadTask(with: url, completionHandler: { [weak self] url, response, error in
                if error == nil,
                   let url = url,
                   let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            })
            downloadTask.resume()
        }
    }
}
