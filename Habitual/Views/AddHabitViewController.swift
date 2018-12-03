//
//  AddHabitViewController.swift
//  Habitual
//
//  Created by Stephen Ouyang on 12/2/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import UIKit

class AddHabitViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewObj: UICollectionView!
    @IBOutlet weak var pickPhotoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewObj.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        addCVConstraints()
        addButtonConstraints()
        

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewObj.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
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

extension AddHabitViewController {
    
    func addCVConstraints() {
        
        collectionViewObj.translatesAutoresizingMaskIntoConstraints = false
        collectionViewObj.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        collectionViewObj.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
//        collectionViewObj.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
//        collectionViewObj.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 15).isActive = true
        collectionViewObj.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.85).isActive = true
        collectionViewObj.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -15).isActive = true
    }
    
    func addButtonConstraints() {
        
        pickPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        pickPhotoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        pickPhotoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        pickPhotoButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -15).isActive = true
        pickPhotoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
