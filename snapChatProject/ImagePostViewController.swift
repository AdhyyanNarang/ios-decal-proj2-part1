//
//  ImagePostViewController.swift
//  snapChatProject
//
//  Created by Adhyyan Narang on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit



class ImagePostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    var selectedRow: Int = 0;
    var pickedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        let image: UIImage = #imageLiteral(resourceName: "goButton")
        goButton.setImage(image, for: .normal)
        selectedLabel.text = "Posting to " + threadNames[0]
        categoryTableView.delegate = self;
        categoryTableView.dataSource = self;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! PostTableViewCell
        cell.categoryNameLabel.text = threadNames[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.item;
        selectedLabel.text = "Posting to " + threadNames[selectedRow];
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    @IBAction func clickPost(_ sender: Any) {
        let dateObj = Date()
        let snapToAdd = Snap(name: "Adhyyan Narang", image: pickedImage!, timeStamp: dateObj)
        threads[threadNames[selectedRow]]!.append(snapToAdd)
        performSegue(withIdentifier: "postToImagePicker", sender: self)
        let notificationAlert = UIAlertController(title: "Snap Sent", message: "Your snap has been sent!", preferredStyle: UIAlertControllerStyle.alert)
        notificationAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(notificationAlert, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
