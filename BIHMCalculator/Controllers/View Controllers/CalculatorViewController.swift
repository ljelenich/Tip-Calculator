//
//  CalculatorViewController.swift
//  BIHMCalculator
//
//  Created by LAURA JELENICH on 10/13/20.
//

import UIKit

class CalculatorViewController: UIViewController {

    //MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }

    //MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        addViews()
        setupStackView()
        setupViews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    //MARK: - Helper Functions
    func addViews() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(billLabel)
        self.view.addSubview(billAmountTextField)
        self.view.addSubview(tipLabel)
        self.view.addSubview(segmentedControl)
        self.view.addSubview(tipAmountLabel)
        self.view.addSubview(totalLabel)
        self.view.addSubview(totalAmountLabel)
        self.view.addSubview(billStackView)
        self.view.addSubview(tipStackView)
        self.view.addSubview(totalStackView)
    }
    
    func setupStackView() {
        billStackView.addArrangedSubview(billLabel)
        billStackView.addArrangedSubview(billAmountTextField)
        tipStackView.addArrangedSubview(tipLabel)
        tipStackView.addArrangedSubview(segmentedControl)
        tipStackView.addArrangedSubview(tipAmountLabel)
        totalStackView.addArrangedSubview(totalLabel)
        totalStackView.addArrangedSubview(totalAmountLabel)
    }
    
    func setupViews() {
        titleLabel.anchor(top: safeArea.topAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, topPadding: 40, bottomPadding: 0, trailingPadding: 8, leadingPadding: 8)
        billStackView.anchor(top: titleLabel.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, topPadding: 30, bottomPadding: 0, trailingPadding: -8, leadingPadding: 8, height: 40)
        tipStackView.anchor(top: billStackView.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, topPadding: 30, bottomPadding: 0, trailingPadding: -8, leadingPadding: 8, height: 40)
        totalStackView.anchor(top: tipStackView.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, topPadding: 30, bottomPadding: 0, trailingPadding: -8, leadingPadding: 8, height: 40)
    }
    
    
    @objc func getTips(index: Int) {
        guard let billAmount = Double(billAmountTextField.text ?? "") ?? 0 else { return }
        let bill = billAmount
        var total = 0.0
        var tip = 0.0
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            tip = bill * 0.10
            total = bill + tip
        case 1:
            tip = bill * 0.18
            total = bill + tip
        case 2:
            tip = bill * 0.20
            total = bill + tip
        case 3:
            tip = bill * 0.25
            total = bill + tip
        default:
            break
        }
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }

    //MARK: - Views
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Because I hate math tip calculator"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    let billLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill Amount"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    let billAmountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter amount here..."
        textField.keyboardType = .numberPad
        textField.backgroundColor = .white
        return textField
    }()
    
    let tipLabel: UILabel = {
        let label = UILabel()
        label.text = "Tip"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    let tipAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    let totalAmountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let segmentedControl: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["10%", "18%", "20%", "25%"])
        seg.selectedSegmentIndex = 0
        seg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        seg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "backgroundColor")!], for: .selected)
        seg.addTarget(self, action: #selector(getTips(index:)), for: .valueChanged)
        return seg
    }()
    
    let billStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let tipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
}
