//
//  TopImageContainerViewController.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/05/24.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class TopImageContainerViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var mainImgPageController: UIPageControl!
    @IBOutlet weak var mainImgScroll: UIScrollView!
    
    var img: [String] = ["ad1","ad2","ad3","ad4","ad5","ad6"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImgPageController.numberOfPages = self.img.count
        for i in 0..<img.count{
            let imgView = UIImageView(image: UIImage(named: img[i]))
            
            frame.origin.x = imgView.frame.size.width * CGFloat(i)
            frame.size = imgView.frame.size
            imgView.contentMode = .scaleAspectFill
            self.mainImgScroll.addSubview(imgView)
            imgView.frame = frame
        }
        // Do any additional setup after loading the view.
        mainImgScroll.contentSize = CGSize(width: mainImgScroll.frame.size.width * CGFloat(img.count), height: mainImgScroll.frame.size.height)
        mainImgScroll.delegate = self
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        var pageNumber = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        if (scrollView.contentOffset.x > 1875){
            scrollView.contentOffset.x = 0
        }
        mainImgPageController.currentPage = pageNumber
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
