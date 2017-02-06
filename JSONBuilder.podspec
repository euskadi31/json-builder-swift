Pod::Spec.new do |s|
    s.name                      = 'JSONBuilder'
    s.version                   = '0.1.0'
    s.summary                   = 'JSON Builder for Swift 3'
    s.author = {
        'Axel Etcheverry' => 'axel@etcheverry.biz'
    }
    s.source = {
        :git => 'https://github.com/euskadi31/json-builder-swift.git',
        :tag => "v#{s.version}"
    }
    s.requires_arc              = true
    s.source_files              = 'Sources/**/*.swift'
    s.homepage                  = 'https://github.com/euskadi31/json-builder-swift'
    s.license                   = {
        :type => 'MIT',
        :file => 'LICENSE.md'
    }
    s.social_media_url          = 'http://twitter.com/euskadi31'
    s.ios.deployment_target     = '9.0'
    s.osx.deployment_target     = '10.11'
    s.tvos.deployment_target    = '9.0'
end
