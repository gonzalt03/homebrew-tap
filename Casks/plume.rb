cask "plume" do
  version "1.3"
  sha256 "0e7effaccf7f69fccf238fa977c0871c1290c65f6e7b516e5a41aea7b7f3e8a1"

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
