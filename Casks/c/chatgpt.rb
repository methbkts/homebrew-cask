cask "chatgpt" do
  version "1.2025.168,1750471084"
  sha256 "3cc09e8de7c201a9ef1f1224a1a8236da2faae05b072fc7fc2ab5216518980cd"

  url "https://persistent.oaistatic.com/sidekick/public/ChatGPT_Desktop_public_#{version.csv.first}_#{version.csv.second}.dmg",
      verified: "persistent.oaistatic.com/sidekick/public/"
  name "ChatGPT"
  desc "OpenAI's official ChatGPT desktop app"
  homepage "https://chatgpt.com/"

  # Some older items in the Sparkle feed have a more recent pubDate, so it's necessary to
  # work with all of the items in the feed (not just the newest one).
  livecheck do
    url "https://persistent.oaistatic.com/sidekick/public/sparkle_public_appcast.xml"
    strategy :sparkle do |items|
      items.map(&:nice_version)
    end
  end

  auto_updates true
  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "ChatGPT.app"

  uninstall quit: "com.openai.chat"

  zap trash: [
    "~/Library/Application Support/ChatGPT",
    "~/Library/Application Support/com.openai.chat",
    "~/Library/Caches/com.openai.chat",
    "~/Library/HTTPStorages/com.openai.chat",
    "~/Library/HTTPStorages/com.openai.chat.binarycookies",
    "~/Library/Preferences/com.openai.chat.*.plist",
    "~/Library/Preferences/com.openai.chat.plist",
    "~/Library/Saved Application State/com.openai.chat.savedState",
  ]
end
