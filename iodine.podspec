Pod::Spec.new do |s|
s.name             = "iodine"
s.version          = "0.1"
s.summary          = "iodine is a Reactive MVVM framework base on ReactiveCocoa"
s.homepage         = "https://github.com/delanoir/iodine"
s.license          = 'MIT'
s.author           = { "Karolis Stasaitis" => "stkarolis@gmail.com" }
s.source           = { :git => "https://github.com/delanoir/iodine.git", :tag => 0.1 }

s.platform     = :ios, '8.0'
s.requires_arc = true

s.source_files = 'iodine/'
s.dependency 'ReactiveCocoa'
s.dependency 'ReactiveViewModel'
end
