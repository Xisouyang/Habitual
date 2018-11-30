//
//  MainViewController.swift
//  Habitual
//
//  Created by Stephen Ouyang on 11/22/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    
    
    //creating array for Habits
    var Habits: [Habit] = [
        Habit(title: "Go to bed at 2am after partying", image: Habit.Images.book),
        Habit(title: "Don't drink any water", image: Habit.Images.book),
        Habit(title: "Always laze around", image: Habit.Images.book),
        Habit(title: "Just be a potato", image: Habit.Images.book),
    ]
    
    // return the number of rows for the given section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Habits.count
    }
    
    // return the UITableViewCell for the given indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        var cell: UITableViewCell
//
//        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
//            cell = dequeueCell
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        }
//        let habitName = Habits[indexPath.row]
//        cell.textLabel?.text = habitName.title
//        return cell
        
        //creating cells of type HabitsTableViewCell
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HabitTableViewCell.identifier,
            for: indexPath
        ) as! HabitTableViewCell
        
        //configures the newly created cell to have a specific habit
        let habit = Habits[indexPath.row]
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
    }
 
    
    //inserts "hello world" cell to the top of the tableview
//    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
//        print("hi")
//        instructorArr.insert("Hello, World!", at: 0)
//        let topIndexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [topIndexPath], with: .automatic)
//    }
    
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
        print("Clicked")
    }
}
