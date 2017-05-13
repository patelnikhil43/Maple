//
//  MenuManager.swift
//  Maple
//
//  Created by Nikhil on 2/12/17.
//  Copyright © 2017 Nikhil. All rights reserved.
//

import UIKit

class MenuManager: NSObject, UITableViewDataSource, UITableViewDelegate {

    //Black View that appears
    let blackView = UIView()
    
    //Table View of the Menu
    let menuTableView = UITableView()
    
    //Menu List
    let arrayOfSources = ["📱 Electronics", "📚 School Supplies"]
    
    //Gets Invoked from viewController after menu button is pressed.
    public func openMenu(){
        if let window = UIApplication.shared.keyWindow{
        
                blackView.frame = window.frame                         //equals the window frame
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)  //black background
            
            
            //Tap on the black screen to make it disappear calls -> dismissMenu()
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissMenu)))
            
            let heightOfTableView:CGFloat = 120
            let y = window.frame.height - heightOfTableView
            
            menuTableView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: heightOfTableView)
            
            window.addSubview(blackView)                               //Adding menu to the window
            window.addSubview(menuTableView)
            
            UIView.animate(withDuration: 0.4, animations: {            //Animation
                self.blackView.alpha = 1
                self.menuTableView.frame.origin.y = y            //Putting the Table view on the screen
            })
        }
    }
    
    //To make the menu disappear
    public func dismissMenu(){
        UIView.animate(withDuration: 0.5, animations: {
        self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
            self.menuTableView.frame.origin.y = window.frame.height
            }
        })
    }
    
    //Number of Section on the Table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in Section which returns array.count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSources.count
    }
    
    //The kind of Cell You want and the name on the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as UITableViewCell
        cell.textLabel?.text = arrayOfSources[indexPath.item]
        return cell
    }
    
    //Height of The row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //Making the tableView scrollable and bouncy
    override init(){
        super.init()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.isScrollEnabled = true
        menuTableView.bounces = true
        
        menuTableView.register(BaseViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
    }
    
}
