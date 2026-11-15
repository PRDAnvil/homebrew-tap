cask "prd-studio" do
  version "0.3.0"
  sha256 "e6dee898b710a5d3f51695845a4e8a266bff6f2c1b3b18c7e6aa7a297881efe5"

  url "https://github.com/PRDAnvil/homebrew-tap/releases/download/v#{version}/PRDStudio.dmg"
  name "PRD Studio"
  desc "Editor for prd-toolkit product requirements documents"
  homepage "https://prdanvil.com/"

  depends_on macos: :tahoe

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
      claude plugin marketplace add PRDAnvil/prd-toolkit
      claude plugin install prd-toolkit@prdanvil
  EOS
end
