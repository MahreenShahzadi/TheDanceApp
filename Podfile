# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TheDanceApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TheDanceApp

  target 'TheDanceAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TheDanceAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end


pod 'Alamofire'
pod 'FBSDKLoginKit'
pod 'SideMenu', '~> 5.0.0'
pod 'GoogleSignIn'
pod 'FacebookCore'
pod 'CircleProgressBar', '~> 0.32’
pod 'DropDown'
pod 'iOSDropDown'
pod 'AlignedCollectionViewFlowLayout'





end
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
