# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Stylit' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Stylit
  pod 'SnapKit', '~> 4.0.0'
  pod 'Koloda'
  pod 'Hero'
  pod 'CollectionKit'
  pod 'CollectionKit/WobbleAnimator'
  pod 'Presentr'
  pod 'PMSuperButton'
  pod 'SCLAlertView'
  pod 'DynamicButton', '~> 6.1.0'

  target 'StylitTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

swift_4_1_pod_targets = ['SnapKit']

post_install do | installer |
    installer.pods_project.targets.each do |target|
        if swift_4_1_pod_targets.include?(target.name)
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.1'
            end
        end
    end
end
