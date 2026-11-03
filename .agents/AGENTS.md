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

# Reading my quotes

- A `>` quote in my message is your own text I'm responding to, not my answer. Don't read words inside it (e.g. a trailing "y." from a cut-off sentence) as a yes/no to a question you asked. Only treat something as approval if I write it outside the quote.

# Verifying claims
  
- When making claims, always cite evidence (URL to docs, file/line specifier, etc.)
- When citing URLs, write out the full URL instead of hyperlinked label so I can easily copy/paste from terminal — this applies to GitHub issues too (never just mention "issue #123", always include the full URL)
- Exception for Linear issues: link them as a hyperlink labeled with the issue ID and title, like Linear's copy format: `[AI-123: Issue title](https://linear.app/...)`. A bare ID or URL doesn't tell me what the issue is about. If this makes copy/paste painful in a terminal, revisit.
- If evidence is helpful to a PR reviewer, paste the URL(s) in a bullet list of "References" at the end of PR body (bold header) before Linear magic words. Do not duplicate a Linear issue URL in References when a `Closes AI-123` or `Ref AI-123` magic keyword already links it.
- When doing research, always include links to documentation that back up findings. Team members need trusted sources to verify claims — don't expect them to take things at face value.
- When unusual errors occur before a third-party service executes our code, check that service's public status page before retrying, batching, or changing our implementation.
- When I say "test", I mean verifying the real behavior end to end, like running the thing and doing a round trip (make a real request, confirm the result landed). Don't answer with unit test commands. Mention unit tests only as a supplement.
- Before proposing or doing an action on a Linear issue, PR, or Slack thread (close, comment, reply, create), re-read its current state in that same turn. I may act on the same objects while we work, so anything read earlier in the session can be stale. When a fact comes from an earlier read, say so.

# Showing work

