;;; PLAYBOOK.scm — milk-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; Operational playbook for milk-ssg development and maintenance

(define-module (milk-ssg playbook)
  #:export (workflows runbooks escalation-paths quality-gates))

;; ============================================================================
;; WORKFLOWS - Standard operating procedures
;; ============================================================================

(define workflows
  '((development
     ((name . "COW Development Workflow")
      (trigger . "New feature or fix required")
      (steps
       (("1-understand" . "Read existing COW code in src/milk-ssg.cow")
        ("2-plan" . "Map ASCII values and character transitions")
        ("3-implement" . "Write COW commands (moo variations only)")
        ("4-test" . "Run: just test or cow src/milk-ssg.cow")
        ("5-verify" . "Check output HTML is valid")
        ("6-commit" . "Use conventional commits")))
      (outputs . ("Modified .cow files" "Updated tests"))))

    (adapter-development
     ((name . "ReScript Adapter Workflow")
      (trigger . "MCP adapter changes needed")
      (location . "adapters/src/")
      (steps
       (("1-edit" . "Modify MilkAdapter.res")
        ("2-build" . "Run: just adapter-build")
        ("3-test" . "Run: just adapter-test")
        ("4-security" . "Verify no command injection possible")))
      (constraints . ("ReScript ONLY" "No SSG logic in adapter"))))

    (security-review
     ((name . "Security Review Workflow")
      (trigger . "PR or scheduled audit")
      (steps
       (("1-sast" . "CodeQL scan via CI")
        ("2-deps" . "Dependabot alerts review")
        ("3-injection" . "Check for command injection in adapter")
        ("4-secrets" . "Verify no secrets in code")))))

    (release
     ((name . "Release Workflow")
      (trigger . "Version milestone reached")
      (steps
       (("1-changelog" . "Update CHANGELOG.md")
        ("2-version" . "Bump version in STATE.scm and package.json")
        ("3-test" . "Run: just test-all")
        ("4-tag" . "Create git tag vX.Y.Z")
        ("5-release" . "Create GitHub release")
        ("6-notify" . "Update ecosystem.scm if needed")))))))

;; ============================================================================
;; RUNBOOKS - Emergency and operational procedures
;; ============================================================================

(define runbooks
  '((incident-security
     ((name . "Security Incident Response")
      (severity . "P0")
      (steps
       (("1-assess" . "Evaluate vulnerability scope and impact")
        ("2-contain" . "If exploitable, consider yanking release")
        ("3-fix" . "Develop patch with input validation")
        ("4-verify" . "Security review of fix")
        ("5-release" . "Emergency patch release")
        ("6-disclose" . "Coordinated disclosure per SECURITY.md")))
      (contacts . ("security@hyperpolymath.org"))))

    (incident-ci-failure
     ((name . "CI Pipeline Failure")
      (severity . "P1")
      (steps
       (("1-identify" . "Check GitHub Actions logs")
        ("2-reproduce" . "Run: just test locally")
        ("3-fix" . "Correct COW syntax or adapter code")
        ("4-verify" . "Push fix and confirm CI passes")))))

    (cow-interpreter-issue
     ((name . "COW Interpreter Compatibility")
      (severity . "P2")
      (description . "When COW code works in one interpreter but not another")
      (steps
       (("1-document" . "Note which interpreters fail")
        ("2-analyze" . "Check for edge cases in mOO instruction")
        ("3-workaround" . "Use portable COW subset")
        ("4-document" . "Update compatibility notes")))))))

;; ============================================================================
;; ESCALATION PATHS
;; ============================================================================

(define escalation-paths
  '((security
     ((path . ("Reporter" "Security Team" "Maintainer"))
      (sla . "48 hours initial response")
      (channel . "GitHub Security Advisory")))

    (bugs
     ((path . ("Community" "Maintainer"))
      (sla . "7 days triage")
      (channel . "GitHub Issues")))

    (features
     ((path . ("Proposer" "Community Discussion" "Maintainer"))
      (sla . "No SLA")
      (channel . "GitHub Discussions")))))

;; ============================================================================
;; QUALITY GATES
;; ============================================================================

(define quality-gates
  '((pre-commit
     ((checks . ("COW syntax valid" "No forbidden languages in src/"
                 "SPDX headers present"))
      (automated . #t)
      (blocking . #t)))

    (pre-merge
     ((checks . ("CI passes" "CodeQL clean" "Security review for adapter changes"))
      (automated . #t)
      (blocking . #t)))

    (pre-release
     ((checks . ("All tests pass" "CHANGELOG updated" "Version bumped"
                 "No critical/high vulnerabilities"))
      (automated . #f)
      (blocking . #t)))))

;; ============================================================================
;; COW LANGUAGE REFERENCE (for developers)
;; ============================================================================

(define cow-reference
  '((commands
     ((moo . "Skip next instruction if register = 0")
      (mOo . "Move memory pointer back one cell")
      (moO . "Move memory pointer forward one cell")
      (mOO . "Execute value in current memory cell as instruction")
      (Moo . "If register = 0, read char to memory; else print ASCII")
      (MOo . "Decrement current memory cell by 1")
      (MoO . "Increment current memory cell by 1")
      (MOO . "Start loop if memory != 0; end loop marker")
      (OOO . "Set current memory cell to 0")
      (MMM . "Copy between register and current memory cell")
      (OOM . "Print memory cell value as integer")
      (oom . "Read integer from input to memory cell")))

    (tips
     (("character-output" . "Set memory to ASCII value, MMM to copy to register, Moo to print")
      ("loops" . "MOO...MOO creates a loop while memory != 0")
      ("arithmetic" . "Use MoO/MOo to increment/decrement for ASCII math")))))
