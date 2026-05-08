# Citing claims

When making claims or presenting research, always to to provide URLs to evidence of your claims from trusted sources like docs pages, GitHub permalinks, blog posts or tweets.
I will not take your word for things usually without evidence.

# Commits

Follow https://conventionalcommits.org/
One line only, only include body in rare cases where additional context is essential.

# PRs

When asked to open a PR:
- Make sure you're on a branch like `feat/something`, `chore/something`, etc. in the vein of semantic commits
- Default to `--draft` PRs
- PR title MUST follow semantic commit style (feat:, fix:, chore:, etc.)

PR bodies should be ultra concise, 1-3 bullets of the changes without going too deep in the weeds.
Avoid superflous formatting / sectioning.
Cite sources (e.g. docs URLS) that motivate/validate changes when possible.

# Issues

Use plain-language issue titles. Do not use conventional commit prefixes or commit-style formatting in issue titles.

# Dotfiles git workflow

For dotfiles changes under `$HOME`, use the `dot` command for all git operations (`status`, `diff`, `add`, `commit`, `push`) instead of plain `git`.

`dot` is the wrapper for the bare repo at `$HOME/.dotfiles.git` with work tree `$HOME`.

Never run `dot status` with untracked scanning across `$HOME` (`--untracked-files=all`, `--untracked-files=normal`, `-u`, etc.).
Use `dot status` by default; only check specific paths when you need to inspect untracked files.
