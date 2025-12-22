;;; STATE.scm — milk-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; Current project state and completion tracking

(define-module (milk-ssg state)
  #:export (metadata components completion roadmap))

;; ============================================================================
;; METADATA
;; ============================================================================

(define metadata
  '((version . "1.1.0")
    (updated . "2025-12-22")
    (project . "milk-ssg")
    (required-language . "COW")
    (license . "AGPL-3.0-or-later")))

(define language-enforcement
  '((primary-language . "COW")
    (file-extension . ".cow")
    (forbidden-languages . ("Python" "JavaScript" "TypeScript" "Ruby" "Go" "Rust" "Java"))
    (adapter-exception . "ReScript in adapters/ only")
    (rationale . "milk-ssg is the DEFINITIVE COW static site generator. It MUST be written entirely in COW.")
    (enforcement . "strict")
    (ci-enforced . #t)))

;; ============================================================================
;; COMPONENT STATUS (44/44 Template Adapted for COW)
;; ============================================================================

(define current-position
  '((phase . "v1.1.0 - Full Project Structure Complete")
    (overall-completion . 100)

    (components
     ;; 1. Core Engine (4/4)
     ((category . "Core Engine")
      (count . "4/4")
      (items
       (("COW Engine" . "src/milk-ssg.cow" . "complete")
        ("HTML Generation" . "COW ASCII math" . "complete")
        ("Character Output" . "MMM + Moo pattern" . "complete")
        ("Interpreter Support" . "Any COW interpreter" . "complete"))))

     ;; 2. Build System (4/4)
     ((category . "Build System")
      (count . "4/4")
      (items
       (("Justfile" . "Command recipes" . "complete")
        ("Mustfile" . "Mandatory checks" . "complete")
        ("CI/CD" . ".github/workflows/ci.yml" . "complete")
        ("Tool Versions" . ".tool-versions (asdf)" . "complete"))))

     ;; 3. Adapters (3/3)
     ((category . "Adapters")
      (count . "3/3")
      (items
       (("ReScript Adapter" . "adapters/src/MilkAdapter.res" . "complete")
        ("MCP Tools" . "milk_build, milk_interpret, milk_version" . "complete")
        ("Security" . "sanitizePath() input validation" . "complete"))))

     ;; 4. Documentation (8/8)
     ((category . "Documentation")
      (count . "8/8")
      (items
       (("README" . "README.adoc" . "complete")
        ("Cookbook" . "cookbook.adoc" . "complete")
        ("Security Policy" . "SECURITY.md" . "complete")
        ("Contributing" . "CONTRIBUTING.md" . "complete")
        ("Code of Conduct" . "CODE_OF_CONDUCT.md" . "complete")
        ("Adapter Docs" . "adapters/README.md" . "complete")
        ("AI Instructions" . ".claude/CLAUDE.md" . "complete")
        ("Copilot Instructions" . "copilot-instructions.md" . "complete"))))

     ;; 5. SCM Files (6/6)
     ((category . "SCM Architecture")
      (count . "6/6")
      (items
       (("STATE" . "STATE.scm" . "complete")
        ("META" . "META.scm" . "complete")
        ("ECOSYSTEM" . "ECOSYSTEM.scm" . "complete")
        ("PLAYBOOK" . "PLAYBOOK.scm" . "complete")
        ("AGENTIC" . "AGENTIC.scm" . "complete")
        ("NEUROSYM" . "NEUROSYM.scm" . "complete"))))

     ;; 6. Testing (4/4)
     ((category . "Testing")
      (count . "4/4")
      (items
       (("Syntax Check" . "just test-syntax" . "complete")
        ("Language Enforcement" . "just test-language" . "complete")
        ("E2E Tests" . "just test-e2e" . "complete")
        ("CI Testing" . "GitHub Actions" . "complete"))))

     ;; 7. Security (5/5)
     ((category . "Security")
      (count . "5/5")
      (items
       (("Input Sanitization" . "sanitizePath()" . "complete")
        ("Command Injection Prevention" . "Regex validation" . "complete")
        ("SAST Scanning" . "CodeQL" . "complete")
        ("Dependency Updates" . "Dependabot" . "complete")
        ("Security Policy" . "SECURITY.md + security.txt" . "complete"))))

     ;; 8. Configuration (3/3)
     ((category . "Configuration")
      (count . "3/3")
      (items
       (("Environment" . ".env.example" . "complete")
        ("Git Attributes" . ".gitattributes" . "complete")
        ("Git Ignore" . ".gitignore" . "complete"))))

     ;; 9. Standards Compliance (7/7)
     ((category . "Standards")
      (count . "7/7")
      (items
       (("AIBDP" . ".well-known/aibdp.json" . "complete")
        ("AI Policy" . ".well-known/ai.txt" . "complete")
        ("Security.txt" . ".well-known/security.txt" . "complete")
        ("Dublin Core" . ".well-known/dc.xml" . "complete")
        ("Humans.txt" . ".well-known/humans.txt" . "complete")
        ("Provenance" . ".well-known/provenance.json" . "complete")
        ("Consent" . ".well-known/consent-required.txt" . "complete")))))))

;; ============================================================================
;; BLOCKERS AND ISSUES
;; ============================================================================

(define blockers-and-issues
  '((critical ())
    (high-priority ())
    (resolved
     (("SECURITY.md template placeholders" . "fixed 2025-12-17")
      ("Command injection in MilkAdapter" . "fixed 2025-12-17")
      ("Unnecessary dependabot ecosystems" . "fixed 2025-12-17")
      ("Missing SCM files" . "added 2025-12-22")
      ("Missing Justfile/Mustfile" . "added 2025-12-22")
      ("Incomplete CI/CD" . "fixed 2025-12-22")))))

;; ============================================================================
;; ROADMAP
;; ============================================================================

(define roadmap
  '((completed
     (("v1.0.0" . "Initial COW implementation")
      ("v1.0.1" . "Security hardening")
      ("v1.1.0" . "Full project structure - 44/44 components")))

    (next
     (("v1.2.0" . "COW interpreter integration tests")
      ("v1.3.0" . "Extended HTML generation (more pages)")
      ("v2.0.0" . "Template support in COW")))

    (future
     (("Hub integration" . "Connect to poly-ssg-mcp")
      ("Multi-page support" . "Multiple .cow files")
      ("Content pipeline" . "Input file processing")))))

;; ============================================================================
;; SESSION HISTORY
;; ============================================================================

(define session-history
  '((snapshots
     ((date . "2025-12-22")
      (session . "full-structure")
      (notes . "Added 44/44 component structure: PLAYBOOK.scm, AGENTIC.scm, NEUROSYM.scm, Justfile, Mustfile, cookbook.adoc, comprehensive CI/CD, hooks"))
     ((date . "2025-12-17")
      (session . "security-review")
      (notes . "Fixed SECURITY.md placeholders, command injection in MilkAdapter.res, cleaned dependabot.yml"))
     ((date . "2025-12-16")
      (session . "language-fix")
      (notes . "Rewrote from Python to pure COW. Enforced language requirements.")))))

;; ============================================================================
;; STATE SUMMARY
;; ============================================================================

(define state-summary
  '((project . "milk-ssg")
    (version . "1.1.0")
    (language . "COW")
    (completion . "44/44 components")
    (blockers . 0)
    (security-status . "hardened")
    (ci-status . "comprehensive")
    (documentation . "complete")
    (updated . "2025-12-22")))
