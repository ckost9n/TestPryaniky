//
//  ViewController.swift
//  TestPryaniky
//
//  Created by Konstantin on 22.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let hzFirstLabel = UILabel(text: "hz")
    
    private let hzSecodLabel = UILabel(text: "hz")
    
    private func createLabel() -> UILabel {
        return UILabel(text: "hz")
    }
    
    private lazy var selectorControl: UISegmentedControl = {
       let control = UISegmentedControl(items: ["1", "2", "3"])
        control.addTarget(self, action: #selector(selectorChange), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private let firstButton = UIButton(text: "One")
    private let secondButton = UIButton(text: "Two")
    private let thirdButton = UIButton(text: "Three")
    
    private var buttonStackView = UIStackView()
    
    private func createSelector() -> UIStackView {
        return UIStackView(arrangedSubviews: [
            firstButton,
            secondButton,
            thirdButton
        ], axis: .horizontal, spacing: 5)
    }
    
    private let pictureView: UIView = {
       let myView = UIView()
        myView.backgroundColor = .orange
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    private func createPicturesView() -> UIView {
        let myView = UIView()
         myView.backgroundColor = .orange
         myView.translatesAutoresizingMaskIntoConstraints = false
         return myView
    }
    
    private var stackView = UIStackView()
    
    private var pryanikyStackView = UIStackView()
    
    
//    private var stackView: UIStackView = {
//       let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()

    private var viewModel: ViewModel! {
        didSet {
            print("go")
            guard let viewsEnum = viewModel?.viewPozition else { return }
            
            for viewsSubName in viewsEnum {
                switch viewsSubName {
                case .hz:
                    pryanikyStackView.addArrangedSubview(createLabel())
                case .selector:
                    pryanikyStackView.addArrangedSubview(createSelector())
                case .pictures:
                    pryanikyStackView.addArrangedSubview(createPicturesView())
                }
            }
            print("Needs update")
            print(viewModel.viewPozition)
            view.reloadInputViews()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        setupViews()
        setConstraints()
        viewModel?.loadData()
    }

    private func setupViews() {
        view.backgroundColor = .white
        firstButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setStackView()
        view.addSubview(pryanikyStackView)
//        view.addSubview(stackView)
    }
    
    func setStackView() {
//        stackView.addArrangedSubview(hzFirstLabel)
//        stackView.addArrangedSubview(selectorControl)
//        stackView.addArrangedSubview(pictureView)
//        stackView.addArrangedSubview(hzSecodLabel)
        
        pryanikyStackView.spacing = 25
        pryanikyStackView.axis = .vertical
        pryanikyStackView.translatesAutoresizingMaskIntoConstraints = false
        
        pictureView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedPicture)))
        
        let firstLabelTap = UITapGestureRecognizer(target: self, action: #selector(tappedLabel(_:)))
        let secondLabelTap = UITapGestureRecognizer(target: self, action: #selector(tappedLabel(_:)))
        
        hzFirstLabel.isUserInteractionEnabled = true
        hzSecodLabel.isUserInteractionEnabled = true
        
        hzFirstLabel.addGestureRecognizer(firstLabelTap)
        hzSecodLabel.addGestureRecognizer(secondLabelTap)
        

        
        buttonStackView = UIStackView(arrangedSubviews: [
            firstButton,
            secondButton,
            thirdButton
        ], axis: .horizontal, spacing: 5)
        buttonStackView.distribution = .fillEqually
        
        stackView = UIStackView(arrangedSubviews: [
            hzFirstLabel,
            buttonStackView,
            pictureView,
            hzSecodLabel
        ], axis: .vertical, spacing: 25)
    }
    
    @objc func selectorChange() {
        print(selectorControl.selectedSegmentIndex)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "134")
    }
    
    @objc func tappedPicture(_ sender: UIView) {        
        print("Tapped Picture")
    }
    
    @objc func tappedLabel(_ sender: UITapGestureRecognizer) {
        guard let label = sender.view as? UILabel else { return }
        print("TAP \(label.text ?? "")")
    }

}

extension ViewController {
    private func setConstraints() {
//        NSLayoutConstraint.activate( [
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
//            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
//        ])
        
        NSLayoutConstraint.activate( [
            pryanikyStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pryanikyStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pryanikyStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pryanikyStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        

    }
}


