//
//  MainViewController.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 28/01/23.
//

import UIKit
import SceneKit

class WorkSpaceCotroller: UIViewController{
    
    var categoryModel: [InteriorCategoryModel] =  [
        InteriorCategoryModel(category: .furniture),
        InteriorCategoryModel(category: .color),
        InteriorCategoryModel(category: .pattern)
    ]
    
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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: universalWidth(90), height: universalWidth(70))
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: universalHeight(60), width: windowWidth, height: universalHeight(90)), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(InteriorCategoryCell.self,  forCellWithReuseIdentifier: "InteriorCategoryCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        self.view.addSubview(collectionView)
    }
    
    func setSceneKit(){
        let sceneKitView = SCNView(frame: CGRect(x: universalWidth(10), y: universalHeight(150), width: windowWidth - universalWidth(20), height: universalHeight(450)))
        sceneKitView.backgroundColor = #colorLiteral(red: 0.8409659266, green: 0.8310413957, blue: 0.8827342391, alpha: 1) 
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
        collectionView.backgroundColor = #colorLiteral(red: 0.8409659266, green: 0.8310413957, blue: 0.8827342391, alpha: 1)
        collectionView.layer.cornerRadius = 25
        self.view.addSubview(collectionView)
    }
}

extension WorkSpaceCotroller: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InteriorCategoryCell", for: indexPath) as? InteriorCategoryCell else { return UICollectionViewCell()}
        cell.setupCategory(model: categoryModel[indexPath.row])
        
        cell.onAction = { model in
            for mode in self.categoryModel{
                if mode.identifier == model?.identifier {
                    self.categoryModel[mode.identifier-1].isSelected = true
                } else {
                    self.categoryModel[mode.identifier-1].isSelected = false
                }
            }
            collectionView.reloadData()
        }
        
        return cell
    }
    
}
