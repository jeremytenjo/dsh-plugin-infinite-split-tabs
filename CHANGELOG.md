# Changelog

## 0.1.0

- Add `pane.splitDown` (`⌘⇧\` / `Ctrl+Shift+\`).
- Add `split(paneId?, axis?)` with `row` / `column`.
- Allow tab drops on all four pane edges.
- Remove the two-pane cap; nested split trees are supported and persisted.
- Flatten the split tree into one CSS Grid so tab bodies stay mounted while nesting.
- Add the left-edge border to every pane, including lower stacked panes.
- Draw a single 1px seam between stacked panes.
