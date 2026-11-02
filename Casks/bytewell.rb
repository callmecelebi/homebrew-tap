cask "bytewell" do
  version "1.3.5"
  sha256 "8e7cb28b40564844dad5c7c127acba11608223227015ec740cbccb65a907d843"

  url "https://updates.axleno.com/bytewell/Bytewell-#{version}.dmg"
  name "Bytewell"
  desc "Disk analyzer and safe cleanup for developers and local AI users"
  homepage "https://bytewell.app/"

  livecheck do
    url "https://updates.axleno.com/bytewell/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # Bytewell updates itself (Sparkle)
  auto_updates true
  depends_on macos: :sequoia

  app "Bytewell.app"
  binary "#{appdir}/Bytewell.app/Contents/Helpers/bytewell"

  zap trash: [
    "~/Library/Application Support/Bytewell",
    "~/Library/Preferences/com.axleno.Bytewell.plist",
  ]
end
