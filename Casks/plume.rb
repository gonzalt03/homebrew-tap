cask "plume" do
  version "1.2"
  sha256 "a80578ebddf987778f14ba1a4838f6172aacccf446b1622adf7a6c9ec6752ea6"

  url "https://github.com/gonzalt03/plume/releases/download/v#{version}/Plume-#{version}.dmg"
  name "Plume"
  desc "Fix, rephrase or translate any selected text with Claude"
  homepage "https://github.com/gonzalt03/plume"

  auto_updates true
  depends_on macos: ">= :ventura"

  app "Plume.app"

  # App non notariée : retire la quarantaine pour éviter le blocage de Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Plume.app"]
  end

  uninstall quit: "local.plume"

  zap trash: [
    "~/Library/Preferences/local.plume.plist",
    "~/Library/Logs/Plume.log",
  ]
end
