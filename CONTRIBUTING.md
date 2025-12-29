# Contributing to DevOps Automation Plugin

Thank you for your interest in contributing!

## Getting Started

1. Fork the repository
2. Clone your fork
3. Create a feature branch: `git checkout -b feature/your-feature`
4. Make your changes
5. Test locally
6. Commit: `git commit -m "feat: your feature description"`
7. Push: `git push origin feature/your-feature`
8. Open a Pull Request

## Commit Message Format

We use Conventional Commits:

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code formatting
- `refactor:` Code refactoring
- `test:` Test changes
- `chore:` Build/tooling changes

## Code Standards

- Follow SASMP v1.3.0 for agents and skills
- Use Golden Format for skills (assets/scripts/references)
- Include YAML frontmatter in all .md files
- Test changes before submitting PR

## Agent Guidelines

All agents must include:
- `sasmp_version: "1.3.0"`
- `eqhm_enabled: true`
- Proper `tools` declaration
- Clear `description`

## Skill Guidelines

All skills must include:
- `bonded_agent` field
- `bond_type: PRIMARY_BOND` or `SECONDARY_BOND`
- Golden Format directories with real content

## Questions?

Open an issue or contact: plugins@pluginagentmarketplace.com
