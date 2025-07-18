//
//  ViewController.swift
//  AlertView
//
//  Created by Zaid Tayyab on 09/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var alertBtn: UIButton = createEllipsisBtn()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildHierarchy()
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    private func buildHierarchy() {
        view.addSubview(alertBtn)
    }
    private func setUpConstraints() {
        alertBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alertBtn.heightAnchor.constraint(equalToConstant: LayoutConstants.Height.small),
            alertBtn.widthAnchor.constraint(equalToConstant: LayoutConstants.Height.small),
            alertBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    private func createEllipsisBtn() -> UIButton {
        let alertBtn = UIButton()
        alertBtn.backgroundColor = .black
        alertBtn.tintColor = .white
        
        alertBtn.addTarget(self, action: #selector(alertBtnTapped), for: .touchUpInside)

        return alertBtn
    }
    @objc func alertBtnTapped() {
        ButtonHaptic.generateSoftHaptic()
        let alertPhoneConfirmation = AlertView.init(frame: view.frame)
        alertPhoneConfirmation.viewController = self
        alertPhoneConfirmation.alertViewDelegate = self
        alertPhoneConfirmation.show(
            type: .request,
            title: NSLocalizedString(
                "How is your iOS development going??",
                comment: ""), description: "",
            gradientOpacity: 0.8,
            confirmText: NSLocalizedString("good", comment: ""),
            cancelText: NSLocalizedString("not good", comment: "")
        )
    }


}
extension ViewController: AlertViewDelegate {
    
}
