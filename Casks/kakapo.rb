cask "kakapo" do
  version :latest
  sha256 :no_check

  url "https://github.com/happy-nut/kakapo/releases/latest/download/Kakapo-arm64.dmg"
  name "Kakapo"
  desc "Desktop review workspace for reading AI-generated code changes"
  homepage "https://github.com/happy-nut/kakapo"

  depends_on arch: :arm64
  depends_on :macos

  app "Kakapo.app"
  # kakapo is run IN a repository — `kakapo .` — so the command is the product and the icon is the extra.
  # The shim inside the bundle runs the same CLI the npm package installs, hosted on the bundle's own
  # Electron, because a packaged install has no node and no node_modules/electron.
  binary "#{appdir}/Kakapo.app/Contents/Resources/app/bin/kakapo-bundled.sh", target: "kakapo"

  # Not notarized, and Homebrew quarantines what it downloads, so without this every launch is a Gatekeeper
  # refusal. This runs in PREflight, while the bundle is still in the staged path, because install steps
  # resolve their paths against :staged_path and a step's `args` take no appdir token — the staged copy is
  # the only spelling available here. It is the same bundle the `app` stanza then moves into appdir, so the
  # flag is already gone by the time it lands there. eve.rb does the same.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "."], chdir: "Kakapo.app"
  end

  # a reinstall must not leave the old app running on a review whose files have moved underneath it
  uninstall quit: "dev.happynut.kakapo"
end
