//
//  ViewController.swift
//  Kwansproject
//
//  Created by Kanyanee P on 8/10/2561 BE.
//  Copyright © 2561 Kanyanee P. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import AlamofireImage

class ViewController: UIViewController{
    var myData: NSArray = []
     var message: String=""

    @IBOutlet weak var Img: UIImageView!

    

    @IBOutlet weak var iLb: UILabel!
    
    let url = URL(string: "https://stepupandlive.files.wordpress.com/2014/09/3d-animated-frog-image.jpg")!
    //self.Img.kf.setImage(with: url)
   
    
    
    @IBAction func iButton2(_ sender: Any) {
    }
    
    
    @IBAction func iButton(_ sender: Any) {

        Alamofire.request("http://api.androidhive.info/contacts").responseData { (resData) -> Void in
            do{
                
                // let i = JSON(resData.data)
                //print(i["contacts"][0]["email"].stringValue)
                let decode = JSONDecoder()
                let JsonData = try decode.decode(requestContacts.self, from: resData.data!)
                print(JsonData)
                //let ii = requestContacts
                let i = Int(arc4random_uniform(UInt32(JsonData.contacts.count))+0)
                self.iLb.text = JsonData.contacts[i].email
                
                
            }catch{
                print(error)
            }
        }
        Alamofire.request("https://i.kym-cdn.com/photos/images/newsfeed/000/383/570/6eb.gif").responseImage { response in
            do{
            debugPrint(response)
            
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
                self.Img.image = image
                }
                
            }
            catch{
                print(error)
            }
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

