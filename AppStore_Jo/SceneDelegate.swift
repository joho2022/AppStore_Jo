//
//  SceneDelegate.swift
//  AppStore_Jo
//
//  Created by 조호근 on 2022/12/05.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene) // window객체에 windowScene을 지정 후에 객체를 생성
        window?.backgroundColor = .systemBackground
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible() // keywindow 설정한다. 윈도우가 여러개 존재할 때 가장 앞쪽에 배치된 윈도우를 키윈도우로 지칭한다.
        
    }
}

