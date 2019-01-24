//
//  BaseViewController.swift
//  MovieAppChallenge
//
//  Created by Kumar,Sunil on 24/01/19.
//  Copyright © 2019 Kumar,Sunil. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var alertController = UIAlertController(title: "Loading", message: "Please wait...", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()

        let loadingIndicator = UIActivityIndicatorView(frame: alertController.view.bounds)
        loadingIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.white
        loadingIndicator.startAnimating();
        
        alertController.view.addSubview(loadingIndicator)
        loadingIndicator.startAnimating()
    }
    
    func showActivityIndicator()  {
        self.present(alertController, animated: true)
    }

    func hideActivityIndicator()  {
        self.alertController.dismiss(animated: true)
    }

}
