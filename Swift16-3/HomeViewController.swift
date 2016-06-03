//
//  HomeViewController.swift
//  Swift16-3
//
//  Created by wanglidan on 16/6/3.
//  Copyright © 2016年 wanglidan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Home"
        self.view.backgroundColor = UIColor.redColor()
        
        let button = UIButton(type: UIButtonType.ContactAdd)
        button.frame = CGRect(x: 20, y: 60, width: 50, height: 50)
        button.addTarget(self, action: #selector(self.btnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }

    func btnClick(btn: UIButton){
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
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
