//
//  HomeExVC.swift
//  iOS-Design-Project
//
//  Created by 이주혁 on 2020/05/24.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class HomeExVC: UIViewController {
    /// 상단 Banner
    @IBOutlet weak var Banner: UIView!
    private var bannerView:BannerView!
    private func setUpUI() {
        //self.view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1)

        bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width*(197.0/375.0)))
        self.Banner.addSubview(bannerView)
        print(bannerView.frame)
        bannerView.backgroundColor = UIColor.green
        Banner.frame = bannerView.frame
    }
    private func setUpBannerView(item:Int) {
      
        bannerView.reloadData(configuration: nil, numberOfItems: item) { (bannerView, index) -> (UIView) in
           
           return self.itemView(at: index)
        }
    }
        private func itemView(at index:Int)->UIImageView {
            let urls:[String] = ["ad1","ad2","ad3","ad4","ad5","ad6"]
            let itemImageView:UIImageView = UIImageView(frame: .zero)
            itemImageView.translatesAutoresizingMaskIntoConstraints = false
            itemImageView.image = UIImage(named: urls[index])
            itemImageView.clipsToBounds = true
            itemImageView.contentMode = UIView.ContentMode.scaleToFill
            itemImageView.isUserInteractionEnabled=true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(tapGestureRecognizer:)))
            itemImageView.addGestureRecognizer(tapGestureRecognizer)
            return itemImageView
        }
    @objc func buttonTapped(tapGestureRecognizer : UITapGestureRecognizer ){
        if(tapGestureRecognizer.state == .ended){
            print("터치")
        }
    }
    ///로켓시리즈
    @IBAction func roketDiliveryButton(_ sender: Any) {
        print("로켓배송 클릭")
    }
    @IBAction func roketFreshButton(_ sender: Any) {
        print("로켓프레쉬 클릭")
    }
    @IBAction func roketOverseaButton(_ sender: Any) {
        print("로켓직구 클릭")
    }
    
    
    ///카테고리 베너
    
    @IBOutlet weak var Category: UIView!
    @IBOutlet weak var CategoryCollectionView: UICollectionView!
    //@IBOutlet weak var CategoryScroll: UIScrollView!
    @IBOutlet weak var CategoryPageControl: UIPageControl!
    
    private var first_page_categoryImageInformation:[String]=[]

    
    private func setCategoryInformation(){
        first_page_categoryImageInformation=["iconBeauty","iconBook","iconCook","iconDigital","iconFashion","iconHealth","iconOffice","iconSport","iconSupply","iconTicket","iconBook","","iconCook","","iconDigital","","iconFashion","","iconBeauty",""]
        self.CategoryCollectionView.delegate = self
        self.CategoryCollectionView.dataSource = self
        self.CategoryCollectionView.showsHorizontalScrollIndicator = false
        self.Category.layer.shadowColor = UIColor.black.cgColor
        self.CategoryCollectionView.tag = 1
    }
/// 인기검색어

    
    
    
///테이블뷰
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    private var ProductInformation:[[Product]] = []
    private func setProductInformation(){
        let item1 = Product(imagname: "img1", name: "item1", price: "price1")
        let item2 = Product(imagname: "img2", name: "item2", price: "price2")
        let item3 = Product(imagname: "img3", name: "item3", price: "price3")
        let item4 = Product(imagname: "img4", name: "item4", price: "price4")
        let item5 = Product(imagname: "img5", name: "item5", price: "price5")
        let item6 = Product(imagname: "img6", name: "item6", price: "price6")
        let item7 = Product(imagname: "img7", name: "item7", price: "price7")
        let item8 = Product(imagname: "img8", name: "item8", price: "price8")
        let item9 = Product(imagname: "img9", name: "item9", price: "price9")
        
        let array1:[Product] = [item1,item2,item3,item4,item5,item6,item7,item8,item9]
        let array2:[Product] = [item1,item2,item3,item4,item5,item6,item7,item8,item9]
        let array3:[Product] = [item1,item2,item3,item4,item5,item6,item7,item8,item9]
        ProductInformation=[array1,array2,array3]
        
        ProductCollectionView.delegate = self
        ProductCollectionView.dataSource = self
        ProductCollectionView.tag = 2
    }
    private var headerLabel:[String] = ["@@@님의 추천상품","로켓프레시","오늘의 특가"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpBannerView(item: 6)
        setCategoryInformation()
        setProductInformation()
        // Do any additional setup after loading the view.

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
extension HomeExVC:UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 2{

            return 3
        }
        else {return 1}
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{return first_page_categoryImageInformation.count}
        else {

            if section == 0 {
                return ProductInformation[section].count
            }
            else if section == 1 {
                return ProductInformation[section].count
            }
            else {
                return ProductInformation[section].count
            }
        }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / 300)
        self.CategoryPageControl.currentPage = page
    }
}

extension HomeExVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView.tag == 1 {
        let cell:CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.categoryImageView.image = UIImage(named: first_page_categoryImageInformation[indexPath.row * (indexPath.section+1)])

        return cell
        }
        else {
            switch indexPath.section {

            default:
                let productCell : ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
                productCell.ProductImage.image = UIImage(named: ProductInformation[indexPath.section][indexPath.row].ProductImageName)
                productCell.ProductName.text = ProductInformation[indexPath.section][indexPath.row].ProductName
                productCell.ProductPrice.text = ProductInformation[indexPath.section][indexPath.row].ProductPrice
                return productCell
            }

        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexpath:IndexPath) ->UICollectionReusableView{

        var header : ProductCollectionViewHeader!
        if kind == UICollectionView.elementKindSectionHeader
        {
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headercell", for: indexpath) as? ProductCollectionViewHeader
            switch indexpath.section {
            case 0:
                header?.name.text = "@@@님의 추천상품"
                header?.sectionNumber = 0
            case 1:
                header?.name.text = "로켓프레쉬"
                header?.sectionNumber = 1
            case 2:
                header?.name.text = "오늘의 특가"
                header.sectionNumber = 2
            default:
                header?.layer.borderWidth=0.5
            }
        }
        return header!
    }
}
extension HomeExVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == 1 {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else {
            return UIEdgeInsets(top: 6.5, left: 11, bottom: 0, right: 11)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1 {
        return 10
        }
        else { return 16 }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
        let width = floor(self.view.frame.width / 5)-10
        let height = width
        return CGSize(width: width, height:height)
        }
        else { return CGSize(width : 95,height:121)
        }
    }
}
/*extension HomeExVC:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage:Int = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        if currentPage == 0 {
            self.CategoryScroll.contentOffset = CGPoint(x: scrollView.frame.size.width * CGFloat(2), y: scrollView.contentOffset.y)
        }
        else if currentPage == 2 {
            self.CategoryScroll.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y)
        }
        self.CategoryPageControl.currentPage = currentPage
    }
}
*/
