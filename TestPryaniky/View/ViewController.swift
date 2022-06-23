//
//  ViewController.swift
//  TestPryaniky
//
//  Created by Konstantin on 22.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private func createLabel() -> UILabel {
        return UILabel(text: "hz")
    }
    
    private func createButton(text: String) -> UIButton {
        return UIButton(text: text)
    }
    
    private func createStackView() -> UIStackView {
        let stakView = UIStackView()
        stakView.axis = .horizontal
        stakView.spacing = 5
        stakView.distribution = .fillEqually
        stakView.translatesAutoresizingMaskIntoConstraints = false
        return stakView
    }
    
    private func createPicturesView() -> UIImageView {
        let myView = UIImageView()
         return myView
    }
    
    private var pryanikyStackView = UIStackView()
    

    private var viewModel: ViewViewModelType! {
        didSet {
            
            
            
            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        setupViews()
        setConstraints()
        viewModel?.loadData { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                
                self.createElements()
                

            }
        }
    }
    
    private func createElements() {
        guard let viewsEnum = viewModel?.viewPozition else { return }
        
        for viewsSubName in viewsEnum {
            switch viewsSubName {
                
            case .hz:
                guard let hz = viewModel.hzObject else { return }
                let myLabel = createLabel()
                myLabel.text = hz.data.text
                let firstLabelTap = UITapGestureRecognizer(target: self, action: #selector(tappedLabel(_:)))
                myLabel.isUserInteractionEnabled = true
                myLabel.addGestureRecognizer(firstLabelTap)
                pryanikyStackView.addArrangedSubview(myLabel)
                
            case .selector:
                guard let selectorObject = viewModel.selectorObject else { return }
                guard let variants = selectorObject.data.variants else { return }
                let selector = createStackView()
                for variant in variants {
                    let myButton = createButton(text: variant.text)
                    myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                    selector.addArrangedSubview(myButton)
                }
                pryanikyStackView.addArrangedSubview(selector)
                
            case .picture:
                guard let imageUrl = viewModel.pictureObject?.data.url else { return }
                let myImageView = createPicturesView()
                myImageView.downloaded(from: imageUrl)
                myImageView.isUserInteractionEnabled = true
                myImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedPicture)))
                pryanikyStackView.addArrangedSubview(myImageView)
            }
        }
    }

    private func setupViews() {
        view.backgroundColor = .white
        setStackView()
        view.addSubview(pryanikyStackView)
        
    }
    
    func setStackView() {
        
        pryanikyStackView.spacing = 25
        pryanikyStackView.axis = .vertical
        pryanikyStackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let text = sender.titleLabel?.text
        viewModel.descriptionObject(name: .selector, text: text)
    }
    
    @objc func tappedPicture(_ sender: UIView) {        
        print("Tapped Picture")
        viewModel.descriptionObject(name: .picture, text: nil)
    }
    
    @objc func tappedLabel(_ sender: UITapGestureRecognizer) {
        guard let label = sender.view as? UILabel else { return }
        let text = label.text
        viewModel.descriptionObject(name: .hz, text: text)
    }

}

extension ViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate( [
            pryanikyStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pryanikyStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pryanikyStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pryanikyStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        

    }
}


