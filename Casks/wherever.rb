cask "wherever" do
  version "0.1.0"
  sha256 "131c361cdc87c63181fe75f3c89b4b602e2ebae98042bd497a5e3a0a18eff1fe"

  url "https://github.com/writronic/Wherever/releases/download/v#{version}/Wherever.dmg"
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
