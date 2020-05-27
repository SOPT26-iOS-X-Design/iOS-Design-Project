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
        
    }
    @IBAction func roketFreshButton(_ sender: Any) {
    }
    @IBAction func roketOverseaButton(_ sender: Any) {
    }
    
    
    ///카테고리 베너
    
    @IBOutlet weak var Category: UIView!
    @IBOutlet weak var CategoryCollectionView: UICollectionView!
    //@IBOutlet weak var CategoryScroll: UIScrollView!
    @IBOutlet weak var CategoryPageControl: UIPageControl!
    
    private var first_page_categoryImageInformation:[String]=[]
    private var second_page_categoryImageInformation:[String]=[]

    
    private func setCategoryInformation(){
        first_page_categoryImageInformation=["iconBeauty","iconBook","iconCook","iconDigital","iconFashion","iconHealth","iconOffice","iconSport","iconSupply","iconTicket","iconBook","","iconCook","","iconDigital","","iconFashion","","iconBeauty",""]
        second_page_categoryImageInformation = []
        self.CategoryCollectionView.delegate = self
        self.CategoryCollectionView.dataSource = self
        self.CategoryCollectionView.showsHorizontalScrollIndicator = false
        self.Category.layer.shadowColor = UIColor.black.cgColor
    }
/// 인기검색어
    
    @IBOutlet weak var SearchRanking: UIView!
    
    @IBOutlet weak var SearchRankingViewHeight: NSLayoutConstraint!
    
    
    
    
    
    private var productInformation:[Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.view.frame)
        print(self.Banner.frame)
        setUpUI()
        setUpBannerView(item: 6)
        setCategoryInformation()
        //setScrollInformation()
        // Do any additional setup after loading the view.
        //self.HomeTableView.delegate = self
        //self.HomeTableView.dataSource = self
    }
    
    
    private func setProductInformations(){
        let data1 = Product(product:.recommend)
        let data2 = Product(product: .roketFresh)
        let data3 = Product(product: .todaySale)
        productInformation=[data1,data2,data3]
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
extension HomeExVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productInformation.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let ProductCell=tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for:indexPath) as? HomeTableViewCell
            else{return UITableViewCell()}
        ProductCell.setProductInformation(ProductCategory: productInformation[indexPath.row].ProductCategory.getProductInfo())
        return ProductCell
    }
}
extension HomeExVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
extension HomeExVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return first_page_categoryImageInformation.count
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x)
        let page = Int(targetContentOffset.pointee.x / 300)
        print(page)

        self.CategoryPageControl.currentPage = page
    }
}

extension HomeExVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.categoryImageView.image = UIImage(named: first_page_categoryImageInformation[indexPath.row])

        print(cell.frame)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(indexPath)
    }
}
extension HomeExVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(self.view.frame.width / 5)-10
        let height = width
        return CGSize(width: width, height:height)
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
