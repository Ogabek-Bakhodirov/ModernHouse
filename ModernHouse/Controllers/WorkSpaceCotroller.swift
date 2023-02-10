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
        sceneKitView.scene = scene
        
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera      
        cameraNode.position = SCNVector3(x: 0, y: 10, z: 35)
        
//         5: Adding light to scene
        let light = SCNLight()
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        
        let cubeGeometry = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 1)
        let cubeNode = SCNNode(geometry: cubeGeometry)
        
           
//         6: Creating and adding ambien light to scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        
        let planeGeometry = SCNPlane(width: 50.0, height: 50.0)
        let planeNode = SCNNode(geometry: planeGeometry)
        planeNode.eulerAngles = SCNVector3(x: GLKMathDegreesToRadians(-90), y: 0, z: 0)
        planeNode.position = SCNVector3(x: 0, y: -0.5, z: 0)
        
        planeNode.position = SCNVector3(x: 0, y: -0.5, z: 0)
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = UIColor.red
        cubeGeometry.materials = [redMaterial]
        
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = UIColor.green
        planeGeometry.materials = [greenMaterial]
        
        let constraint = SCNLookAtConstraint(target: cubeNode)
        
        scene.rootNode.addChildNode(cameraNode)
        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(cubeNode)
        scene.rootNode.addChildNode(ambientLightNode)
        scene.rootNode.addChildNode(planeNode)
        
        sceneKitView.showsStatistics = true
        sceneKitView.allowsCameraControl = true
        sceneKitView.cameraControlConfiguration.allowsTranslation = false
        self.view.addSubview(sceneKitView)
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
