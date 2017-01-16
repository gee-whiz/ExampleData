//
//  ViewController.swift
//  ExampleData
//
//  Created by George Kapoya on 2017/01/16.
//  Copyright © 2017 immedia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

       ExampleClient.getNewsFeedWithFirstId(page: "0", limit: "20")  {(news) in



	}


	} 

}

