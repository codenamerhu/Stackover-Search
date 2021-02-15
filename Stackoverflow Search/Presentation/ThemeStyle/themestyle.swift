//
//  themestyle.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/15.
//

import Foundation
import UIKit

func statusBarColorChange (view: UIView, color: UIColor, textTheme: String) {
    let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
    statusBarView.backgroundColor = color
    
    view.addSubview(statusBarView)
}
