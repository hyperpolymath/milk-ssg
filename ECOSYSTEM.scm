;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; ECOSYSTEM.scm — milk-ssg
;;
;; Ecosystem relationships and positioning

(define-module (milk-ssg ecosystem)
  #:export (identity position relationships integration))

;; ============================================================================
;; PROJECT IDENTITY
;; ============================================================================

(define identity
  '((name . "milk-ssg")
    (version . "1.1.0")
    (type . "satellite-ssg")
    (purpose . "The DEFINITIVE COW static site generator")
    (tagline . "Esoteric programming meets web development")

    (language-identity
     (primary . "COW")
     (description . "COW is an esoteric language where all commands are variations of 'moo'")
     (creator . "Sean Heber")
     (reference . "https://bigzaphod.github.io/COW/")
     (rationale . "milk-ssg exists to be THE COW SSG. The entire engine is written in COW.")
     (forbidden . ("Python" "JavaScript" "TypeScript" "Ruby" "Go" "Rust" "Java"))
     (exception . "ReScript for MCP adapter only")
     (enforcement . "Absolute. Non-negotiable. Automated CI checks."))))

;; ============================================================================
;; ECOSYSTEM POSITION
;; ============================================================================

(define position
  '((constellation . "poly-ssg")
    (role . "satellite")
    (language-slot . "COW")

    (description
     "milk-ssg is a satellite in the poly-ssg constellation.
      Each satellite is the definitive SSG for its programming language.
      milk-ssg fills the COW language slot.
      It connects to the poly-ssg-mcp hub via its ReScript adapter.")

    (unique-value
     (("esoteric-programming" . "Demonstrates SSG feasibility in esoteric languages")
      ("educational" . "Learn COW through practical application")
      ("artistic" . "Programming as creative expression")
      ("completeness" . "Proves poly-ssg supports ANY language")))))

;; ============================================================================
;; RELATED PROJECTS
;; ============================================================================

(define relationships
  '((hub
     ((name . "poly-ssg-mcp")
      (url . "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship . "hub")
      (description . "Unified MCP server for 28+ SSGs - provides adapter interface")
      (integration . "milk-ssg connects via adapters/src/MilkAdapter.res")
      (differentiation . "poly-ssg-mcp = Hub, milk-ssg = COW satellite")))

    (sibling-satellites
     (((name . "terrapin-ssg")
       (url . "https://github.com/hyperpolymath/terrapin-ssg")
       (language . "Logo")
       (description . "Logo SSG - sibling satellite"))

      ((name . "note-g-ssg")
       (url . "https://github.com/hyperpolymath/note-g-ssg")
       (language . "Note G / Ada")
       (description . "Note G analytical engine SSG"))

      ((name . "forthright-ssg")
       (url . "https://github.com/hyperpolymath/forthright-ssg")
       (language . "Forth")
       (description . "Forth SSG - stack-based sibling"))))

    (standards
     (((name . "rhodium-standard-repositories")
       (url . "https://github.com/hyperpolymath/rhodium-standard-repositories")
       (relationship . "standard")
       (description . "RSR compliance guidelines")
       (level . "Gold target"))))))

;; ============================================================================
;; INTEGRATION POINTS
;; ============================================================================

(define integration
  '((mcp-adapter
     ((location . "adapters/src/MilkAdapter.res")
      (language . "ReScript")
      (compiles-to . "ES6 JavaScript (.mjs)")
      (tools-provided
       (("milk_build" . "Build site with COW interpreter")
        ("milk_interpret" . "Run arbitrary .cow file")
        ("milk_version" . "Get version and language info")))
      (security . "Input sanitization via sanitizePath()")))

    (ci-cd
     ((platform . "GitHub Actions")
      (workflows . ("ci.yml" "codeql.yml"))
      (checks . ("Language enforcement" "Syntax validation" "Security scanning" "Adapter build"))))

    (tooling
     ((command-runner . "Justfile")
      (mandatory-checks . "Mustfile")
      (documentation . "cookbook.adoc")
      (version-management . ".tool-versions (asdf)")))))

;; ============================================================================
;; WHAT THIS IS / IS NOT
;; ============================================================================

(define what-this-is
  '("The DEFINITIVE static site generator written in COW"
    "Outputs HTML using only moo-based commands"
    "Esoteric programming meets web development"
    "Part of the poly-ssg satellite constellation"
    "A working proof that SSGs can be built in ANY language"
    "An artistic and technical statement"))

(define what-this-is-not
  '("NOT a Python interpreter for COW (that would violate language rules)"
    "NOT optional about being in COW"
    "NOT a template that can be reimplemented in other languages"
    "NOT a toy project - it actually generates valid HTML"
    "NOT something that should be 'improved' by rewriting in another language"))
