Pod::Spec.new do |s|
s.name         = "CustomRefreshTabView" # 项目名称
s.version      = "1.0.2"        # 版本号 与 你仓库的 标签号 对应
s.license      = "MIT"          # 开源证书
s.summary      = "A delightful frame change easy" # 项目简介

s.homepage     = "https://github.com/jjcmwangxinyu/CustomRefreshTabView" #
s.source       = { :git => "https://github.com/jjcmwangxinyu/CustomRefreshTabView.git", :tag => s.version.to_s }#你的仓库地址，不能用SSH地址
s.source_files = "CustomRefreshTabView/**/*"
s.requires_arc = true # 是否启用ARC
s.platform     = :ios, "8.0" #平台及支持的最低版本
s.dependency 'MJRefresh'

# User
s.author             = { "jjcmwangxinyu" => "951494812@qq.com" } # 作者信息

end
