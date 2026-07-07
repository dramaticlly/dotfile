# CLAUDE.md

Guidance for future Claude Code sessions working in this repo.

## Intent

Personal dotfiles that must stay **generic and portable** across machines
(personal laptop, work laptop, sandboxes, fresh CWS instances). Anything
company-specific, host-specific, or credential-bearing lives *outside* this
repo and is loaded via untracked local overrides.

## How it deploys

Managed by [RCM](https://github.com/thoughtbot/rcm). `rcup -d $(pwd)` symlinks
each top-level file/dir into `$HOME` with a `.` prefix:

- `alias` → `~/.alias`
- `gitconfig` → `~/.gitconfig`
- `local.zsh` → `~/.local.zsh` (entry point sourced from `~/.zshrc`)
- `scripts/` → `~/.scripts/` (per-file symlinks; new files need another `rcup`)
- `zsh/`, `aws/`, `fzf/`, `tmux.conf`, `vimrc`, etc.

`rcrc` controls excludes. `README.md` documents the user-facing install flow;
this file documents the *maintenance* intent.

## Scope — what belongs here

- Editor / shell / git / tmux config that works on any Unix machine.
- Aliases and functions that are **generic** (git shortcuts, date/uuid helpers,
  grep defaults).
- Small, self-contained scripts under `scripts/` that use only stdlib tools.

## Scope — what does NOT belong here

Do not commit any of the following. If a change adds one of these, push back
and suggest the local-override pattern instead:

- **Company-specific CLIs, workspaces, or hostnames** (e.g. Snowflake `sf`,
  `hozhang-0521`, vault URLs, internal endpoints). These change per employer /
  per month and pollute the repo.
- **Absolute paths to vendor binaries** (e.g. `/usr/local/bin/sf`,
  `/Applications/SnowSQL.app/...`). Rely on `PATH` and let each machine resolve.
- **Credentials, tokens, or anything sourced from AWS/GCP/Snowflake auth flows.**
- **Machine-local paths** (`$HOME/workspace/...` hardcoded outside a function).

Note: as of 2026-07 the `alias` file still contains a `#sf ws` block
(`WORKSPACE`, `snowsql`) and `gitconfig` has a Snowflake identity + `sf __ssh`
core.sshCommand. These are historical drift, not endorsed patterns. Prefer
moving them to local overrides during future edits rather than adding more.

## Local override pattern

Anything machine- or company-specific goes in an untracked file that
`local.zsh` (or another entry point) sources if present. Examples already in
use:

- `~/.awscredentials` — sourced by `local.zsh` for AWS env vars.
- Personal `~/.zshrc.local` / `~/.gitconfig.local` — add via `[include]` in
  gitconfig or an `[ -f ... ] && source` guard in `local.zsh`.

When a user asks to add something company-specific, suggest the override
pattern first. Only vendor it into the repo if it's truly generic.

## Editing conventions

- Prefer editing an existing file over creating a new one.
- Group aliases by topic with a `# section` header comment (see `alias`).
- Functions belong in `alias` too (it's sourced as shell code, not parsed as
  literal aliases). Split into `zsh/functions.zsh` only if `alias` exceeds
  ~150 lines.
- Scripts in `scripts/` must be executable (`chmod +x`) and use stdlib only —
  they must run on a fresh sandbox with no `pip install`.
- Do not add `README.md` or top-level docs unless the user asks.

## After making changes

Remind the user to run `rcup -d $(pwd)` if a new file or symlink target was
added. Existing symlinked files don't need re-linking — edits flow through.
