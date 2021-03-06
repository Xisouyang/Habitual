//
//  HabitTableViewCell.swift
//  Habitual
//
//  Created by Stephen Ouyang on 11/26/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelHabitTitle: UILabel!
    @IBOutlet weak var labelStreaks: UILabel!
    
    
    // Set the identifier for the custom cell
    static let identifier = "habit cell"
    
    // Returning the xib file after instantiating it
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    //function to update cell properties
    func configure(_ habit: Habit) {
        self.imageViewIcon.image = habit.selectedImage.image
        self.labelHabitTitle.text = habit.title
        self.labelStreaks.text = "streak: \(habit.currentStreak)"
        
        if habit.hasCompletedToday {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .disclosureIndicator
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
