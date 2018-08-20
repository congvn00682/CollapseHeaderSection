//
//  ViewController.swift
//  CollapseHeaderSection
//
//  Created by Yamate on 8/20/18.
//  Copyright © 2018 Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var students = DataServices.shared.students
    var className: [String] {
        get {
            return Array(students.keys)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return className.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (students[className[section]]?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = students[className[indexPath.section]]?[indexPath.row].firstName ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = SectionHeaderView.instanceFromNib
        sectionView.delegate = self
        sectionView.section = section
        sectionView.textLabel.text = className[section]
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

extension ViewController: UISectionHeaderViewDelegate {
    func didSelectedSection(at section: Int) {
        var indexPathsForCollapse: [IndexPath] = []
        let isCollapse = students[className[section]] != nil && students[className[section]]!.count > 0
        
        let displayStudents = isCollapse ? students[className[section]]! : DataServices.shared.students[className[section]]!
        
        for row in 0..<displayStudents.count {
            let indexPathWillCollapse = IndexPath(row: row, section: section)
            indexPathsForCollapse.append(indexPathWillCollapse)
        }
        
        isCollapse ? students[className[section]]?.removeAll() : (students[className[section]] = displayStudents)
        tableView.beginUpdates()
        isCollapse ? tableView.deleteRows(at: indexPathsForCollapse, with: .fade) : tableView.insertRows(at: indexPathsForCollapse, with: .fade)
        tableView.endUpdates()
    }
}
