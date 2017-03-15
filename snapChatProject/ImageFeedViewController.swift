//
//  ImageFeedViewController.swift
//  snapChatProject
//
//  Created by Adhyyan Narang on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var SnapTable: UITableView!
    var selectedSnap: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SnapTable.delegate = self
        SnapTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        SnapTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads[threadNames[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "snapCell", for: indexPath) as! SnapTableViewCell
        let sectionNumber = indexPath.section
        let rowNumber = indexPath.row
        let requiredSnap = threads[threadNames[sectionNumber]]![rowNumber]
        cell.nameLabel.text = requiredSnap.name
        cell.readImage.image = requiredSnap.readImage
        let minutes = -(requiredSnap.timeStamp?.timeIntervalSinceNow)!/60
        cell.timeLabel.text = String(Int(round(minutes))) + " minutes ago"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionNumber = indexPath.section
        let rowNumber = indexPath.row
        if threads[threadNames[sectionNumber]]![rowNumber].hasRead == false {
            let requiredSnap = threads[threadNames[sectionNumber]]![rowNumber]
            threads[threadNames[sectionNumber]]![rowNumber].readImage = #imageLiteral(resourceName: "read")
            threads[threadNames[sectionNumber]]![rowNumber].hasRead = true
            let cell = tableView.dequeueReusableCell(withIdentifier: "snapCell", for: indexPath) as! SnapTableViewCell
            cell.readImage.image = requiredSnap.readImage
            selectedSnap = requiredSnap.image
            performSegue(withIdentifier: "feedToSnap", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "feedToSnap" {
            if let destinationVC = segue.destination as? SnapSeeViewController{
                destinationVC.imageShow = selectedSnap
            }
        }
    }
    
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
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
