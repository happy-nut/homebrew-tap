cask "eve" do
  version :latest
  sha256 :no_check

  url "https://github.com/happy-nut/eve/releases/latest/download/Eve-macos-arm64.zip"
  name "Eve"
  desc "Fast, keyboard-first markdown notes with a global hotkey"
  homepage "https://github.com/happy-nut/eve"

  depends_on arch: :arm64

  app "Eve.app"

  caveats <<~EOS
    Eve is not notarized. If macOS refuses to open it:
      xattr -dr com.apple.quarantine /Applications/Eve.app
    or install with: brew install --cask --no-quarantine happy-nut/tap/eve
  EOS
end
