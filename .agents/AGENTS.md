# Local instruction loading
- Codex: ALWAYS read `~/.agents/AGENTS.local.md` at the start of each session
- Claude Code: already imported by `~/.claude/CLAUDE.md`.
- OpenCode: already loaded via `~/.config/opencode/opencode.jsonc`.

# Agent memory
- "Agent memory" or just "memory" refers to the `.md` instruction files under `~/.agents/` which are loaded as context in each session.
- `~/.agents/AGENTS.md` is shared, version-controlled memory and would be committed to the dotfiles repo when changed intentionally.
- `~/.agents/AGENTS.local.md` is local/personal memory for machine-specific instructions. Do not stage or commit it.


# Verifying claims
  
- When making claims, always cite evidence (URL to docs, file/line specifier, etc.)
- When citing URLs, write out the full URL instead of hyperlinked label so I can easily copy/paste from terminal — this applies to GitHub issues too (never just mention "issue #123", always include the full URL)
- If evidence is helpful to a PR reviewer, paste the URL(s) in a bullet list of "References" at the end of PR body (bold header) before Linear magic words.
- When doing research, always include links to documentation that back up findings. Team members need trusted sources to verify claims — don't expect them to take things at face value.

# Commits
  
- Don't commit to default branch (e.g. `main`, `master`, `develop`), instead checkout a feature branch with semantic names like `feat/my-feature`, `chore/some-bump`, etc.
- When switching back to the default branch, prefer pulling with `--ff` to not create merge commits
- Keep commit messages brief and follow https://conventionalcommits.org and git history conventions
- Don't include a body in commit messages except in rare scenarios where links to web content is necessary context. Prefer putting bodies in the PR instead.
- Avoid `--amend` when adding separate concerns, prefer creating new commit(s)

# Pushing
  
- Only push when explicitly instructed — opening a PR does not imply permission to push subsequent commits.
- If a push is needed (e.g. to include commits in an existing PR), say so and ask the user to push rather than attempting it without permission.
- Never update PR metadata (body, title, labels) or post replies to review threads before the relevant commits are pushed; the remote must reflect the changes first so reviewers can verify.
- Avoid force pushing
- If force pushing is necessary, prefer `--force-with-lease`
- If push fails because of new work on remote, try `git pull --ff --rebase` to update local branch + attempt rebase of local commits in one command

Prefer existing commit-scope patterns from the repository, and if none are established, omit the scope rather than inventing one.

# PRs

- Make sure you're on a branch like `feat/something`, `chore/something`, etc. in the vein of conventional commits
- Default to `--draft` PRs
- PR title MUST follow conventional commit style (feat:, fix:, chore:, etc.)
- PR bodies should be ultra concise, 1-3 bullets of the changes without going too deep in the weeds.
- Avoid superflous formatting / sectioning.
- Cite sources (e.g. docs URLS) that motivate/validate changes when possible.
- After pushing commits to a pre-existing PR, check if the PR body needs updating — specifically if any bullet points reference things that are now outdated or inaccurate. Offer to update only if something is wrong or missing that a reviewer would need. Do not add bullets just because new commits were pushed; keep PR bodies minimal. Exception: if any incidental fixes were included alongside the main work, add a bullet for each since they won't be apparent from the PR title.

# Issues

- Use plain-language issue titles. Do not use conventional commit prefixes or commit-style formatting in issue titles.

# Switching branches
  
- Be mindful of local generated files like `node_modules/` when switching branches, reinstall deps when needed

# Unauthenticated tools
  
- If a tool or resource requires authentication and you cannot access it, stop immediately and tell the user. Never proceed by making assumptions in lieu of reading the actual resource.

# Dotfiles git workflow

- For dotfiles changes under `$HOME`, use the `dot` command for all git operations (`status`, `diff`, `add`, `commit`, `push`) instead of plain `git`.
- `dot` is the wrapper for the bare repo at `$HOME/.dotfiles.git` with work tree `$HOME`.
- Never run `dot status` with untracked scanning across `$HOME` (`--untracked-files=all`, `--untracked-files=normal`, `-u`, etc.).
- Use `dot status` by default; only check specific paths when you need to inspect untracked files.
