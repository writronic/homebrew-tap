cask "macursor" do
  version "2.7.0"
  sha256 "0cb0241d8f9242be9fcd58a75ef74dbfe510a71fb21286f3f05dfc58e5c36f8c"

  url "https://github.com/writronic/MaCursor/releases/download/v#{version}/MaCursor.dmg"
  name "MaCursor"
  desc "Custom cursor themes"
  homepage "https://github.com/writronic/MaCursor"

  livecheck do
    url "https://raw.githubusercontent.com/writronic/macursor/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  app "MaCursor.app"

  uninstall quit: [
    "com.writronic.macursor",
    "com.writronic.macursor.helper",
  ]

  zap trash: [
    "~/Library/Application Scripts/com.writronic.macursor.finder",
    "~/Library/Application Scripts/SP495GG2KZ.com.writronic.macursor",
    "~/Library/Application Support/MaCursor",
    "~/Library/Caches/com.writronic.macursor",
    "~/Library/Containers/com.writronic.macursor.finder",
    "~/Library/Group Containers/SP495GG2KZ.com.writronic.macursor",
    "~/Library/HTTPStorages/com.writronic.macursor",
    "~/Library/Preferences/ByHost/com.writronic.MaCursor.*.plist",
    "~/Library/Preferences/com.writronic.macursor.helper.plist",
    "~/Library/Preferences/com.writronic.macursor.plist",
  ]
end
