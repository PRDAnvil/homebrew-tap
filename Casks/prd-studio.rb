cask "prd-studio" do
  version "0.1.0"
  sha256 "8a820f5b03563bd3aa585ba7d6cc0f31a58d9d775c536d4ae0a0f4fcb3e21028"

  url "https://github.com/PRDAnvil/homebrew-tap/releases/download/v#{version}/PRDStudio.dmg"
  name "PRD Studio"
  desc "Editor for prd-toolkit product requirements documents"
  homepage "https://prdanvil.com/"

  depends_on macos: :ventura

  app "PRDStudio.app"

  # Not "~/Library/Application Support/PRD Studio": it holds the change worktrees, git worktrees of
  # the user's own repositories that can carry unmerged work. Deleting them from under git loses that
  # work and leaves the repositories pointing at missing worktrees; remove them with `git worktree`.
  zap trash: [
    "~/Library/Caches/com.prdanvil.prdstudio",
    "~/Library/HTTPStorages/com.prdanvil.prdstudio",
    "~/Library/Preferences/com.prdanvil.prdstudio.plist",
    "~/Library/Saved Application State/com.prdanvil.prdstudio.savedState",
  ]

  caveats <<~EOS
    PRD Studio runs prd-toolkit's scripts with uv and hands builds to Claude Code:
      brew install uv
      claude plugin marketplace add ihistand/claude-plugins
      claude plugin install prd-toolkit@ihistand
  EOS
end
