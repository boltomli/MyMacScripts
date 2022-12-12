cask "xstudio" do
  version "3.0.1,4"
  sha256 "0b6a6aa8b4efe21fac865d7c398414aaa0751c86894fe75dc03a5f7581c13d3f"

  url "https://xcloudsingblob.blob.core.chinacloudapi.cn/xstudio-public/production/4/XStudio_Singer_#{version.csv.first}_macOS_x86_64_production_#{version.csv.second}.dmg"
  name "X Studio #{version.major}"
  desc "「歌声从AI开始」"
  homepage "https://singer.xiaoice.com/"

  auto_updates true
  depends_on macos: ">= :catalina"

  app "X Studio #{version.major}.app"
end
