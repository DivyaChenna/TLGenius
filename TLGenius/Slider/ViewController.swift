//
//  ViewController.swift
//  TLGenius
//
//  Created by Apple on 8/7/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SwiftSocket

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var pagerControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!

    var  selectedIndex = 0

    var imgArray = [String]()
    var nameArray = [String]()
    var txtDescriptionArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let client = TCPClient(address: "192.168.4.1", port: 23)
        switch client.connect(timeout: 3) {
        case .success:
            switch client.send(string: "GET " ) {
            case .success:
                guard let data = client.read(1024*10) else { return }

                if let response = String(bytes: data, encoding: .utf8) {
                    print("RESPONSE:\(response)")
                }
            case .failure(let error):
                print("ERROR:\(error)")
            }
        case .failure(let error):
            print("ERROR:\(error)")
        }

        DispatchQueue.global(qos: .background).async {
            let udpClient = UDPClient(address: "192.168.4.1", port: 23)
            
            switch udpClient.send(string: "Hello") {
            case .success:
                print("Client sent message to server.")
            case .failure(let error):
                print("Client failed to send message to server: \(error)")
            }
            udpClient.close()
            
            DispatchQueue.main.async {
                //This is run on the main queue, after the previous
                //code executes.  Update UI here.
            }
        }

        //        let keyString = "hpXa6pTJOWDAClC/J6POVTjvJpMIiPAMQiTMjBrcOGw=hpXa6pTJOWDAClC/J6POVTjvJpMIiPAMQiTMjBrcOGw="
        //
        //        if let keyData = Data(base64Encoded: keyString) {
        //            print(keyData.count) // 32
        //            print(keyData as NSData) // <8695daea 94c93960 c00a50bf 27a3ce55 38ef2693 0888f00c 4224cc8c 1adc386c>
        //        }

        imgArray = ["home","home2","home3"]
        nameArray = ["Control your lights from anywhere,anytime","Lighting for wellness and relaxation","ElderSense and GasSense monitoring services"]
        txtDescriptionArray = ["GENIUS smart LED light bulbs respond to voice commands via Alexa. They remember your light preferences, monitor elders and   gas-leaks","GENIUS smart LED light bulbs are 'human-centric'. They come with pre-set light themes that enhance human wellbeing, reduce stress and improve sleep. You can even create your own light-recipe to make your homes smart and trendy.","GENIUS smart LED light bulbs monitor home-alone elders. You can link incident alerts direct to ambulatory services(subscription-based) or set up emergency contacts to be alerted. Gas leaks can be monitored and reported to emergency contacts for timely intervention and protection from fires." ]
        
        pagerControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        self.view.bringSubview(toFront: pagerControl)
        self.view.bringSubview(toFront: btnNext)

        self.btnNext.isHidden = true
    }

    //MARK:-CollectionView DataSource and Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath) as! SliderCollectionViewCell
        cell.imageIntro.image = UIImage(named: imgArray[indexPath.row])
        cell.lblName.text = nameArray[indexPath.row]
        cell.lblDescription.text = txtDescriptionArray[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }

    
    //MARK:- scrollview delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pagerControl?.currentPage = Int(pageNumber)
        
        if(Int(pageNumber) == 2){
            self.btnNext.isHidden = false
        } else {
            self.btnNext.isHidden = true
        }
        
        self.pagerControl.currentPage = Int(pageNumber)
        selectedIndex = Int(pageNumber)
    }
    
    @IBAction func btnNextAction(_ sender: UIButton) {
        if(selectedIndex == 2){
            self.performSegue(withIdentifier:"GoToLoginScreen", sender: self)
        } else {
            self.collectionView.scrollToItem(at: IndexPath.init(row: selectedIndex + 1, section: 0), at: .right, animated: true)
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

