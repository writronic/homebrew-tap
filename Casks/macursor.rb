cask "macursor" do
  version "2.6.5"
  sha256 "7b527579720eb7b14caea6f2ad0925d8a29ffde9860ea1574c663be1ae6f8d41"

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
