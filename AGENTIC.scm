;;; AGENTIC.scm — milk-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; AI agent collaboration patterns for milk-ssg

(define-module (milk-ssg agentic)
  #:export (agent-capabilities collaboration-patterns constraints))

;; ============================================================================
;; AGENT CAPABILITIES - What AI agents can do with this project
;; ============================================================================

(define agent-capabilities
  '((permitted
     ((code-review
       ((scope . "All files")
        (actions . ("Analyze COW logic" "Check security" "Suggest improvements"))))

      (documentation
       ((scope . "*.md *.adoc *.scm")
        (actions . ("Generate" "Update" "Translate" "Explain"))))

      (adapter-development
       ((scope . "adapters/src/*.res")
        (actions . ("Write ReScript" "Debug" "Optimize" "Security hardening"))
        (constraints . ("No SSG logic" "Security validation required"))))

      (testing
       ((scope . "tests/ .github/workflows/")
        (actions . ("Generate test cases" "Write CI configs" "Debug failures"))))

      (cow-analysis
       ((scope . "src/*.cow")
        (actions . ("Explain" "Trace execution" "Calculate outputs"
                    "Verify ASCII math" "Document character sequences"))))

      (build-tooling
       ((scope . "Justfile Mustfile *.ncl")
        (actions . ("Create" "Modify" "Optimize" "Document"))))))

    (restricted
     ((cow-engine-modification
       ((reason . "COW code must be human-authored for authenticity")
        (exception . "Bug fixes with explicit human approval")
        (requirement . "Human must verify ASCII math is correct")))

      (language-substitution
       ((reason . "milk-ssg MUST be COW - no language changes")
        (forbidden . ("Suggest Python" "Suggest JavaScript" "Any non-COW engine"))
        (enforcement . "Absolute rejection")))

      (secrets-handling
       ((reason . "Security policy")
        (forbidden . ("Generate API keys" "Store credentials" "Access secrets"))))))))

;; ============================================================================
;; COLLABORATION PATTERNS - How agents should interact
;; ============================================================================

(define collaboration-patterns
  '((code-review-pattern
     ((trigger . "PR opened or review requested")
      (steps
       (("1-context" . "Read STATE.scm, META.scm to understand project state")
        ("2-scope" . "Identify changed files and their purposes")
        ("3-language" . "Verify COW-only in src/, ReScript-only in adapters/")
        ("4-security" . "Check adapter for injection vulnerabilities")
        ("5-feedback" . "Provide specific, actionable comments")))))

    (debugging-pattern
     ((trigger . "Issue reported or test failure")
      (steps
       (("1-reproduce" . "Understand expected vs actual output")
        ("2-trace" . "For COW: trace memory/register state step by step")
        ("3-identify" . "Find incorrect ASCII value or command sequence")
        ("4-suggest" . "Propose fix with arithmetic explanation")))))

    (documentation-pattern
     ((trigger . "New feature or clarification needed")
      (steps
       (("1-read" . "Check existing docs for style and format")
        ("2-draft" . "Write in project voice (technical, concise)")
        ("3-cross-ref" . "Link to related SCM files and docs")
        ("4-validate" . "Ensure accuracy of COW command references")))))

    (security-pattern
     ((trigger . "Security review or vulnerability report")
      (steps
       (("1-scope" . "Focus on adapter code - COW engine has no I/O concerns")
        ("2-check" . "Validate all input sanitization in MilkAdapter.res")
        ("3-test" . "Consider injection vectors: path, file parameters")
        ("4-harden" . "Add validation if missing")
        ("5-document" . "Update security notes")))))))

;; ============================================================================
;; CONSTRAINTS - Hard limits for all agent interactions
;; ============================================================================

(define constraints
  '((language-rules
     ((rule . "COW is mandatory for SSG engine")
      (enforcement . "ABSOLUTE - no exceptions")
      (rationale . "milk-ssg exists to BE the COW SSG, not to use COW")))

    (security-rules
     ((input-validation . "All adapter inputs MUST be sanitized")
      (command-execution . "Never interpolate unsanitized strings into commands")
      (secrets . "Never commit or log secrets")))

    (quality-rules
     ((spdx-headers . "All source files MUST have SPDX headers")
      (documentation . "Changes must include doc updates when applicable")
      (testing . "Adapter changes require test coverage")))

    (collaboration-rules
     ((transparency . "Agents must explain reasoning in comments")
      (scope . "Stay within requested task boundaries")
      (escalation . "Flag ambiguous situations for human decision")))))

;; ============================================================================
;; TOOL INTEGRATION - MCP and other tool patterns
;; ============================================================================

(define tool-integration
  '((mcp-adapter
     ((purpose . "Connect milk-ssg to poly-ssg-mcp hub")
      (tools
       (("milk_build" . "Build site by running COW interpreter")
        ("milk_interpret" . "Run arbitrary .cow file")
        ("milk_version" . "Return version and language info")))
      (security . "All paths validated via sanitizePath()")))

    (ci-integration
     ((platform . "GitHub Actions")
      (workflows . ("ci.yml" "codeql.yml"))
      (automation . ("Syntax check" "Language enforcement" "Security scan"))))

    (local-tooling
     ((justfile . "Primary command runner")
      (mustfile . "Required checks before operations")
      (asdf . "Version management via .tool-versions")))))
