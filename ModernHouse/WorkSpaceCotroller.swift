//
//  MainViewController.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 28/01/23.
//

import UIKit
import SceneKit

class WorkSpaceCotroller: UIViewController{
    
    var categoryEnum: [InteriorCategoryEnum] = [.furniture, .color, .pattern]
    
//    [
//        InteriorCategoryModel(nameOfCategory: "Furniture", iconOfCategory: UIImage(systemName: "trash")),
//        InteriorCategoryModel(nameOfCategory: "Color", iconOfCategory: UIImage(systemName: "trash")),
//        InteriorCategoryModel(nameOfCategory: "Pattern", iconOfCategory: UIImage(systemName: "trash"))
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initViews()
    }
    
    func initViews(){
        setSceneKit()
        setInteriorCategories()
        setInteriors()
    }
    
    func setInteriorCategories(){
//        let collectionView = UIView(frame: CGRect(x: 0, y: universalHeight(60), width: windowWidth, height: universalHeight(80)))
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: universalWidth(60), height: universalWidth(60))
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: universalHeight(60), width: windowWidth, height: universalHeight(80)), collectionViewLayout: layout)
        collectionView.backgroundColor = .lightGray
//        collectionView.register(GSACategorycell.self,  forCellWithReuseIdentifier: "GSACategorycell")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
    }
    
    func setSceneKit(){
        let sceneKitView = SCNView(frame: CGRect(x: universalWidth(10), y: universalHeight(150), width: windowWidth - universalWidth(20), height: universalHeight(450)))
        sceneKitView.backgroundColor = .lightGray //.withAlphaComponent(0.5)
        sceneKitView.layer.cornerRadius = 25
                
        let scene = SCNScene() //named: "emptyRoom3D.scn""

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()       
        cameraNode.position = SCNVector3(x: 0, y: 10, z: 35)
        
        scene.rootNode.addChildNode(cameraNode)
        
//         5: Adding light to scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        scene.rootNode.addChildNode(lightNode)
           
//         6: Creating and adding ambien light to scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        sceneKitView.showsStatistics = true
        sceneKitView.allowsCameraControl = true
        sceneKitView.cameraControlConfiguration.allowsTranslation = false
        sceneKitView.scene = scene
        self.view.addSubview(sceneKitView)
    }
    
    func setInteriors(){
        let collectionView = UIView(frame: CGRect(x: universalWidth(10), y: universalHeight(610), width: windowWidth - universalWidth(20), height: universalHeight(100)))
        collectionView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        collectionView.layer.cornerRadius = 25
        self.view.addSubview(collectionView)
    }
}

extension WorkSpaceCotroller: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryEnum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
