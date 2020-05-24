//
//  CategoryViewController.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/05/24.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController ,UIScrollViewDelegate{
    @IBOutlet weak var CategoryPageController: UIPageControl!
    @IBOutlet weak var CategoryScrollView: UIScrollView!
    var viewName:[String] = ["category_1","category_2"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryPageController.numberOfPages = self.viewName.count
        frame.size = CategoryScrollView.frame.size
        
        for i in 0..<viewName.count{
            frame.origin.x = CategoryScrollView.frame.width * CGFloat(i)
        }

        CategoryScrollView.delegate=self
        // Do any additional setup after loading the view.
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        <#code#>
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
