cask "bytewell" do
  version "1.4.6"
  sha256 "8f2ed6cead1382eff94880d206e878d0037f976ea4b55ee5c7446f6cfd9feaca"

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
