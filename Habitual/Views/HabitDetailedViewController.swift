//
//  HabitDetailedViewController.swift
//  Habitual
//
//  Created by Stephen Ouyang on 12/5/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import UIKit

class HabitDetailedViewController: UIViewController {
    
    private var persistance = PersistenceLayer()
    
    @IBOutlet weak var stackTitles: UIStackView!
    @IBOutlet weak var stackValues: UIStackView!
    @IBOutlet weak var streakStack: UIStackView!
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelCurrentStreak: UILabel!
    @IBOutlet weak var labelTotalCompletions: UILabel!
    @IBOutlet weak var labelBestStreak: UILabel!
    @IBOutlet weak var labelStartingDate: UILabel!
    @IBOutlet weak var buttonAction: UIButton!
    
    @IBAction func pressActionButton(_ sender: Any) {
        // Line 1
        habit = persistance.markHabitAsCompleted(habitIndex)
        
        // Line 2
        updateUI()
    }
    
    var habit: Habit!
    var habitIndex: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
        stackTitleConstraints()
        imageConstraint()
        buttonConstraint()
        streakStackConstraint()
    }
    
    private func updateUI() {
        print("here")
        title = habit.title
        imageViewIcon.image = habit.selectedImage.image
        labelCurrentStreak.text = "\(habit.currentStreak) days"
        labelTotalCompletions.text = String(habit.numberOfCompletions)
        labelBestStreak.text = String(habit.bestStreak)
        labelStartingDate.text = habit.dateCreated.stringValue
        if habit.hasCompletedToday {
            print("BOO")
            buttonAction.setTitle("Completed for today", for: .normal)
        } else {
            buttonAction.setTitle("Mark as Completed", for: .normal)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension HabitDetailedViewController {
    
    func stackTitleConstraints() {
        
        stackTitles.translatesAutoresizingMaskIntoConstraints = false
        stackTitles.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120).isActive = true
        stackTitles.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
    }
    
    func imageConstraint() {
        
        imageViewIcon.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageViewIcon.heightAnchor.constraint(equalTo: imageViewIcon.widthAnchor, multiplier: 1).isActive = true
        
        imageViewIcon.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        imageViewIcon.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -180).isActive = true
    }
    
    func buttonConstraint() {
        buttonAction.translatesAutoresizingMaskIntoConstraints = false
        
        buttonAction.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        buttonAction.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        buttonAction.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -15).isActive = true
        buttonAction.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func streakStackConstraint() {
        
        streakStack.translatesAutoresizingMaskIntoConstraints = false
        streakStack.centerYAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.centerYAnchor, multiplier: 1).isActive = true
        streakStack.centerXAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.centerXAnchor, multiplier: 1).isActive = true
    }
}
