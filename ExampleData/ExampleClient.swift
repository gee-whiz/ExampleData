//
//  ExampleClient.swift
//  ExampleData
//
//  Created by George Kapoya on 2017/01/16.
//  Copyright © 2017 immedia. All rights reserved.
//

import Foundation
import Alamofire



typealias JSONStantard = [String: AnyObject]


  var dateFromString: Date?
public class ExampleClient {
		public static func getNewsFeedWithFirstId(page: String ,limit: String, completion: @escaping ([News]?) -> Void) {
			Alamofire.request(FabrikAPIBaseURL+TenantId+"/news" , method: .get, parameters: ["page": page,"limit":limit], encoding: URLEncoding.default, headers: nil).validate()
				 .responseJSON(completionHandler: { (response) -> Void in
					do {
						let responseJSON = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! JSONStantard
						var news = [News]()
						if let result = responseJSON["result"] as? [JSONStantard] {
							for  i in 0..<result.count {
								let item = result[i]
								let newsTitle = item["title"] as! String
								let newsId = item["id"] as! Int
								let newsDescription = item["description"] as! String
								let newsUrl = item["url"] as! String
								let newsImageUrl = item["imageUrl"] as! String
								let dateString = item["createdAt"] as! String
								news.append(News(newsId: newsId, newsTitle: newsTitle, newsDescription: newsDescription, newscreatedAt: dateString, newsImageUrl: newsImageUrl, newsUrl: newsUrl))
							}
							print("hooray ", news)
					   completion(news)
						}

					}catch{
						print(error)
					}
			 })
	  }

}
