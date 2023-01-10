//
//  ViewController.swift
//  UITableView
//
//  Created by Marina Karpova on 10.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myTableView = UITableView()
    let identifire = "MyCell"
    var myArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTable()
        
    }

    func createTable() {
        myTableView = UITableView(frame: view.bounds, style: .insetGrouped)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(myTableView)
    }
    
    
    //MARK: - dataSource
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return 3
//        case 1:
//            return 5
//        case 2:
//            return 8
//        default:
//            break
//        }
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
//        cell.textLabel?.text = "section = \(indexPath.section) cell = \(indexPath.row)"
        cell.accessoryType = .detailButton
        
        let numberOfRow = myArray[indexPath.row]
        cell.textLabel?.text = numberOfRow
        
//        switch indexPath.section {
//        case 0:
//            cell.backgroundColor = .green
//        case 1:
//            cell.backgroundColor = .orange
//        case 2:
//            cell.backgroundColor = .red
//        default:
//            break
//        }
        
        return cell
    }
    
    //MARK: - delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("AcsessoryPath = ", indexPath)
        
        let ownerCell = tableView.cellForRow(at: indexPath)
        print("Cell title = ", ownerCell?.textLabel?.text ?? "nil")
    }


}

