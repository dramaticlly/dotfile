# Tmux Config Update Summary (2026-04-01)

Based on review of snowflake-eng/dev-config commit fabef557 (chan's cloud workspace config).

## Problem
`C-a` prefix conflicted with Claude Code's `Ctrl-A` readline binding (jump to beginning of line).

## Prefix: `C-a` → `C-Space`
- No conflict with Claude Code, vim, or shell readline
- `C-Space` twice → last-window (same muscle memory as old `C-a C-a`)

## Nested Tmux (Local Mac + Cloud Workspace)
- Local Mac: `C-Space` prefix
- Cloud workspace (via `sf ws ssh`): default `C-b` (no config needed on remote)
- `C-Space` then `C-b` sends `C-b` to inner tmux if needed

## New Features (from chan's config)
- **Mouse support** — scroll, click panes, drag-resize borders
- **Shift+Arrow pane switching** — no prefix needed, great during Claude sessions
- **Resize panes** — `prefix + H/J/K/L` (repeatable)
- **OSC 52 clipboard** — copy works over SSH to cloud workspaces natively
- **Heavy pane borders** — pane index + command name displayed at top
- **`tmux-256color`** terminal (was `screen-256color`)
- **Base index 1** — windows/panes start at 1
- **Sync panes toggle** — `prefix + s`

## Removed Plugins
- `tmux-yank` → replaced by OSC 52 (`set -s set-clipboard on`)
- `tmux-copycat` → tmux built-in search is sufficient

## Key Bindings Quick Reference
| Binding | Action |
|---|---|
| `C-Space` | Prefix |
| `C-Space C-Space` | Last window |
| `C-Space \|` or `C-Space \` | Split horizontal |
| `C-Space -` | Split vertical |
| `C-Space h/j/k/l` | Select pane (vim keys) |
| `Shift+Arrow` | Select pane (no prefix) |
| `C-Space H/J/K/L` | Resize pane |
| `C-Space r` | Reload config |
| `C-Space s` | Toggle sync panes |
| `C-Space Escape` | Enter copy mode |
| `C-Space C-b` | Send C-b to inner tmux |

## To Apply
```
tmux source-file ~/.tmux.conf
```
Or `prefix + r` from within tmux. Restart tmux if prefix key doesn't take effect.
