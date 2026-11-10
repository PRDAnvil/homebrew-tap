# PRDAnvil Homebrew Tap

The Homebrew tap for [PRD Studio](https://prdanvil.com), a native macOS app for writing and
running [prd-toolkit](https://github.com/ihistand/claude-plugins) product requirements documents.
Requires macOS 13 (Ventura) or later.

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
[Claude Code](https://claude.com/claude-code) with the prd-toolkit plugin installed:

```bash
brew install uv
claude plugin marketplace add ihistand/claude-plugins
claude plugin install prd-toolkit@ihistand
```

### With Incise (optional)

With [Incise](https://incise.dev) installed through Homebrew (see
[its tap](https://github.com/Incise-App/homebrew-tap)), Open in Incise opens the repository there, and
Build in Claude Code opens it with the build command copied, to paste into Incise's terminal. With
Incise 1.16 or later and Settings ▸ Agents ▸ "Enable Agent Integration (MCP)" turned on, PRD Studio
also sees unsaved edits in Incise and shows diffs in its diff view. The App Store edition of Incise
doesn't offer these.

## Uninstall

```bash
brew uninstall --cask prd-studio          # the app
brew uninstall --cask --zap prd-studio    # also its preferences and caches
```

Neither removes `~/Library/Application Support/PRD Studio`: it holds the change worktrees, git
worktrees of your own repositories that can carry unmerged work. Remove a worktree you no longer need
with `git worktree remove` in its repository.

## Releases

Each release's notarized DMG is attached to this repository's
[GitHub releases](https://github.com/PRDAnvil/homebrew-tap/releases); the cask in `Casks/` points at it.
