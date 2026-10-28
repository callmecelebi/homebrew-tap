cask "bytewell" do
  version "1.2.8"
  sha256 "5fa279ebe207498d45fa48d775d0d363bb025c904bfd3522dc35c476a3ae07cb"

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
