//
//  YJHomeVC.swift
//  iOS-Design-Project
//
//  Created by 이유진 on 2020/05/27.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit
import FSPagerView

class YJHomeVC: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet var collection: UICollectionView!
    private var products: [ProductInfo] = []
    let username = "곽민주"
    let imageNames = ["ad1","ad1","ad1","ad1","ad1","ad1"]
    let product = ["고구마","마스크","선풍기","운동화","건조기","고등어","마스크","카메라","면도기","닌텐도"]
    let cateimgs = ["iconFashion","iconBeauty","iconSport","iconCook","iconBook","iconTicket","iconOffice","iconSupply","iconHealth","iconDigital"]
    var numberOfItems = 6
    var numberOfnumbers = 10
    var index = 0
    
    @IBOutlet var cateUIView: UIView!
    @IBOutlet var cateView: FSPagerView!{
        didSet{
            self.cateView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell4")
        }
    }
    @IBOutlet var catePageControl: FSPageControl!{
        didSet {
            self.catePageControl.numberOfPages = 2
            self.catePageControl.contentHorizontalAlignment = .center
            self.catePageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    @IBOutlet var cate1: [UIButton]!
    @IBOutlet var user: UILabel!
    @IBOutlet var HomeSearchBar: UISearchBar!
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
    @IBOutlet var numView: FSPagerView!{
        didSet {
            self.numView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell2")
        }
    }
    @IBOutlet var productView: FSPagerView!{
        didSet {
            self.productView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell3")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.text = username + "님의 추천상품"
        
        //넘겨지는 페이지 아이콘 이미지 설정
        self.pageControl.setImage(UIImage(named: "stateCircle5"), for: .normal)
        self.pageControl.setImage(UIImage(named: "stateCircle6"), for: .selected)
        
        self.catePageControl.setImage(UIImage(named: "secondstateCircle"), for: .normal)
        self.catePageControl.setImage(UIImage(named: "secondstateBar"), for: .selected)
        
        setNavi()
        setPager()
        setSearchbar()
        setproductinfo()
        // Do any additional setup after loading the view.
    }
    
    //홈 배너의 페이지 뷰 설정
    private func setPager(){
        //페이지 무한대로 넘어감 (마지막 페이지 -> 첫번째 페이지)
        self.pagerView.isInfinite = true

        //*******
        self.numView.isInfinite = true
        self.numView.scrollDirection = .vertical
        self.numView.automaticSlidingInterval = 3.0
        
        self.productView.isInfinite = true
        self.productView.scrollDirection = .vertical
        self.productView.automaticSlidingInterval = 3.0
        
    }
    
    //navigation bar 설정
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

    
    //배너 광고사진 개수
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        if pagerView == self.pagerView{
            return numberOfItems
        }
        else if pagerView == self.cateView{
            return 2
       }
        else{
            return numberOfnumbers
        }
    }
    
    //배너 광고사진 뷰
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if pagerView == self.pagerView{
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
            cell.imageView?.image = UIImage(named: self.imageNames[index])
            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.clipsToBounds = true
            return cell
        }
        else if pagerView == self.numView{
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell2", at: index)
            cell.textLabel?.superview?.backgroundColor = .white
            cell.textLabel?.text = String(index+1)
            cell.textLabel?.backgroundColor = .white
            if index < 3{
                cell.textLabel?.textColor = UIColor.mainblue
                cell.textLabel?.font = UIFont.init(name: "AppleSDGothicNeo-bold", size: 13)
            }
            else{
                cell.textLabel?.textColor = UIColor.darkGray
                cell.textLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 13)
            }
            return cell
        }
        else if pagerView == self.cateView{
             let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell4", at: index)
            self.index = 0
            for img in cateimgs {
                cate1[self.index].setImage(UIImage(named: img), for: .normal
                )
                cate1[self.index].tintColor = UIColor.darkGray
                self.index += 1
            }
            cell.addSubview(cateUIView)
            return cell
        }
        else{
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell3", at: index)
            cell.textLabel?.superview?.backgroundColor = .white
            cell.textLabel?.text = self.product[index]
            cell.textLabel?.backgroundColor = .white
            cell.textLabel?.textColor = UIColor.darkGray
            cell.textLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 13)
            return cell
        }
        
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
       
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        if pagerView == self.pagerView{
            self.pageControl.currentPage = targetIndex
        }
        else if pagerView == self.cateView{
            self.catePageControl.currentPage = targetIndex
        }
    }
       
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        if pagerView == self.pagerView{
            self.pageControl.currentPage = pagerView.currentIndex
        }
        else if pagerView == self.cateView{
            self.catePageControl.currentPage = cateView.currentIndex
        }
    }
    
    private func setproductinfo(){
        let product1 = ProductInfo(mainimg: "img1", name: "[보랄] 더셰프 인덕션", price: "51,900원", subinfo: [true,true,true])
        let product2 = ProductInfo(mainimg: "img2", name: "고구마는 원래 노랗다", price: "21,900원", subinfo: [false,true,true])
        let product3 = ProductInfo(mainimg: "img3", name: "[해찬들] 국산 고추장", price: "31,900원", subinfo: [true,false,true])
        let product4 = ProductInfo(mainimg: "img4", name: "면도기", price: "71,900원", subinfo: [true,false,false])
        
        products = [product1,product2,product3,product4]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productcell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell
        
        productcell?.setProductInformation(Button_img: products[indexPath.row].mainimg, name: products[indexPath.row].name, price: products[indexPath.row].price, subinfo: products[indexPath.row].getImageName())
        
        return productcell!
    }
    
}


