cask "intellij-idea-ce" do
  arch arm: "-aarch64"

  version "2023.3.4,233.14475.28"
  sha256 arm:   "bd307662302107f45299a7e4a163cde48191eda660747899aff66298aaf5bc3b",
         intel: "724a9a665faf6612ce6723580874098b5cf9daf0700f421ea8b480a570d429d6"

  url "https://download.jetbrains.com/idea/ideaIC-#{version.csv.first}#{arch}.dmg"
  name "IntelliJ IDEA Community Edition"
  name "IntelliJ IDEA CE"
  desc "IDE for Java development - community edition"
  homepage "https://www.jetbrains.com/idea/"

  livecheck do
    url "https://data.services.jetbrains.com/products/releases?code=IIC&latest=true&type=release"
    strategy :json do |json|
      json["IIC"].map do |release|
        "#{release["version"]},#{release["build"]}"
      end
    end
  end

  auto_updates true
  conflicts_with cask: "intellij-idea-ce19"
  depends_on macos: ">= :high_sierra"

  app "IntelliJ IDEA CE.app"
  binary "#{appdir}/IntelliJ IDEA CE.app/Contents/MacOS/idea", target: "idea-ce"

  zap trash: [
    "~/Library/Application Support/JetBrains/IdeaIC#{version.major_minor}",
    "~/Library/Caches/JetBrains/IdeaIC#{version.major_minor}",
    "~/Library/Logs/JetBrains/IdeaIC#{version.major_minor}",
    "~/Library/Preferences/com.jetbrains.intellij.ce.plist",
    "~/Library/Saved Application State/com.jetbrains.intellij.ce.savedState",
  ]
end
