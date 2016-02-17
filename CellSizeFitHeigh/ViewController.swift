//
//  ViewController.swift
//  CellSizeFitHeigh
//
//  Created by Duc Nguyen on 2/16/16.
//  Copyright © 2016 ND NINJA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var myTableView: UITableView!
	let estimatedRowHeight = CGFloat(50)
	let datas = [
		MyObject(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", image: "obama"),
		MyObject(content: "when an unknown printer took a galley of type and scrambled it to make a type specimen book.", image: "obama"),
		MyObject(content: "Lorem Ipsum is simply dummy text of.", image: ""),
		MyObject(content: "Lorem Ipsum is simply dummy text of.", image: "")
	]
	override func viewDidLoad() {
		super.viewDidLoad()
		loadTableView()
	}
	
	func loadTableView() {
		
		self.myTableView.registerNib(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
		self.myTableView.estimatedRowHeight = estimatedRowHeight
		self.myTableView.rowHeight = UITableViewAutomaticDimension
		self.myTableView.delegate = self
		self.myTableView.dataSource = self
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return datas.count
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		// return rowSelected == indexPath.row ? UITableViewAutomaticDimension : estimatedRowHeight
		return UITableViewAutomaticDimension
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyCell
		cell.setData(datas[indexPath.row])
        if((indexPath.row % 2) > 0) {
            cell.imageHeightConstraint.constant = 0
        }
		return cell
	}
	
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
	}
}
class MyObject {
	var image: String?
	var content: String?
	
	init(content: String, image: String) {
		self.image = image
		self.content = content
	}
}