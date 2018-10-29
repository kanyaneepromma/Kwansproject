//
//  TableViewController.swift
//  Kwansproject
//
//  Created by Kanyanee P on 9/10/2561 BE.
//  Copyright © 2561 Kanyanee P. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    
    var contacts: [Contacts] = []
    
    var indexRow : Int! = nil
    
    var myData:NSArray = []
    var lasagna = "i love it"
    var test = "what"
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.tableView.delegate = self
        self.tableView.dataSource = self
        getJSON()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getJSON(){
        
        Alamofire.request("http://api.androidhive.info/contacts").responseJSON{ response in
            print(response)
            
            if response.response?.statusCode == 200{
                do{
                    
                    // let i = JSON(resData.data)
                    //print(i["contacts"][0]["email"].stringValue)
                    let decode = JSONDecoder()
                    let JsonData = try decode.decode(requestContacts.self, from: response.data!)
                    print(JsonData)
                    //let ii = requestContacts
                    self.contacts = JsonData.contacts //array contacts
                    self.tableView.reloadData()
                    
                }catch{
                    print(error)
                }
            }
            /*
             if response.result!= nil{
             let json = JSON(response.result.value!)
             let results = json["results"].arrayValue
             
             for result in results{
             // let names = Result["name"].stringValue
             // self.names.append(names)
             let ids = result["id"].stringValue
             let names = result["name"].stringValue
             let emails = result["email"].stringValue
             self.names.append(names)
             }
             }*/
            
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell
        

        // Configure the cell...
        cell.textLabel?.text = self.contacts[indexPath.row].name

        return cell
    }
    /*func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! TableViewCell

        cell.textLabel?.text = self.contacts[indexPath.row].name
        
       
        return cell
    }*/
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
