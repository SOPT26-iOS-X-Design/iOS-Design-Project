//
//  YJHomeVC.swift
//  iOS-Design-Project
//
//  Created by 이유진 on 2020/05/27.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit
import FSPagerView

class YJHomeVC: UIViewController {

    @IBOutlet var HomeSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavi()
        setSearchbar()
        // Do any additional setup after loading the view.
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
        self.HomeSearchBar.setSearchFieldBackgroundImage(UIImage(named: "search"), for: UIControl.State.normal)
           
        // SearchBar 텍스트 크기 지정
        let textFieldInsideUISearchBar = HomeSearchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.font = textFieldInsideUISearchBar?.font?.withSize(12)

        // SearchBar placeholder 텍스트 색 지정
        let labelInsideUISearchBar = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        labelInsideUISearchBar?.textColor = UIColor.init(displayP3Red: 112, green: 112, blue: 112, alpha: 1)
           
        //SearchBar icon 설정
        HomeSearchBar.setImage(UIImage(named: "iconTopSearch"), for: .search, state: .normal)

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
