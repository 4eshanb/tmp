# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'HW_9-CSCI-571' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for HW_9-CSCI-571
  pod 'Alamofire', '~> 5.0.0-rc.3'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'Highcharts', '~> 9.2.2' 
  pod 'Toast-Swift', '~> 5.0.0'
  pod 'SwiftSpinner'

  target 'HW_9-CSCI-571Tests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'HW_9-CSCI-571UITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            # Needed for building for simulator on M1 Macs
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
end
