;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — milk-ssg
;;
;; Architecture decisions, development practices, and design rationale

(define-module (milk-ssg meta)
  #:export (architecture-decisions development-practices design-rationale
            language-rules project-structure tooling))

;; ============================================================================
;; LANGUAGE RULES - Non-negotiable
;; ============================================================================

(define language-rules
  '((mandatory-language . "COW")
    (enforcement-level . "absolute")
    (rationale . "Each SSG satellite is the DEFINITIVE implementation for its language. milk-ssg IS the COW SSG.")
    (violations
     ("Python implementation" . "FORBIDDEN - was incorrectly done, has been corrected")
     ("JavaScript/TypeScript" . "FORBIDDEN")
     ("Ruby/Go/Rust/Java" . "FORBIDDEN")
     ("Any non-COW language" . "FORBIDDEN - defeats the purpose of this satellite"))
    (correct-implementation
     (engine . "src/milk-ssg.cow")
     (interpreter . "Any COW interpreter (https://bigzaphod.github.io/COW/)")
     (mcp-adapter . "adapters/src/MilkAdapter.res (ReScript - only exception)"))))

;; ============================================================================
;; ARCHITECTURE DECISION RECORDS
;; ============================================================================

(define architecture-decisions
  '((adr-001
     (title . "COW-Only Implementation")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "SSG satellites must be in their target language")
     (decision . "milk-ssg is written entirely in COW")
     (consequences . ("Esoteric programming" "Educational value" "Unique challenge")))

    (adr-002
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Part of hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers")))

    (adr-003
     (title . "ReScript MCP Adapter")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "Need to connect to poly-ssg-mcp hub")
     (decision . "Use ReScript for adapter layer only")
     (consequences . ("Consistent with other satellites" "TypeScript-like safety" "Compiles to ES6")))

    (adr-004
     (title . "Security-First Adapter Design")
     (status . "accepted")
     (date . "2025-12-17")
     (context . "Adapter executes shell commands with user input")
     (decision . "Mandatory input sanitization via sanitizePath()")
     (consequences . ("Prevents command injection" "Blocks path traversal" "Whitelists safe characters")))))

;; ============================================================================
;; DEVELOPMENT PRACTICES
;; ============================================================================

(define development-practices
  '((code-style
     (languages . ("COW for engine" "ReScript for adapter"))
     (cow-commands . "moo mOo moO mOO Moo MOo MoO MOO OOO MMM OOM oom")
     (cow-comments . "Use ; at start of line for comments")
     (rescript-style . "Standard ReScript conventions"))

    (security
     (sast . "CodeQL for workflow scanning")
     (secrets . "Environment variables only, never hardcoded")
     (input-validation . "sanitizePath() for all user inputs in adapter")
     (ci-checks . "Automated security validation in CI"))

    (testing
     (cow-testing . "Interpreter output verification against expected HTML")
     (adapter-testing . "ReScript compilation + runtime validation")
     (e2e-testing . "Full build pipeline validation")
     (ci-testing . "Automated via GitHub Actions"))

    (documentation
     (scm-files . ("STATE.scm" "META.scm" "ECOSYSTEM.scm" "PLAYBOOK.scm" "AGENTIC.scm" "NEUROSYM.scm"))
     (build-docs . ("Justfile" "Mustfile" "cookbook.adoc"))
     (standards . ("README.adoc" "SECURITY.md" "CONTRIBUTING.md")))

    (versioning
     (scheme . "SemVer 2.0.0")
     (tracking . "STATE.scm metadata section"))))

;; ============================================================================
;; PROJECT STRUCTURE
;; ============================================================================

(define project-structure
  '((directories
     (("src/" . "COW engine source (ONLY .cow files)")
      ("adapters/" . "MCP adapter (ONLY ReScript)")
      (".github/" . "CI/CD workflows and templates")
      (".well-known/" . "Web standards files")
      (".claude/" . "AI assistant configuration")))

    (key-files
     (("src/milk-ssg.cow" . "THE SSG engine")
      ("adapters/src/MilkAdapter.res" . "MCP adapter source")
      ("Justfile" . "Command recipes")
      ("Mustfile" . "Mandatory checks")
      ("cookbook.adoc" . "Command reference")
      ("STATE.scm" . "Current project state")
      ("META.scm" . "This file - architecture decisions")
      ("ECOSYSTEM.scm" . "Ecosystem relationships")
      ("PLAYBOOK.scm" . "Operational procedures")
      ("AGENTIC.scm" . "AI agent patterns")
      ("NEUROSYM.scm" . "Neurosymbolic patterns")))))

;; ============================================================================
;; TOOLING
;; ============================================================================

(define tooling
  '((required
     (("just" . "Command runner - just.systems")
      ("cow" . "COW interpreter - bigzaphod.github.io/COW/")
      ("node" . "Node.js 20+ for adapter build")
      ("npm" . "Package manager for adapter")))

    (optional
     (("asdf" . "Version management")
      ("must" . "Mustfile runner (or use just)")))

    (ci-tools
     (("github-actions" . "CI/CD platform")
      ("codeql" . "SAST scanning")
      ("dependabot" . "Dependency updates")))))

;; ============================================================================
;; DESIGN RATIONALE
;; ============================================================================

(define design-rationale
  '((why-cow
     "COW is an esoteric programming language by Sean Heber.
      All instructions are variations of 'moo'.
      milk-ssg demonstrates that even esoteric languages can build websites.
      This is both a technical achievement and an artistic statement.")

    (why-not-python
     "Python was INCORRECTLY used before. This violated the core principle:
      each satellite SSG must BE in its target language, not just interpret it.
      A Python interpreter for COW is not a COW SSG - it's a Python SSG.")

    (why-rescript-adapter
     "The adapter bridges to the MCP hub ecosystem.
      ReScript provides type safety and compiles to JavaScript.
      This is consistent with other poly-ssg satellite adapters.
      The adapter contains NO SSG logic - only execution wrapper.")

    (why-comprehensive-ci
     "Security and language enforcement must be automated.
      CI prevents accidental introduction of forbidden languages.
      Security checks ensure adapter remains safe.
      This protects the project's integrity.")))
