cask "eve" do
  version :latest
  sha256 :no_check

  url "https://github.com/happy-nut/eve/releases/latest/download/Eve-macos-arm64.zip"
  name "Eve"
  desc "Fast, keyboard-first markdown notes with a global hotkey"
  homepage "https://github.com/happy-nut/eve"

  depends_on arch: :arm64

  app "Eve.app"
  # the notes from a terminal: eve help, eve search …, eve open … (the same commands Claude gets over MCP)
  binary "#{appdir}/Eve.app/Contents/MacOS/eve"

  # a reinstall must not leave the old Eve running (hidden, no Dock icon) on files that are gone
  uninstall quit: "dev.happynut.eve"

  # not notarized: drop the quarantine flag so Gatekeeper lets it open
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Eve.app"]
  end
end
