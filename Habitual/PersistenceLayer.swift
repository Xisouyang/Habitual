//
//  PersistenceLayer.swift
//  Habitual
//
//  Created by Stephen Ouyang on 11/30/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import Foundation

struct PersistenceLayer {
    
    /* set allows us to write to our array of habits
       private means only this file will see the habit variable
     */
    private(set) var habits: [Habit] = []
    
    
    /* This constant is created as a key in User Defaults to store our array of habits - User Defaults are used to store basic data types as long as the app is installed. We make it static because we only want one instance of the key regardless of instantiations.
     */
    private static let userDefaultHabitsKeyValue = "HABITS_ARRAY"
    
    
    /*
        Make Mutating because we want to be able to alter the habit data each time the function is called
     */
    private mutating func loadHabits() {
        
        //instantiate user defaults
        let userDefaults = UserDefaults.standard
        
        guard
            //grab array of habits from our user defaults for given key
            let habitData = userDefaults.data(forKey: PersistenceLayer.userDefaultHabitsKeyValue),
            
            //Decode the json data that it gives us into a swift Habit object
            let habits = try? JSONDecoder().decode([Habit].self, from: habitData)
            else {
                return
        }
        
        //populate our array of habits with our new Habit object
        self.habits = habits
    }
    
    //Not gonna use result of createNewHabit() directly, otherwise compiler will throw error
    @discardableResult
    
    mutating func createNewHabit(name: String, image: Habit.Images) -> Habit {
        let newHabit = Habit(title: name, image: image)
        self.habits.insert(newHabit, at: 0)
        
        self.saveHabits()
        return newHabit
    }
    
    //save
    private func saveHabits() {
        
        //try to encode array of habits
        guard let habitData = try? JSONEncoder().encode(self.habits) else {
            fatalError("could not encode list of habits")
        }
        
        //set JSON data inside User Defaults with given key
        let userDefaults = UserDefaults.standard
        userDefaults.set(habitData, forKey: PersistenceLayer.userDefaultHabitsKeyValue)
    }
    
    // delete habit
    mutating func delete(_ habitIndex: Int) {
        
        // Remove habit at the given index
        self.habits.remove(at: habitIndex)
        
        // Persist the changes we made to our habits array
        self.saveHabits()
    }
    
    // Mark Habit Complete
    mutating func markHabitAsCompleted(_ habitIndex: Int) -> Habit {
        
        //stores habit at a given index
        var updatedHabit = self.habits[habitIndex]
        
        /*
         Checks to see if habit has been completed
         If yes - return that habit
         If no - increment the number of completions for it by 1
         */
        print(updatedHabit.hasCompletedToday)
        guard updatedHabit.hasCompletedToday == false else {return updatedHabit}
        updatedHabit.numberOfCompletions += 1
        
        /* Checks to see if last completion date of habit was yesterday
         If yes - increment streak by 1
         If no - reset streak to 1
         */
        if let lastCompletionDate = updatedHabit.lastCompletionDate, lastCompletionDate.isYesterday {
            updatedHabit.currentStreak += 1
        } else {
            updatedHabit.currentStreak = 1
        }
        
        // update streak
        if updatedHabit.currentStreak > updatedHabit.bestStreak {
            updatedHabit.bestStreak = updatedHabit.currentStreak
        }
        
        // update last time habit was completed
        let now = Date()
        updatedHabit.lastCompletionDate = now
        
        // update habit to reflect changes
        self.habits[habitIndex] = updatedHabit
        self.saveHabits()
        
        return updatedHabit
    }
    
    mutating func swapHabits(habitIndex: Int, destinationIndex: Int) {
        let habitToSwap = self.habits[habitIndex]
        self.habits.remove(at: habitIndex)
        self.habits.insert(habitToSwap, at: destinationIndex)
        self.saveHabits()
    }
    
    mutating func setNeedsToReloadHabits() {
        self.loadHabits()
    }
    
    init() {
        self.loadHabits()
    }
}
