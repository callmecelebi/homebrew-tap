cask "bytewell" do
  version "1.2.9"
  sha256 "535ccdfc4a61be2a0f85a4ece86005418d944ce4517953839fc9bdb5ebfbb19d"

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
