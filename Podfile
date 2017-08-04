target 'FictionGenerator' do
    platform :osx, '10.12'
    use_frameworks!

    pod "BrainCore", :git => 'https://github.com/aleph7/BrainCore.git', :tag => '0.4.0'
    pod "Upsurge", :git => 'https://github.com/aleph7/Upsurge', :branch => 'xcode9'

    pod "HDF5Kit", "~> 0.1"
end

target 'FictionGeneratorApp' do
    platform :ios, '10.0'
    use_frameworks!

    pod "BrainCore", :git => 'https://github.com/aleph7/BrainCore.git', :tag => '0.4.0'
    pod "Upsurge", :git => 'https://github.com/aleph7/Upsurge', :branch => 'xcode9'
    pod "HDF5Kit", "~> 0.1"
    pod "Dropper"

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.2'
        end
    end
end
