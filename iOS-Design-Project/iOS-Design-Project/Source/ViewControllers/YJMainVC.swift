//
//  YJMainView.swift
//  iOS-Design-Project
//
//  Created by 이유진 on 2020/05/27.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit
import FSPagerView

class YJMainVC: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate {
    
    let imageNames = ["ad1","ad1","ad1","ad1","ad1","ad1"]
    var numberOfItems = 6
       
    @IBOutlet var searchbar: UISearchBar!
    @IBOutlet var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    @IBOutlet var pageControl: FSPageControl!{
        didSet {
            self.pageControl.numberOfPages = self.imageNames.count
            self.pageControl.contentHorizontalAlignment = .center
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavi()
        setSearchbar()
        setPager()
        // Do any additional setup after loading the view.
    }
    
    //배너 pager 설정
    private func setPager(){
        //페이지 컨트롤러 이미지 설정
        self.pageControl.setImage(UIImage(named: "stateCircle5"), for: .normal)
        self.pageControl.setImage(UIImage(named: "stateCircle6"), for: .selected)
        //배너의 이미지 무한하게 돌아가도록 설정(5페이지->1페이지)
        self.pagerView.isInfinite = true
    }
    
    private func setNavi(){
       
        
           //navigation bar title에 logo 이미지 넣기
           let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 109, height: 28))
           imageView.contentMode = .scaleAspectFit
           let image = UIImage(named: "logo")
           imageView.image = image
           navigationItem.titleView = imageView
           
           //navigation bar backgroun색 지정과 선 없애기
           self.navigationController?.navigationBar.backgroundColor = UIColor.init(displayP3Red: 244, green: 245, blue: 246, alpha: 1)
           self.navigationController?.navigationBar.shadowImage = UIImage()
       }

    //searchbar 설정
    private func setSearchbar(){
        //SearchBar textfield 뒷배경 이미지
        self.searchbar.setSearchFieldBackgroundImage(UIImage(named: "search"), for: UIControl.State.normal)
           
        // SearchBar 텍스트 크기 지정
        let textFieldInsideUISearchBar = searchbar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.font = textFieldInsideUISearchBar?.font?.withSize(12)

        // SearchBar placeholder 텍스트 색 지정
        let labelInsideUISearchBar = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        labelInsideUISearchBar?.textColor = UIColor.init(displayP3Red: 112, green: 112, blue: 112, alpha: 1)
           
        //SearchBar icon 설정
        searchbar.setImage(UIImage(named: "iconTopSearch"), for: .search, state: .normal)
           
    }

     func numberOfItems(in pagerView: FSPagerView) -> Int {
            return numberOfItems
        }
        
        func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
            cell.imageView?.image = UIImage(named: self.imageNames[index])
            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.clipsToBounds = true
            return cell
        }
        
        
        func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
            pagerView.deselectItem(at: index, animated: true)
            pagerView.scrollToItem(at: index, animated: true)
                }
        
        func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
            self.pageControl.currentPage = targetIndex
        }
        
        func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
               self.pageControl.currentPage = pagerView.currentIndex
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
