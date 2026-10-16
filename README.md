# happy-nut/homebrew-tap

```bash
brew install --cask happy-nut/tap/eve      # keyboard-first markdown notes
brew install --cask happy-nut/tap/kakapo   # desktop review workspace for AI-generated changes
```

Casks track `releases/latest` of each project, so `brew reinstall --cask <name>` gets the newest build.

Both casks link a command as well as an app — `eve` and `kakapo` — so they work from a terminal without a
separate install. Neither build is notarized; the casks drop the quarantine flag on install so Gatekeeper
does not refuse the first launch.

If you already have `kakapo` from npm (`npm i -g @happy-nut/kakapo`), that symlink lives in the same
`bin` directory Homebrew uses, and the two will collide. Remove one before installing the other:
`npm uninstall -g @happy-nut/kakapo`.
