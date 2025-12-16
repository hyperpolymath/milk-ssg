;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — milk-ssg

(define-module (milk-ssg meta)
  #:export (architecture-decisions development-practices design-rationale language-rules))

(define language-rules
  '((mandatory-language . "COW")
    (enforcement-level . "absolute")
    (rationale . "Each SSG satellite is the DEFINITIVE implementation for its language. milk-ssg IS the COW SSG.")
    (violations
     ("Python implementation" . "FORBIDDEN - was incorrectly done, has been corrected")
     ("JavaScript/TypeScript" . "FORBIDDEN")
     ("Any non-COW language" . "FORBIDDEN - defeats the purpose of this satellite"))
    (correct-implementation
     (engine . "src/milk-ssg.cow")
     (interpreter . "Any COW interpreter (https://bigzaphod.github.io/COW/)")
     (mcp-adapter . "adapters/ in ReScript (only exception - adapters are in ReScript/Deno)"))))

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
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers")))))

(define development-practices
  '((code-style
     (languages . ("COW"))
     (commands . "moo mOo moO mOO Moo MOo MoO MOO OOO MMM OOM oom")
     (comments . "Use ; for comments (if interpreter supports)"))
    (security
     (sast . "CodeQL for workflow scanning")
     (credentials . "env vars only"))
    (testing
     (method . "COW interpreter output verification"))
    (versioning
     (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-cow
     "COW is an esoteric programming language by Sean Heber.
      All instructions are variations of 'moo'.
      milk-ssg demonstrates that even esoteric languages can build websites.")
    (why-not-python
     "Python was INCORRECTLY used before. This violated the core principle:
      each satellite SSG must BE in its target language, not just interpret it.")))
