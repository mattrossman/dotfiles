# Local instruction loading
- Codex: ALWAYS read `~/.agents/AGENTS.local.md` at the start of each session
- Claude Code: already imported by `~/.claude/CLAUDE.md`.
- OpenCode: already loaded via `~/.config/opencode/opencode.jsonc`.

# Agent memory
- "Agent memory" or just "memory" refers to the `.md` instruction files under `~/.agents/` which are loaded as context in each session.
- `~/.agents/AGENTS.md` is shared, version-controlled memory and would be committed to the dotfiles repo when changed intentionally.
- `~/.agents/AGENTS.local.md` is local/personal memory for machine-specific instructions. Do not stage or commit it.

# Installing tooling
- Ask first before installing a skill or any global/user-scope tooling (anything writing outside the current repo, e.g. `~/.claude`, `~/.agents`); local project deps (`pnpm install` etc.) don't need to ask.

# Verifying claims
  
- When making claims, always cite evidence (URL to docs, file/line specifier, etc.)
- When citing URLs, write out the full URL instead of hyperlinked label so I can easily copy/paste from terminal — this applies to GitHub issues too (never just mention "issue #123", always include the full URL)
- If evidence is helpful to a PR reviewer, paste the URL(s) in a bullet list of "References" at the end of PR body (bold header) before Linear magic words. Do not duplicate a Linear issue URL in References when a `Closes AI-123` or `Ref AI-123` magic keyword already links it.
- When doing research, always include links to documentation that back up findings. Team members need trusted sources to verify claims — don't expect them to take things at face value.
- When unusual errors occur before a third-party service executes our code, check that service's public status page before retrying, batching, or changing our implementation.

# TypeScript

- Prefer tiny `if` + `push`/`add` accumulation over clever chains when it reads clearer, but keep larger conditional flows declarative where mutation would obscure the logic.
- Never use `as` casts or `@ts-ignore`. Avoid `@ts-expect-error` wherever possible, it's only acceptable as a last resort when a library has incorrect types. Prefer proper type narrowing and type guards.

# Commits

- Do not commit during feature work unless explicitly asked. Leave changes uncommitted so Matt can review the full diff in VS Code's built-in Source Control view before deciding what to commit.
- Do not commit new follow-up changes unless explicitly asked to commit that specific change. Permission to commit current work before starting another change does not carry forward to later changes.
- Don't commit to default branch (e.g. `main`, `master`, `develop`), instead checkout a feature branch with semantic names like `feat/my-feature`, `chore/some-bump`, etc.
- When switching back to the default branch, prefer pulling with `--ff` to not create merge commits
- Keep commit messages brief and follow https://conventionalcommits.org and git history conventions
- Prefer existing commit-scope patterns from the repository, and if none are established, omit the scope rather than inventing one.
- Don't include a body in commit messages except in rare scenarios where links to web content is necessary context. Prefer putting bodies in the PR instead.
- Avoid `--amend` when adding separate concerns, prefer creating new commit(s)

# Pushing
  
- Only push when explicitly instructed — opening a PR does not imply permission to push subsequent commits.
- If a push hasn't been authorized and one is needed, say so rather than pushing without permission. Permission granted for a multi-step operation ("commit and push") covers the whole sequence.
- Never update PR metadata (body, title, labels) or post replies to review threads before the relevant commits are pushed; the remote must reflect the changes first so reviewers can verify.
- Avoid force pushing
- If force pushing is necessary, prefer `--force-with-lease`
- If push fails because of new work on remote, try `git pull --ff --rebase` to update local branch + attempt rebase of local commits in one command

# Outbound communication

- Treat code/git operations and human communication as separate permissions. Permission to commit, push, open/update a PR, or update a branch does not imply permission to post PR comments, review replies, issue comments, Slack messages, emails, Linear comments, or any other outward-facing message.
- Before posting or updating public/shared human-facing communication on Matt's behalf, ask explicitly unless Matt has specifically requested that exact message/action in the current turn.
- Drafting proposed wording is fine when useful, but do not send/post it without explicit approval.

# PRs

- Make sure you're on a branch like `feat/something`, `chore/something`, etc. in the vein of conventional commits
- Before opening a PR, sync the branch onto the latest base branch (e.g. fetch and merge in the newest `main`) so the PR doesn't open with conflicts against a stale base.
  - If merging the base reveals conflicts: trivial ones you can resolve yourself, but prefer a merge commit from the base branch over a rebase (avoids rewriting history on a branch that may already be pushed).
  - If the conflicts are nontrivial, stop and check in with me before resolving them.
- Default to `--draft` PRs
- Never mark a draft PR ready for review (`gh pr ready`, undrafting) — that decision belongs to a human. Only draft PRs, never undraft them.
- PR title MUST follow conventional commit style (feat:, fix:, chore:, etc.)
- Don't default to bullet lists in PR bodies. For small PRs with one primary change, use 1 short paragraph or 1-2 sentences. Use bullets only when there are multiple meaningful changes worth scanning independently. Include output snippets when terminal/UI output changes.
- When creating or updating PR bodies with multi-line content via CLI, write the body to a temp file and pass it with `--body-file`. Do not pass escaped `\n` sequences inline because GitHub will render them literally.
- Avoid superflous formatting / sectioning.
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
