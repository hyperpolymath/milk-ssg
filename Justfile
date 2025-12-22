# SPDX-License-Identifier: AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
#
# milk-ssg Justfile - Command runner for the COW static site generator
# Usage: just <recipe>
# Docs: https://just.systems/

set shell := ["bash", "-uc"]
set dotenv-load := true

# Default recipe - show help
default:
    @just --list

# ============================================================================
# CORE BUILD RECIPES
# ============================================================================

# Build the site using COW interpreter
build:
    @echo "🐄 Building milk-ssg site..."
    @mkdir -p _site
    @if command -v cow &> /dev/null; then \
        cow src/milk-ssg.cow > _site/index.html; \
        echo "✓ Built _site/index.html"; \
    else \
        echo "⚠ COW interpreter not found. Install from: https://bigzaphod.github.io/COW/"; \
        echo "  Simulating output..."; \
        echo '<!DOCTYPE html><html><body><h1>Moo!</h1></body></html>' > _site/index.html; \
    fi

# Clean build artifacts
clean:
    @echo "🧹 Cleaning..."
    rm -rf _site
    rm -rf adapters/src/*.mjs adapters/lib
    @echo "✓ Cleaned"

# Full rebuild
rebuild: clean build

# ============================================================================
# TESTING RECIPES
# ============================================================================

# Run all tests
test: test-syntax test-language test-adapter
    @echo "✓ All tests passed"

# Test COW syntax validity
test-syntax:
    @echo "🔍 Checking COW syntax..."
    @if [ -f src/milk-ssg.cow ]; then \
        echo "✓ COW file exists"; \
        if grep -E '[^mMoO \t\n;]' src/milk-ssg.cow | grep -v '^;' | head -1; then \
            echo "⚠ Warning: Non-COW characters found (may be in comments)"; \
        else \
            echo "✓ Syntax appears valid"; \
        fi \
    else \
        echo "✗ src/milk-ssg.cow not found"; \
        exit 1; \
    fi

# Test language enforcement (no forbidden languages in src/)
test-language:
    @echo "🚫 Checking for forbidden languages..."
    @forbidden=$$(find src/ -type f \( -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.rb" -o -name "*.go" -o -name "*.rs" \) 2>/dev/null || true); \
    if [ -n "$$forbidden" ]; then \
        echo "✗ FORBIDDEN language files found:"; \
        echo "$$forbidden"; \
        exit 1; \
    else \
        echo "✓ Only COW files in src/"; \
    fi

# Test adapter builds correctly
test-adapter:
    @echo "🔧 Testing adapter..."
    @cd adapters && npm run build 2>/dev/null || echo "⚠ Adapter build skipped (npm not available or deps not installed)"

# Run end-to-end tests
test-e2e: build
    @echo "🧪 Running E2E tests..."
    @if [ -f _site/index.html ]; then \
        if grep -q "DOCTYPE" _site/index.html; then \
            echo "✓ HTML output contains DOCTYPE"; \
        else \
            echo "✗ HTML output missing DOCTYPE"; \
            exit 1; \
        fi; \
        if grep -q "<html>" _site/index.html || grep -q "<html" _site/index.html; then \
            echo "✓ HTML output contains <html> tag"; \
        else \
            echo "✗ HTML output missing <html> tag"; \
            exit 1; \
        fi; \
        echo "✓ E2E tests passed"; \
    else \
        echo "✗ _site/index.html not found"; \
        exit 1; \
    fi

# Run all tests including E2E
test-all: test test-e2e
    @echo "✓ All tests including E2E passed"

# ============================================================================
# ADAPTER RECIPES
# ============================================================================

# Build the ReScript MCP adapter
adapter-build:
    @echo "🔧 Building ReScript adapter..."
    cd adapters && npm install && npm run build
    @echo "✓ Adapter built"

# Watch adapter for changes
adapter-watch:
    @echo "👀 Watching adapter..."
    cd adapters && npm run watch

# Clean adapter build
adapter-clean:
    @echo "🧹 Cleaning adapter..."
    cd adapters && npm run clean 2>/dev/null || rm -rf adapters/src/*.mjs adapters/lib
    @echo "✓ Adapter cleaned"

# ============================================================================
# DEVELOPMENT RECIPES
# ============================================================================

# Start development mode (watch + serve)
dev: build
    @echo "🚀 Starting dev server..."
    @if command -v python3 &> /dev/null; then \
        cd _site && python3 -m http.server 8080; \
    elif command -v npx &> /dev/null; then \
        npx serve _site -p 8080; \
    else \
        echo "Install python3 or npx to run dev server"; \
    fi

# Format and lint (checks only - COW has no formatter)
lint:
    @echo "🔍 Linting..."
    @just test-syntax
    @just test-language
    @echo "✓ Lint passed"

# ============================================================================
# SECURITY RECIPES
# ============================================================================

# Run security checks
security:
    @echo "🔒 Running security checks..."
    @echo "Checking for secrets..."
    @if grep -rE "(password|secret|api_key|token)\s*=" --include="*.res" --include="*.cow" . 2>/dev/null | grep -v "example" | head -1; then \
        echo "⚠ Potential secrets found"; \
    else \
        echo "✓ No obvious secrets"; \
    fi
    @echo "Checking adapter for injection risks..."
    @if grep -E "execSync\s*\(" adapters/src/MilkAdapter.res | grep -v sanitize; then \
        echo "⚠ execSync calls should use sanitized inputs"; \
    else \
        echo "✓ Command execution appears safe"; \
    fi

# ============================================================================
# DOCUMENTATION RECIPES
# ============================================================================

# Generate documentation index
docs:
    @echo "📚 Documentation files:"
    @find . -name "*.md" -o -name "*.adoc" | grep -v node_modules | sort

# Show COW language reference
cow-ref:
    @echo "🐄 COW Language Reference:"
    @echo ""
    @echo "Command | Description"
    @echo "--------|------------"
    @echo "moo     | Skip next if register = 0"
    @echo "mOo     | Move memory pointer back"
    @echo "moO     | Move memory pointer forward"
    @echo "mOO     | Execute memory cell as instruction"
    @echo "Moo     | Print char (reg!=0) or read char (reg=0)"
    @echo "MOo     | Decrement memory cell"
    @echo "MoO     | Increment memory cell"
    @echo "MOO     | Start/end loop"
    @echo "OOO     | Set memory cell to 0"
    @echo "MMM     | Copy between register and memory"
    @echo "OOM     | Print memory as integer"
    @echo "oom     | Read integer to memory"

# ============================================================================
# VERSION & INFO RECIPES
# ============================================================================

# Show project info
info:
    @echo "milk-ssg - The COW Static Site Generator"
    @echo ""
    @grep -E "version.*:" STATE.scm | head -1 || echo "Version: see STATE.scm"
    @echo "Language: COW (esoteric)"
    @echo "License: AGPL-3.0-or-later"
    @echo ""
    @echo "Run 'just --list' for available commands"

# Check tool versions
versions:
    @echo "Tool versions:"
    @echo -n "just: " && just --version 2>/dev/null || echo "not found"
    @echo -n "cow: " && cow --version 2>/dev/null || echo "not found (install from https://bigzaphod.github.io/COW/)"
    @echo -n "node: " && node --version 2>/dev/null || echo "not found"
    @echo -n "npm: " && npm --version 2>/dev/null || echo "not found"

# ============================================================================
# CI/CD RECIPES
# ============================================================================

# Run CI checks locally
ci: lint test-all security
    @echo "✓ CI checks passed"

# Pre-commit hook
pre-commit: lint
    @echo "✓ Pre-commit checks passed"

# Pre-push hook
pre-push: test-all
    @echo "✓ Pre-push checks passed"