- When I ask to see a diff, paste it into the reply as a fenced ```diff block. Tool output is not reliably visible to me, and some harnesses collapse it behind a summary line.
- Never write "diff above" or "see above" and point at a command you ran. If it is not in the reply body, I did not see it.
- Same for any other artifact I ask to see: file contents, command output, logs. Add at most a line of commentary, and only where the artifact doesn't speak for itself.
- Anything I need to review before approving (a drafted file, a plan, proposed wording) goes in full in the reply body, or saved to Obsidian. Never only inside a UI element that truncates or collapses it (a summary box, an action prompt, tool output). If I can't read it, I can't approve it.
- When stopping to wait on something (CI run, background job), give an ETA in my local time and what it's based on (e.g. "~6:48pm, the last regression run took 9 min") so I know when to follow up.

# TypeScript

- Prefer pure functions and immutability. Code that reads ambient state (`process.env`, the clock, globals) is fragile and needs stubbing to test, so pass those in as arguments and read them once at the edge (e.g. `ciRunUrl(env)` called with `process.env`). Local mutation inside a function is fine.
- Prefer tiny `if` + `push`/`add` accumulation over clever chains when it reads clearer, but keep larger conditional flows declarative where mutation would obscure the logic.
- Never use `as` casts or `@ts-ignore`. Avoid `@ts-expect-error` wherever possible, it's only acceptable as a last resort when a library has incorrect types. Prefer proper type narrowing and type guards.

# Code comments and naming

- Name a value by what it is. A count is `fooCount`, not `foos`, so nobody wonders whether it holds the items.
- When a field or function has edge cases a reader will ask about (parallel vs sequential, empty responses, off-by-one), give one compact example instead of describing the rule. Two or three lines, kind labels rather than invented dialogue (`text → [Read, Read] → Edit → reasoning → text`, then the resulting counts). Put it once at the canonical definition (schema or type) and have other sites point there.
- Write the comment for clarity first, then trim it. Cut anything the name or code already says, and any "A, not B" where B follows from A.
- Cite behavior from the system we actually run or test, not from a dependency we're phasing out.
- Don't ship a proxy for a metric when the exact value exists somewhere reachable (another file, a different event stream). A proxy that's biased along the axis being compared is worse than leaving the field empty and saying so.

# Pulling

- When I open a message with "ff main", run `git pull --ff` as the very first action, before reading files, fetching issues, or any other work. Not `--rebase`, not `--merge`.

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
- PR hygiene: do not link personal fork or placeholder PRs from an upstream PR unless explicitly requested. GitHub turns those links into discoverable cross-references; link only the canonical upstream PR when it is ready to be referenced.
- Before opening a PR, sync the branch onto the latest base branch (e.g. fetch and merge in the newest `main`) so the PR doesn't open with conflicts against a stale base.
  - If merging the base reveals conflicts: trivial ones you can resolve yourself, but prefer a merge commit from the base branch over a rebase (avoids rewriting history on a branch that may already be pushed).
  - If the conflicts are nontrivial, stop and check in with me before resolving them.
- Default to `--draft` PRs
- Never mark a draft PR ready for review (`gh pr ready`, undrafting) — that decision belongs to a human. Only draft PRs, never undraft them.
- PR title MUST follow conventional commit style (feat:, fix:, chore:, etc.)
- Don't default to bullet lists for describing changes in PR bodies. For small PRs with one primary change, use 1 short paragraph or 1-2 sentences. Bullets are for things scanned independently: multiple meaningful changes, or parallel facts that answer the same question once per harness/module/platform (put that question in a short heading and make every bullet answer it in the same shape). Include output snippets when terminal/UI output changes.
- PR bodies contain only what a reviewer can't get from glancing at the diff. Skip explanations of how a value is computed when the code shows it. Keep where it comes from, why, and what was verified outside CI.
- Verify by linking evidence (commit snapshot, workflow run, screenshot), not by asserting results. Leave specific numbers out unless they change a decision.
- When creating or updating PR bodies with multi-line content via CLI, write the body to a temp file and pass it with `--body-file`. Do not pass escaped `\n` sequences inline because GitHub will render them literally.
- Avoid superflous formatting / sectioning.
- When a PR body has several screenshots, put them side by side in a markdown table (one column each, header row for labels) instead of stacking them, within reason. Stacked images eat vertical space. Never go wider than 3 columns, since the images get too small to read. With more than 3, use a grid (e.g. 2x2) with a bold label row above each image row.
- Write PR bodies, issues, messages, and code comments for readers who have not seen the conversation or planning documents. State decisions and limitations directly without referring to planning or iteration history.
- After pushing commits to a pre-existing PR, check if the PR body needs updating — specifically if any bullet points reference things that are now outdated or inaccurate. Offer to update only if something is wrong or missing that a reviewer would need. Do not add bullets just because new commits were pushed; keep PR bodies minimal. Exception: if any incidental fixes were included alongside the main work, add a bullet for each since they won't be apparent from the PR title.

# Issues

- Use plain-language issue titles. Do not use conventional commit prefixes or commit-style formatting in issue titles.
- Size the body to the change. A small follow-up needs fewer than 3 sentences: where it came up, what's wrong, what to do, with inline links. Save the multi-paragraph provenance, problem, fix shape for issues that are actually complex.

# Writing skills

- In a skill body, ask for a behavior instead of requiring another skill or tool by name, and let the harness pick the tooling. A name is fine as an optional hint. Keep inline anything the skill's correctness depends on, so it still works when the other skill isn't loaded.

# Switching branches

- Prefer the normal repository checkout for day-to-day work and PR reviews. Matt usually works on one local workstream at a time. Don't create a worktree just because another branch is checked out or the workspace is dirty.
- Before switching, verify that the current branch's committed work is pushed. Inspect staged, unstaged, and untracked changes. Leave harmless temporary files in place if they can carry across safely. Stash meaningful in-progress work with a descriptive name and report how to recover it. Ask if the intent is unclear or committed work is unpushed. Never discard changes based on a guess.
  
- Be mindful of local generated files like `node_modules/` when switching branches, reinstall deps when needed

# Unauthenticated tools
  
- For authenticated CLI commands, treat authentication, credential-store, and network errors from a restricted sandbox as inconclusive. If the task needs external access, retry with the appropriate permissions before asking me to reauthenticate. Start with escalation when the command is known to need it. If escalation is rejected, report the rejection rather than claiming the login is broken. Only ask me to reauthenticate when an appropriately permitted attempt still indicates an authentication failure.
- If a tool or resource requires authentication and you cannot access it after checking the permission boundary, stop and tell me. Never proceed by making assumptions in lieu of reading the actual resource.

# Dotfiles git workflow

- For dotfiles changes under `$HOME`, use the `dot` command for all git operations (`status`, `diff`, `add`, `commit`, `push`) instead of plain `git`.
- `dot` is the wrapper for the bare repo at `$HOME/.dotfiles.git` with work tree `$HOME`.
- Never run `dot status` with untracked scanning across `$HOME` (`--untracked-files=all`, `--untracked-files=normal`, `-u`, etc.).
- Use `dot status` by default; only check specific paths when you need to inspect untracked files.

# Session titles

In a new session, rename it before your first tool call. The auto-generated
title is always wrong, so do this without being asked.

Keep the title current for the whole session. Before starting work that
changes the category (e.g. 💬 Discussion → 🔨 Build when a skill or request
moves from planning to implementing) or the subject (the topic drifted),
rename first, then continue.

Use `<emoji> <Category> - <subject> [- <qualifier>]`. Subject is 3-5 words,
lowercase. Qualifier only to tell near-identical sessions apart (PR number,
person, phase, repo). Leave untagged when nothing fits.

- 🔨 Build - writing a change
- 👀 Review - reading a diff
- 📊 Research - finding out what's true, from code, data, or people
- 💬 Discussion - working out what we should do
- 📝 Draft - copy that goes to humans
- 🏠 Meta - how I work, my own tooling and setup
- 🧭 Triage - what's next, what's waiting

🔨 Build - branch cost elicitation - PR 402
👀 Review - search_docs rereview - Pedro
