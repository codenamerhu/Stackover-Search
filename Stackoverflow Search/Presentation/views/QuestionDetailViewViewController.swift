//
//  QuestionDetailViewViewController.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/14.
//

import UIKit
import WebKit
class QuestionDetailViewViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var reputationLabel: UILabel!
    @IBOutlet weak var askedTimeLabel: UILabel!
    
    @IBOutlet weak var tagsUIView: UIView!
    
    var webView: WKWebView!
    var question: Items?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        statusBarColorChange (view: view, color: customBlue!, textTheme: "light")
        self.navigationController?.navigationBar.backgroundColor = customBlue
        
        connectData()
        
        tagsUIView.layer.borderWidth = 1
        tagsUIView.layer.borderColor = UIColor.lightGray.cgColor
        setupWebView()
    }
    
    func connectData() {
        titleLabel.text = question?.title
        
        if let tags = question?.tags {
            var tagString = ""
            for tag in tags {
                tagString.append(tag + ", ")
            }
            
            tagsLabel.text = String(tagString.dropLast(2))
        }
        
        username.text = question?.owner?.display_name
        if let imageUrl = question?.owner?.profile_image {
            userProfileImage.load(url: URL(string: imageUrl)!)
        }
        
        if let reputation = question?.owner?.reputation {
            reputationLabel.text = String(reputation)
        }
        
        if let creationDate = question?.creation_date {
            print(creationDate)
            let date = Date(timeIntervalSince1970: (TimeInterval(creationDate / 1000) ))
            let calendar = Calendar.current

            
            let minutes = calendar.component(.minute, from: date)
            let hour = calendar.component(.hour, from: date)
            let day = calendar.component(.day, from: date)
            let month = calendar.component(.month, from: date)
            let year = calendar.component(.year, from: date)
            
            print( "asked \(day) \(month) \(year) at \(hour):\(minutes)")
            askedTimeLabel.text = "asked \(day) \(month) \(year) at \(hour):\(minutes)"
        }
    }
    
    func setupWebView() {
        
        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: bodyView.bounds, configuration: config)
        webView.uiDelegate = self
        
        bodyView.addSubview(webView)
        
        if let bodyString = question?.body {
            webView.loadHTMLString(bodyString, baseURL: nil)
        }
    }

}




