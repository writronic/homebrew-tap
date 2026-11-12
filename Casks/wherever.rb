cask "wherever" do
  version "0.1.0"
  sha256 "c42e8e1a8bae785578d40f141026f9fbd045e75b7e839c2d0d114065e1ec03d3"

  url "https://github.com/writronic/Wherever/releases/download/v#{version}/Wherever-#{version}.dmg"
  name "Wherever"
  desc "Finds any file on the Mac instantly"
  homepage "https://github.com/writronic/Wherever"

  livecheck do
    url "https://raw.githubusercontent.com/writronic/Wherever/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  app "Wherever.app"

  uninstall quit: ["com.writronic.wherever.helper", "com.writronic.wherever"]

  zap trash: [
    "~/.local/bin/wherever",
    "~/Library/Application Support/com.writronic.wherever",
    "~/Library/Caches/com.writronic.wherever",
    "~/Library/HTTPStorages/com.writronic.wherever",
    "~/Library/Preferences/com.writronic.wherever.helper.plist",
    "~/Library/Preferences/com.writronic.wherever.plist",
  ]
end
