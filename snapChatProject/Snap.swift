//
//  Snap.swift
//  snapChatProject
//
//  Created by Adhyyan Narang on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class Snap: NSObject {
    var name: String?
    var image: UIImage?
    var timeStamp: Timer?
    var readImage: UIImage
    var hasRead: Bool
    
    init(name: String, image: UIImage, timeStamp: Timer) {
        self.name = name
        self.image = image
        self.timeStamp = timeStamp
        self.readImage = #imageLiteral(resourceName: "unread")
        self.hasRead = false;
    }
}
