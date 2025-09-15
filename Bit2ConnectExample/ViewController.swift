import UIKit
import Bit2ConnectSDK

class ViewController: UIViewController {
    
    private var statusLabel: UILabel!
    private var createLinkButton: UIButton!
    private var testStorageButton: UIButton!
    private var clearDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateStatus()
    }
    
    private func setupUI() {
        title = "Bit2Connect SDK Example"
        view.backgroundColor = .systemBackground
        
        // Create status label
        statusLabel = UILabel()
        statusLabel.textAlignment = .center
        statusLabel.font = .systemFont(ofSize: 17)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create buttons
        createLinkButton = UIButton(type: .system)
        createLinkButton.setTitle("Create Dynamic Link", for: .normal)
        createLinkButton.backgroundColor = .systemBlue
        createLinkButton.setTitleColor(.white, for: .normal)
        createLinkButton.layer.cornerRadius = 8
        createLinkButton.addTarget(self, action: #selector(createDynamicLinkTapped), for: .touchUpInside)
        createLinkButton.translatesAutoresizingMaskIntoConstraints = false
        
        testStorageButton = UIButton(type: .system)
        testStorageButton.setTitle("Test Storage", for: .normal)
        testStorageButton.backgroundColor = .systemGreen
        testStorageButton.setTitleColor(.white, for: .normal)
        testStorageButton.layer.cornerRadius = 8
        testStorageButton.addTarget(self, action: #selector(testStorageTapped), for: .touchUpInside)
        testStorageButton.translatesAutoresizingMaskIntoConstraints = false
        
        clearDataButton = UIButton(type: .system)
        clearDataButton.setTitle("Clear All Data", for: .normal)
        clearDataButton.backgroundColor = .systemRed
        clearDataButton.setTitleColor(.white, for: .normal)
        clearDataButton.layer.cornerRadius = 8
        clearDataButton.addTarget(self, action: #selector(clearDataTapped), for: .touchUpInside)
        clearDataButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews
        view.addSubview(statusLabel)
        view.addSubview(createLinkButton)
        view.addSubview(testStorageButton)
        view.addSubview(clearDataButton)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Status label
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Create link button
            createLinkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createLinkButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 50),
            createLinkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createLinkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createLinkButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Test storage button
            testStorageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testStorageButton.topAnchor.constraint(equalTo: createLinkButton.bottomAnchor, constant: 20),
            testStorageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            testStorageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            testStorageButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Clear data button
            clearDataButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearDataButton.topAnchor.constraint(equalTo: testStorageButton.bottomAnchor, constant: 20),
            clearDataButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            clearDataButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            clearDataButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func updateStatus() {
        let isInitialized = Bit2ConnectSDK.shared.isSDKInitialized
        statusLabel.text = "SDK Status: \(isInitialized ? "Initialized" : "Not Initialized")"
        statusLabel.textColor = isInitialized ? .systemGreen : .systemRed
    }
    
    // MARK: - Actions
    
    @objc private func createDynamicLinkTapped() {
        let linkData = DynamicLinkData(
            deepLink: "https://example.com/product/123",
            campaign: "summer_sale",
            source: "email",
            medium: "newsletter",
            content: "banner_ad",
            term: "discount",
            customParameters: [
                "user_id": "12345",
                "feature": "premium"
            ],
            socialTitle: "Check out this amazing product!",
            socialDescription: "Get 50% off on all items",
            socialImageUrl: "https://example.com/images/product.jpg",
            androidPackageName: "com.example.app",
            iosBundleId: "com.example.app",
            fallbackUrl: "https://example.com/download"
        )
        
        Bit2ConnectSDK.shared.createDynamicLink(data: linkData) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.showAlert(
                        title: "Dynamic Link Created",
                        message: "Short Link: \(response.shortLink)\nPreview: \(response.previewLink)\nQR Code: \(response.qrCodeUrl)"
                    )
                case .error(let message):
                    self.showAlert(title: "Error", message: message)
                }
            }
        }
    }
    
    @objc private func testStorageTapped() {
        // Test storing data
        let success = Bit2ConnectSDK.shared.storeCustomData(key: "test_key", value: "test_value_\(Date().timeIntervalSince1970)")
        
        if success {
            // Test retrieving data
            if let retrievedValue = Bit2ConnectSDK.shared.getCustomData(key: "test_key") {
                showAlert(title: "Storage Test", message: "Successfully stored and retrieved: \(retrievedValue)")
            } else {
                showAlert(title: "Storage Test", message: "Failed to retrieve stored data")
            }
        } else {
            showAlert(title: "Storage Test", message: "Failed to store data")
        }
    }
    
    @objc private func clearDataTapped() {
        let success = Bit2ConnectSDK.shared.clearCustomData()
        showAlert(
            title: "Clear Data",
            message: success ? "All data cleared successfully" : "Failed to clear data"
        )
    }
    
    // MARK: - Helper Methods
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
