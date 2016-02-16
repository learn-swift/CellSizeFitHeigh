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
	let data = [
		"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
		"remaining ",
		"scrambled scrambled",
		"It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
		"remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
		"remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset ",
		"remaining essentially unchanged. "
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
		return data.count
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		// return rowSelected == indexPath.row ? UITableViewAutomaticDimension : estimatedRowHeight
		return UITableViewAutomaticDimension
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyCell
		cell.labelContent.text = data[indexPath.row]
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
	}
}
