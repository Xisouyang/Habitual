//
//  MainViewController.swift
//  Habitual
//
//  Created by Stephen Ouyang on 11/22/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    
    private var persistance = PersistanceLayer()
    
    // return the number of rows for the given section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistance.habits.count
    }
    
    // return the UITableViewCell for the given indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //creating cells of type HabitsTableViewCell
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HabitTableViewCell.identifier,
            for: indexPath
        ) as! HabitTableViewCell
        
        //configures the newly created cell to have a specific habit
        let habit = persistance.habits[indexPath.row]
        cell.configure(habit)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //allows for the tableview to load in the screen
        tableView.register(HabitTableViewCell.nib,
                           forCellReuseIdentifier: HabitTableViewCell.identifier)

        // Do any additional setup after loading the view.
        setupNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //load new habits
        persistance.setNeedsToReloadHabits()
        
        //reload tableView
        tableView.reloadData()
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

extension HabitsTableViewController {
    
    //adds navbar to tableview
    func setupNavBar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = self.editButtonItem

    }
    
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
        print("Clicked")
        
        //create instance of our AddHabitViewController
        let addHabitVC = AddHabitViewController.instantiate()

        //embed AddHabitViewController to the navigation controller
        let navigationController = UINavigationController(rootViewController: addHabitVC)

        //present
        present(navigationController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedHabit = persistance.habits[indexPath.row]
        let habitDetailedVc = HabitDetailedViewController.instantiate()
        habitDetailedVc.habit = selectedHabit
        habitDetailedVc.habitIndex = indexPath.row
        navigationController?.pushViewController(habitDetailedVc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let habitToDelete = persistance.habits[indexPath.row]
            let habitIndexToDelete = indexPath.row
            
            // handling the delete action
            let deleteAlert = UIAlertController(habitTitle: habitToDelete.title) {
                self.persistance.delete(habitIndexToDelete)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            self.present(deleteAlert, animated: true)
            
        default:
            break
        }
    }
}
