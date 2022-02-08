//
//  HomeTableViewHeader.swift
//  AluraViagens
//
//  Created by Camila Marques Vasconcelos Loureiro on 07/02/22.
//

import UIKit

class HomeTableViewHeader: UIView {

    // MARK: IBOutlets
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var BannerImageView: UIImageView!
    
    func configuraView() {
        headerView.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
        //arredondando banner
        bannerView.layer.cornerRadius = 10
        bannerView.layer.masksToBounds = true
        
        //arredondando a view azul
        headerView.layer.cornerRadius = 500
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
