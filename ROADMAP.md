# Roadmap

## 0.2 — a true dynamic plugin

The current release is a source patch because the split renderer is not pluggable:

- `ui-dockkit` is statically linked into the Web shell, not a dynamic plugin row.
- `ui-sidebar-right` owns the `rightbar` seat, the split store, and the
  `sidebarRight` / `sidebarRightTabs` services.

To make this installable with `dsh plugin add`, the plugin needs to either:

1. **Vendor the sidebar and dockkit** into one dynamic plugin package (patched
   `TabLayout`/engine + a copy of the sidebar controller), disable the shipped
   `ui-sidebar-right` row in the profile, provide the same services and tab seats,
   and keep the shipped file/terminal/browser tab providers working.
2. **Upstream a smaller extension point** that lets an embedder supply the dock
   renderer and split-axis policy. Upstream currently does not accept external
   pull requests, so this would start as a GitHub Discussion proposal.

Until then, the source patch is the supported distribution.

## Reference review PR

- [jeremytenjo/deepseek-harness#1 — feat(sidebar): split down and unbounded nested panes](https://github.com/jeremytenjo/deepseek-harness/pull/1)

This is a draft PR in the contributor's fork, not against upstream: `deepseek-ai/deepseek-harness`
disables external pull requests (`CONTRIBUTING.md`, `has_pull_requests: false`). It records the
same 24-file source diff that is packaged in `patches/0001-right-sidebar-infinite-splits.patch`.
