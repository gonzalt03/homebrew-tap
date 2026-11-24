cask "plume" do
  version "1.1"
  sha256 "a234059f2912a2882b9c6cd8f4428e72ff120a5f37a014c924c10f61940d17cd"

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
