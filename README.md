# Homebrew Tap

Homebrew tap for apps published by `writronic`.

## Install

Install MaCursor with one command:

```bash
brew install --cask writronic/tap/macursor
```

Or tap the repository first, then use the short name:

```bash
brew tap writronic/tap
brew install --cask macursor
```

If you already installed MaCursor from the DMG, quit it and move `/Applications/MaCursor.app` to the Trash before you install it with Homebrew.

## Updates

MaCursor updates itself from inside the app. To update it with Homebrew instead:

```bash
brew update
brew upgrade --cask macursor
```

This tap checks for new releases once a week, so a new version can take up to a week to show up here.

## Uninstall

Open MaCursor and click **Restore** to bring back the default macOS cursors. Then run:

```bash
brew uninstall --cask macursor
```

Add `--zap` to also remove your themes and settings.
