//
//  HabitImageCollectionViewCell.swift
//  Habitual
//
//  Created by Stephen Ouyang on 12/2/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import UIKit

class HabitImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var habitImage: UIImageView!
    
    // all image cells want to be identified w/ this variable
    static let identifier = "habit image cell"
    
    // allow nib file to be accessed
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    // sets specific image to be used in methods in the AddHabitVC class
    func setImage(image: UIImage) {
        
        habitImageConstraints()
        self.habitImage.image = image
    }
}

extension HabitImageCollectionViewCell {
    
    func habitImageConstraints() {
        
        habitImage.translatesAutoresizingMaskIntoConstraints = false

        habitImage.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        habitImage.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
    }
}
