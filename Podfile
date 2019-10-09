# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Intuit-Github' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Intuit-Github

pod 'IQKeyboardManagerSwift', '~> 6.3'
pod 'Whisper'
pod 'InstantSearchClient', '~> 7.0'


post_install do |installer|
    #print "Setting the default SWIFT_VERSION to 5.0\n"
    installer.pods_project.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '5.0'
    end

    installer.pods_project.targets.each do |target|
        if ['Intuit-Github'].include? "#{target}"
            print "Setting #{target}'s SWIFT_VERSION to 4.0\n"
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        else
            #print "Setting #{target}'s SWIFT_VERSION to Undefined (Xcode will automatically resolve)\n"
            target.build_configurations.each do |config|
                config.build_settings.delete('SWIFT_VERSION')
            end
        end
    end
end

  target 'Intuit-GithubTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Intuit-GithubUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
