//
//  MainViewController.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 28/01/23.
//

import UIKit
import SceneKit

class WorkSpaceCotroller: UIViewController{
    
    lazy var categoryModel: [InteriorCategoryModel] = [
        InteriorCategoryModel(category: .color, identifier: getUniqueIdentifier(), isSelected: true),
        InteriorCategoryModel(category: .furniture, identifier: getUniqueIdentifier()),
        InteriorCategoryModel(category: .pattern, identifier: getUniqueIdentifier())
    ] 
    
    var identifierFactory = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initViews()
    }
    
    private func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
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
        sceneKitView.backgroundColor = .lightGreen
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
//        self.view.addSubview(sceneKitView)
        
        let houseImg = UIImageView(frame: CGRect(x: universalWidth(10), y: universalHeight(150), width: windowWidth - universalWidth(20), height: universalHeight(450)))
        houseImg.image = UIImage(named: "3dHouse")
        houseImg.contentMode = .scaleAspectFill
        houseImg.backgroundColor = .white
        self.view.addSubview(houseImg)
    }
    
    //TODO: change size like 610
    func setInteriors(){
        let interiorValueView = InteriorValueView(frame: CGRect(x: universalWidth(10), y: universalHeight(610), width: windowWidth - universalWidth(20), height: universalHeight(100)))
        interiorValueView.backgroundColor = .lightGreen
        interiorValueView.layer.cornerRadius = 25
        self.view.addSubview(interiorValueView)
        
        let backButton = UIButton(frame: CGRect(x: universalWidth(20), y: interiorValueView.frame.maxY + 20, width: windowWidth - universalWidth(40), height: universalWidth(40)))
        backButton.backgroundColor = .darkGreen
        backButton.layer.cornerRadius = 18
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.addTarget(self, action: #selector(generateTapped), for: .touchUpInside)
        self.view.addSubview(backButton)
    }
    
    @objc func generateTapped(){
        dismiss(animated: true)
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
            print(model?.identifier)
            if model?.isSelected == false {
                for mode in self.categoryModel{
                    self.categoryModel[mode.identifier].isSelected = (mode.identifier == model?.identifier)
                }
            } else {
                self.categoryModel[model!.identifier].isSelected = false
            }
            collectionView.reloadData()
        }
        return cell
    }
}
