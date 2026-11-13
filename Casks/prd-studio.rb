cask "prd-studio" do
  version "0.2.0"
  sha256 "868b1d0b943db516b767fe1586e312b7f5860e6b0ec60139d72795b6544fe7dc"

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
      claude plugin marketplace add PRDAnvil/prd-toolkit
      claude plugin install prd-toolkit@prdanvil
  EOS
end
