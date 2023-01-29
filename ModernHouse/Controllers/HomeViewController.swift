//
//  HomeViewController.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 29/01/23.
//

import UIKit

class HomeViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGreen
        setupViews()
    }
    
    func setupViews(){
        
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight/2))
        backView.backgroundColor = .darkGreen
        self.view.addSubview(backView)
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight - universalHeight(130)))
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ModernHouseCell.self, forCellReuseIdentifier: "ModernHouseCell")
        tableView.register(HomeSizeCell.self, forCellReuseIdentifier: "HomeSizeCell")
        self.view.addSubview(tableView)
        
        let generateButton = UIButton(frame: CGRect(x: universalWidth(20), y: tableView.frame.maxY, width: windowWidth - universalWidth(40), height: universalWidth(40)))
        generateButton.backgroundColor = .darkGreen
        generateButton.layer.cornerRadius = 18
        generateButton.setTitle("Generate", for: .normal)
        generateButton.setTitleColor(.white, for: .normal)
        generateButton.addTarget(self, action: #selector(generateTapped), for: .touchUpInside)
        self.view.addSubview(generateButton)
    }
    
    @objc func generateTapped(){
        let vc = WorkSpaceCotroller()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ModernHouseCell", for: indexPath) as? ModernHouseCell else { return UITableViewCell() }
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        case 1,2,3,4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSizeCell", for: indexPath) as? HomeSizeCell else { return UITableViewCell()}
            cell.backgroundColor = .lightGreen
            cell.selectionStyle = .none
            return cell
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0: return windowHeight / 4
        case 1,2,3,4: return universalHeight(100)
        default: return 0
        }
    }
}
