cask "bytewell" do
  version "1.2.2"
  sha256 "b6ca0448c74f6cdfb12ba775028e1e3f39d35dbb277b769e0386e5ccfc192f6b"

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
