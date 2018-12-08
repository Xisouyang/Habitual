//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Stephen Ouyang on 12/3/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {
    
    
    @IBOutlet weak var createHabitButton: UIButton!
    @IBOutlet weak var habitImageView: UIImageView!
    @IBOutlet weak var habitNameInputField: UITextField!
    
    var habitImage: Habit.Images!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
        addButtonConstraints()
        textFieldConstraint()
    }
    
    private func updateUI() {
        title = "New Habit"
        habitImageView.image = habitImage.image
    }
    
    @IBAction func createHabitButtonPressed(_ sender: Any) {
        var persistenceLayer = PersistenceLayer()
        guard let habitText = habitNameInputField.text else { return }
        persistenceLayer.createNewHabit(name: habitText, image: habitImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
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

extension ConfirmHabitViewController {
    
    func imageConstraint() {
//        habitImageView.translatesAutoresizingMaskIntoConstraints = false
//
//        habitImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        habitImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//
//        let width = NSLayoutConstraint(item: self.habitImageView, attribute: .width, relatedBy: .equal, toItem: self.habitImageView, attribute: .height, multiplier: 1, constant: 0)
//        let height = NSLayoutConstraint(item: self.habitImageView, attribute: .height, relatedBy: .equal, toItem: self.habitImageView, attribute: .width, multiplier: 1, constant: 0)
//
//        NSLayoutConstraint.activate([width, height])
       
    }
    
    func addButtonConstraints() {

        createHabitButton.translatesAutoresizingMaskIntoConstraints = false
        
        createHabitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        createHabitButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        createHabitButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -15).isActive = true
        createHabitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func textFieldConstraint() {
        
        habitNameInputField.translatesAutoresizingMaskIntoConstraints = false
        
        habitNameInputField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        habitNameInputField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 20).isActive = true
        habitNameInputField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
    }
}
    

