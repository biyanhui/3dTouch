//
//  ViewController.swift
//  PreviewAction
//
//  Created by 毕研辉 on 15/10/29.
//  Copyright © 2015年 biyanhui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // 列表
    @IBOutlet var tableView: UITableView!
    
    var allDataArray = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        // 加载数据
        loadData()
        
    }
    
    func loadData() {
        
        // 添加联系人
        let p1 = Person(name: "Tom", phone: "189 3138 8992", introduce: "我是一个好人啊我是一个好人啊我是一个好人啊我是一个好人啊")
        let p2 = Person(name: "Jone", phone: "189 3138 8992", introduce: "我是一好人啊我是一个好人啊")
        let p3 = Person(name: "Mimu", phone: "189 3138 8992", introduce: "我是啊我是一个好人啊我是一个好人啊")
        let p4 = Person(name: "NiuNiu", phone: "189 3138 8992", introduce: "我是一个好一个好人啊我是一个好人啊")
        let p5 = Person(name: "A M N", phone: "189 3138 8992", introduce: "好人啊我是一个好人啊我是一个好人啊")
        allDataArray.append(p1)
        allDataArray.append(p2)
        allDataArray.append(p3)
        allDataArray.append(p4)
        allDataArray.append(p5)
        
        // 刷新数据
        tableView.reloadData()
    }
    

    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 获取重用的cell
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        // 使用控制器调用方法，注册previewAction的代理和视图
        self.registerForPreviewingWithDelegate(self, sourceView: cell)
        
        // 显示数据
        let person = allDataArray[indexPath.row]
        cell.imageView?.image = UIImage(named: "dog")
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.phone
        
        // 返回cell
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UIViewControllerPreviewingDelegate {
    
    
    // 当我们重按显示出控制器之后，再加大力度去按，就会执行此方法，则直接推出控制器
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        // 直接推出控制器
        self.showViewController(viewControllerToCommit, sender: self)
    }
    
    
    // 重按执行此方法
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        // 创建新控制器（从Storyboard中根据标示符获取）
        let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("detailVC") as! DetailViewController
        // 注意：在这里设置新控制器的背景颜色，其实是破坏了控制器的声明周期。我们的目的是在未推出控制器的时候，便使控制器去加载Storyboard中的控件
        detailVC.view.backgroundColor = UIColor.cyanColor()
        
        // 获取模型
        let cell = previewingContext.sourceView as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)
        let person = allDataArray[(indexPath?.row)!]
        
        // 获取模型的数据并显示
        detailVC.imageView.image = UIImage(named: "dog")
        detailVC.nameLabel.text = person.name
        detailVC.phoneLabel.text = person.phone
        detailVC.introduceLabel.text = person.introduce
        
        // 返回重按显示的控制器
        return detailVC
    }
}





