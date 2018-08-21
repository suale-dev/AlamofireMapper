Pod::Spec.new do |s|

  s.name = "AlamofireMapper"
  s.version = "1.0.0"
  s.license = { :type => "MIT"}
  s.summary = "An extension to Alamofire which automatically converts JSON response data into swift objects using Decodeable"
  s.homepage = "https://github.com/sua8051/AlamofireMapper"
  s.author = { "Sua Le" => "sua8051@gmail.com" }
  s.source = { :git => 'https://github.com/sua8051/AlamofireMapper.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.swift_version = '4.0'

  s.requires_arc = true
  s.source_files = 'AlamofireMapper/**/*.swift'
  s.dependency 'Alamofire', '~> 4.1'
end
