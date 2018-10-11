//
//  LoaderView.swift
//  MaxPay
//
//  Created by Sagaya Abdulhafeez on 21/09/2018.
//  Copyright © 2018 Sagaya Abdulhafeez. All rights reserved.
//

import UIKit

open class Loader: UIView {
    lazy internal var imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
//        img.image = UIImage(named: "Ball")
        img.contentMode = .scaleAspectFit
        img.alpha = 1.0
        return img
    }()
    var defaultImage:String?
    
    public func setImage(Image img:String){
        self.defaultImage = img
        self.imageView.image = UIImage(named: img)
    }
    lazy internal var sepatatorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    internal var imageConstraint: NSLayoutConstraint?
    @objc func animateStuff(){
        imageConstraint?.constant = -50
        UIWindow.animate(withDuration: 0.7, delay: 0, options: [.autoreverse,.repeat], animations: {
            self.layoutIfNeeded()
        }) { (_) in
        }
    }
    open override func layoutSubviews() {
        if #available(iOS 9.0, *) {
            imageConstraint = imageView.bottomAnchor.constraint(equalTo: sepatatorView.topAnchor, constant: 0)
        } else {
            //Set fallback for earlier devices
        }
        imageConstraint?.isActive = true
        if #available(iOS 9.0, *) {
            NSLayoutConstraint.activate([
                sepatatorView.widthAnchor.constraint(equalTo: widthAnchor),
                sepatatorView.heightAnchor.constraint(equalToConstant: 1),
                sepatatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
                sepatatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                imageView.widthAnchor.constraint(equalToConstant: 120),
                imageView.heightAnchor.constraint(equalToConstant: 120),
                imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
        } else {
            //Set fallback for earlier devices
        }
    }
    
    internal var alphaValue:Double = 0.7
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(sepatatorView)
       
    }
    var timer = Timer()
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animateStuff), userInfo: nil, repeats: false)
    }
    
    open static var shared = Loader()
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func showLoader(_ image:String? = nil, _ color:UIColor? = nil, _ backgroundAlpha:Double? = nil){
        guard let img = image != nil ? image : self.defaultImage, let clr = color != nil ? color : .black, let alph = backgroundAlpha != nil ? backgroundAlpha : alphaValue else {
            print("YOU MUST SET AN IMAGE FOR THE LOADER TO WORK 🙃")
            return
        }
        self.alphaValue = alph
        self.backgroundColor = clr
        
        if let window = UIApplication.shared.keyWindow, let img = UIImage(named: img){
            self.imageView.image = img
            scheduledTimerWithTimeInterval()
            self.translatesAutoresizingMaskIntoConstraints = false
            self.tag = 91202
            window.addSubview(self)
            if #available(iOS 9.0, *) {
                NSLayoutConstraint.activate([
                    self.centerYAnchor.constraint(equalTo: window.centerYAnchor),
                    self.centerXAnchor.constraint(equalTo: window.centerXAnchor),
                    self.heightAnchor.constraint(equalTo: window.heightAnchor),
                    self.widthAnchor.constraint(equalTo: window.widthAnchor)
                    ])
            } else {
                //Set fallback for earlier devices
            }
        }
    }
    
    open func hideLoader(){
        if let window = UIApplication.shared.keyWindow{
            imageConstraint?.constant = 0
            timer.invalidate()
            self.layer.removeAllAnimations()
            let view = viewWithTag(91202)
            view?.removeFromSuperview()
        }
    }
    
}

