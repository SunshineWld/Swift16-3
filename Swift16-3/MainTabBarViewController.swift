//
//  MainTabBarViewController.swift
//  Swift16-3
//
//  Created by wanglidan on 16/6/3.
//  Copyright © 2016年 wanglidan. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController, UINavigationControllerDelegate{

    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    
    var selectedImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建子视图
        self.initTabbarView()
        //创建子控制器
        self.initChildController()
        

    }
    //MARK:创建子视图
    func initTabbarView(){
        
        self.tabBar.hidden = true
        //创建tabbar工具栏视图
        let tabbarView = UIImageView(frame: CGRect(x: 0, y: height-49, width: width, height: 49))
        tabbarView.userInteractionEnabled = true
        
        var img = UIImage(named: "navbg.png")
        UIGraphicsBeginImageContext(CGSizeMake(width, 49))
        img?.drawInRect(CGRectMake(0, 0, width, 49))
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
            
        tabbarView.image = img
        self.view.addSubview(tabbarView)
        
        
        //创建选项按钮
        let array = ["1.png", "2.png", "3.png", "4.png", "5.png"]
        for index in 0...array.count-1 {
            let button = UIButton(type: UIButtonType.Custom)
            button.frame = CGRect(x: CGFloat(index)*(width/CGFloat(array.count)), y: 0, width: width/CGFloat(array.count), height: 49)
            button.tag = 100 + index
            button.setImage(UIImage(named: array[index]), forState: UIControlState.Normal)
            button.addTarget(self, action: #selector(self.buttonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            tabbarView.addSubview(button)
            
        }
        
        selectedImgView = UIImageView(image: UIImage(named: "选中.png"))
        selectedImgView.frame = CGRect(x: (width / CGFloat(array.count) - 53)/2, y: (49 - 45)/2, width: 53, height: 45)
        tabbarView.addSubview(selectedImgView)
    }
    func buttonClick(btn: UIButton){
        self.selectedIndex = btn.tag-100
//        self.selectedIndex = Int(btn.center.x/(width/5))
        
        UIView.animateWithDuration(0.25) { 
            () -> Void in
            self.selectedImgView.center = btn.center
        }
        
        
    }
    //MARK:创建控制器
    func initChildController(){
        let home = HomeViewController()
        let message = MessageViewController()
        let search = SearchViewController()
        let setting = SettingViewController()
        let more = MoreViewController()
        let viewControllers = [home, message, search, setting, more]
        self.viewControllers = viewControllers
        
        var navs: [UINavigationController] = []
        var img = UIImage(named: "navbar_bg_normal.png")
        UIGraphicsBeginImageContext(CGSizeMake(width, 64))
        img?.drawInRect(CGRectMake(0, 0, width, 64))
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //创建二级控制器
        for vc: UIViewController in viewControllers {
            let nav = UINavigationController(rootViewController: vc)
            nav.delegate = self
            navs.append(nav)
        }
        //设置全局
        UINavigationBar.appearance().setBackgroundImage(img, forBarMetrics: UIBarMetrics.Default)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.viewControllers = navs
        
    }
    //MARK:

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
