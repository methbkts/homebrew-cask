cask "milanote" do
  version "3.18.18"
  sha256 "b7eb5ff386067bb3668c0b71738447365fb11c698780d7ec20901fa33981bfb9"

  url "https://milanote-app-releases.s3.amazonaws.com/Milanote-#{version}.dmg",
      verified: "milanote-app-releases.s3.amazonaws.com/"
  name "Milanote"
  desc "Organise your ideas and projects into visual boards"
  homepage "https://www.milanote.com/"

  livecheck do
    url "https://milanote-app-releases.s3.amazonaws.com/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Milanote.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.milanote.app.sfl*",
    "~/Library/Application Support/Milanote",
    "~/Library/Caches/com.milanote.app",
    "~/Library/Caches/com.milanote.app.ShipIt",
    "~/Library/Library/Logs/Milanote",
    "~/Library/Logs/Milanote",
    "~/Library/Preferences/com.milanote.*.plist",
  ]
end
