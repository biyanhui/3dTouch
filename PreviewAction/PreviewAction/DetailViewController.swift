//
//  DetailViewController.swift
//  PreviewAction
//
//  Created by 毕研辉 on 15/10/29.
//  Copyright © 2015年 biyanhui. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - 声明属性
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var introduceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyanColor()
        
    }


    // 重写方法，添加按钮
    override func previewActionItems() -> [UIPreviewActionItem] {
        
        // 创建UIPrewviewAction对象，一个代表一个事件
        // 默认的样式
        let defaultPreviewAction = UIPreviewAction(title: "默认", style: UIPreviewActionStyle.Default) { (previewAction, viewController) -> Void in
            print("默认")
        }
        
        // 选中的样式
        let selectedPreviewAction = UIPreviewAction(title: "选择", style: UIPreviewActionStyle.Selected) { (previewAction, viewController) -> Void in
            print("Selected")
        }
        
        // 破坏性的样式
        let destructivePreviewAction = UIPreviewAction(title: "破坏性", style: UIPreviewActionStyle.Destructive) { (previewAction, viewController) -> Void in
            print("Destructive")
        }
        
        // 把几个Action添加到数组中，并返回
        return [defaultPreviewAction, selectedPreviewAction, destructivePreviewAction]
    }
}
