//
//  LoadingViewController.swift
//  LottieExercises
//
//  Created by Mahmut Senbek on 10.10.2023.
//

import UIKit
import SnapKit
import Lottie


class LoadingViewController: UIViewController {
    let openingScreen = UIView()
    var animation = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let vc = ViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc,animated: true)
        }
    }
    func configureUI() {
        view.backgroundColor = .black
        view.addSubview(openingScreen)
        openingScreen.backgroundColor = .black
        openingScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(view.frame.size.height)
            make.width.equalTo(view.frame.size.width)
        }
        playLottiAnimation(url: "loading")
    }
    func playLottiAnimation(url : String) {
        animation = .init(name: url)
        animation.frame = CGRect(x: 0, y: 100, width: view.frame.size.width  , height: view.frame.size.height * 0.75)
        animation.animationSpeed = 0.7
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.clipsToBounds = true
        animation.play()
        openingScreen.addSubview(animation)
    }
    
}
