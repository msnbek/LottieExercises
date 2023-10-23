//
//  ViewController.swift
//  LottieExercises
//
//  Created by Mahmut Senbek on 9.10.2023.
//

import UIKit
import SnapKit
import Lottie

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let startButton = UIButton()
    let stopButton = UIButton()
    var lottieLoading = LottieAnimationView()
    var propAnimator: UIViewPropertyAnimator?
    var visualEffect : UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let visualEffect = UIVisualEffectView(effect: blurEffect)
        return visualEffect
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        createBlur()
    }
    func configureUI() {
        view.backgroundColor = .white
        imageView.image = UIImage(named: "dragonred.jpg")
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(200)
        }
        view.addSubview(lottieLoading)
        lottieLoading.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(imageView.snp.centerY).offset(150)
        }
        view.addSubview(startButton)
        view.addSubview(stopButton)
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        
        stopButton.setTitle("Stop", for: .normal)
        stopButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        stopButton.layer.cornerRadius = 10
        stopButton.addTarget(self, action: #selector(stopButtonClicked), for: .touchUpInside)
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom).offset(150)
            make.leading.equalToSuperview().offset(100)
            make.width.equalTo(100)
            make.height.equalTo(75)
        }
        stopButton.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom).offset(150)
            make.trailing.equalTo(startButton.snp.trailing).offset(120)
            make.width.equalTo(100)
            make.height.equalTo(75)
        }
        
        visualEffect.frame = imageView.bounds
        imageView.addSubview(visualEffect)
        visualEffect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    @objc func startButtonClicked() {
        lottieLoading.animation = LottieAnimation.named("dotloading")
        lottieLoading.play()
        propAnimator?.startAnimation()
    }
    @objc func stopButtonClicked() {
        lottieLoading.stop()
        lottieLoading.animation = LottieAnimation.named("dotloading")
        propAnimator?.pauseAnimation()
    }
    
    func createBlur() {
        propAnimator?.stopAnimation(true)
        propAnimator = UIViewPropertyAnimator(duration: 5.0, curve: .linear, animations: {
            self.visualEffect.alpha = 0
        })
        
    }
    
}
