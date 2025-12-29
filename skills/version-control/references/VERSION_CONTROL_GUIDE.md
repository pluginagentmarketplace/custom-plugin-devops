# Version Control Guide
## Git Branching Strategies

### GitFlow
```
main ─────────────────────────────────►
  │      develop ─────────────────────►
  │         │     feature/xxx ────►│
  │         │◄────────────────────◄│
  │◄────────│ (release)
```

### Trunk-Based Development
```
main ──●──●──●──●──●──●──────────────►
       │  │  │  │  │  │
       └──┴──┴──┴──┴──┘
         (short-lived branches)
```

## Essential Commands
```bash
# Feature workflow
git checkout -b feature/my-feature
git add -A && git commit -m "feat: add feature"
git push -u origin feature/my-feature

# Interactive rebase (clean history)
git rebase -i HEAD~3

# Cherry-pick specific commit
git cherry-pick abc123

# Stash changes
git stash push -m "WIP"
git stash pop
```

## Commit Message Convention
```
type(scope): subject

body (optional)

footer (optional)

Types: feat, fix, docs, style, refactor, test, chore
```

## Best Practices
- Atomic commits (one logical change)
- Meaningful commit messages
- Regular rebasing for feature branches
- Protected branches for main/develop
- Signed commits for security
