cask "creality-print" do
  arch arm: "-macx-arm64"

  on_arm do
    version "5.1.7.10514"
    sha256 "a45d861399ef48110aaffa76a94972c780bd06177121f818127af810534b135e"

    url "https://github.com/CrealityOfficial/CrealityPrint/releases/download/v#{version.csv.first.major_minor_patch}/Creality_Print-v#{version.csv.first}#{arch}-Release.dmg",
        verified: "github.com/CrealityOfficial/CrealityPrint/"
  end
  on_intel do
    version "6.0.2.1574"
    sha256 "aaf78d1f0fb96d3ceccc7a6fc14430899bf429f0d338cf62fe3dffbbcbbeca8e"

    url "https://github.com/CrealityOfficial/CrealityPrint/releases/download/v#{version.csv.first.major_minor_patch}/CrealityPrint_#{version.csv.first}_Release.dmg",
        verified: "github.com/CrealityOfficial/CrealityPrint/"
  end

  name "Creality Print"
  desc "Slicer and cloud services for some Creality FDM 3D printers"
  homepage "https://www.creality.com/pages/download-software"

  livecheck do
    url :homepage
    regex(/href=.*?Creality[._-]?Print[._-]v?(\d+(?:\.\d+)+)#{arch}[._-]Release\.dmg/i)
  end

  depends_on macos: ">= :catalina"

  app "Creality Print.app"

  zap trash: [
    "~/Library/Application Support/Creality",
    "~/Library/Caches/Creality",
    "~/Library/Saved Application State/com.creality.crealityprint.savedState",
  ]
end
