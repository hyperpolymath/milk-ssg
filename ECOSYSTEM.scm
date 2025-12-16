;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — milk-ssg

(ecosystem
  (version "1.0.0")
  (name "milk-ssg")
  (type "satellite-ssg")
  (purpose "The DEFINITIVE COW static site generator")

  (language-identity
    (primary "COW")
    (description "COW is an esoteric language where all commands are variations of 'moo'")
    (rationale "milk-ssg exists to be THE COW SSG. The entire engine is written in COW.")
    (forbidden ("Python" "JavaScript" "TypeScript" "Ruby" "Go"))
    (enforcement "This is not negotiable. Any non-COW implementation will be rejected."))

  (position-in-ecosystem
    "Satellite SSG in the poly-ssg constellation. Each satellite is the definitive SSG for its language.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28+ SSGs - provides adapter interface")
      (differentiation
        "poly-ssg-mcp = Hub with all SSG adapters via MCP
         milk-ssg = The COW SSG engine"))
    (project
      (name "terrapin-ssg")
      (url "https://github.com/hyperpolymath/terrapin-ssg")
      (relationship "sibling-satellite")
      (description "Logo SSG - another satellite in the constellation"))
    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")))

  (what-this-is
    "- The DEFINITIVE static site generator written in COW
     - Outputs HTML using only moo-based commands
     - Esoteric programming meets web development
     - Part of the poly-ssg satellite constellation")

  (what-this-is-not
    "- NOT a Python interpreter for COW (that would violate language rules)
     - NOT optional about being in COW
     - NOT a template that can be reimplemented in other languages"))
