# PRDAnvil Homebrew Tap

The Homebrew tap for [PRD Studio](https://prdanvil.com), a native macOS app for writing and
running [prd-toolkit](https://github.com/ihistand/claude-plugins) product requirements documents.

## Install

```bash
brew tap prdanvil/tap
brew trust prdanvil/tap
brew install --cask prd-studio
```

The `brew trust` step is required. Homebrew will not load a cask from a third-party tap until the tap
is trusted, so without it the install stops rather than completing. It is a one-time step per tap, not
per release.

## Update

```bash
brew upgrade --cask prd-studio
```

PRD Studio does not update itself yet, so this is how a new release arrives.

## What it needs

PRD Studio works on prd-toolkit PRDs in your git repositories. It runs the toolkit's scripts with
[uv](https://docs.astral.sh/uv/), uses `git`, and hands builds to
[Claude Code](https://claude.com/claude-code) with the prd-toolkit plugin installed. With
[Incise](https://incise.dev) installed through Homebrew, it can open files and show diffs there.

## Releases

Each release's notarized DMG is attached to this repository's
[GitHub releases](https://github.com/PRDAnvil/homebrew-tap/releases); the cask in `Casks/` points at it.
