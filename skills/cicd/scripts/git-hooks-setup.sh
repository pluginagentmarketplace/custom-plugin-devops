#!/bin/bash
echo "Setting up Git hooks..."
cat > .git/hooks/pre-commit << 'HOOK'
#!/bin/bash
npm run lint && npm test
HOOK
chmod +x .git/hooks/pre-commit
echo "Pre-commit hook installed!"
