# Writing documents

When asked to research, write a report, or give an in depth answer, prefer writing a `.md` file over sharing findings in chat.

When prompted with a feature request or bug triage, assume you need to write a doc about it before making code changes UNLESS a doc for you session already exists OR the bug is reported after you already made code changes.

These docs should live in a timestamped folder for the session.

> If you need a timestamp, use `date +"%Y-%m-%dT%H:%M:%S"`

The folder should live in a .gitignore-ed folder close to your working directory. Globally, we ignore any folder called "ignore/" so prefer placing session folders in "ignore/sessions/"

# Citing claims

When making claims or presenting research, always to to provide URLs to evidence of your claims from trusted sources like docs pages, GitHub permalinks, blog posts or tweets.
I will not take your word for things usually without evidence.

# PRs

When asked to open a PR:
- Make sure you're on a branch like `feat/something`, `chore/something`, etc. in the vein of semantic commits
- Default to `--draft` PRs
- PR title MUST follow semantic commit style (feat:, fix:, chore:, etc.)

PR bodies should be ultra concise, 1-3 bullets of the changes without going too deep in the weeds.
Avoid superflous formatting / sectioning.
Cite sources (e.g. docs URLS) that motivate/validate changes when possible.

# Dotfiles git workflow

For dotfiles changes under `$HOME`, use the `dot` command for all git operations (`status`, `diff`, `add`, `commit`, `push`) instead of plain `git`.

`dot` is the wrapper for the bare repo at `$HOME/.dotfiles.git` with work tree `$HOME`.

Never run `dot status` with untracked scanning across `$HOME` (`--untracked-files=all`, `--untracked-files=normal`, `-u`, etc.).
Use `dot status` by default; only check specific paths when you need to inspect untracked files.
