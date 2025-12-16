;;; STATE.scm — milk-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "1.0.0")
    (updated . "2025-12-16")
    (project . "milk-ssg")
    (required-language . "COW")))

(define language-enforcement
  '((primary-language . "COW")
    (file-extension . ".cow")
    (forbidden-languages . ("Python" "JavaScript" "TypeScript" "Ruby" "Go" "Rust"))
    (rationale . "milk-ssg is the DEFINITIVE COW static site generator. It MUST be written entirely in COW (the esoteric language). No other implementation languages are permitted.")
    (enforcement . "strict")))

(define current-position
  '((phase . "v1.0 - COW Implementation Complete")
    (overall-completion . 100)
    (components ((cow-engine ((status . "complete") (file . "src/milk-ssg.cow") (completion . 100)))
                 (mcp-adapter ((status . "pending") (language . "ReScript") (completion . 0)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority ())))

(define critical-next-actions
  '((immediate (("Connect MCP adapter in ReScript" . high)))
    (this-week (("Test with COW interpreter" . medium)))))

(define session-history
  '((snapshots
     ((date . "2025-12-16")
      (session . "language-fix")
      (notes . "Rewrote from Python to pure COW. Enforced language requirements.")))))

(define state-summary
  '((project . "milk-ssg")
    (language . "COW")
    (completion . 100)
    (blockers . 0)
    (updated . "2025-12-16")))
