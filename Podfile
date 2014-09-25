pod 'ReactiveCocoa'
pod 'ReactiveViewModel'

target 'iodineTests' do
    
    inhibit_all_warnings!

    pod 'Specta', '~> 0.2.1'
    pod 'Expecta'
    
    post_install do |installer|
        target = installer.project.targets.find { |t| t.to_s == "Pods-iodineTests-Specta" }
        if (target)
            target.build_configurations.each do |config|
                s = config.build_settings['FRAMEWORK_SEARCH_PATHS']
                s = [ '$(inherited)' ] if s == nil;
                s.push('$(PLATFORM_DIR)/Developer/Library/Frameworks')
                config.build_settings['FRAMEWORK_SEARCH_PATHS'] = s
            end
            else
            puts "WARNING: Pods-iodineTests-Specta target not found"
        end
    end
end
