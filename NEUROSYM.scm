;;; NEUROSYM.scm — milk-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; Neurosymbolic patterns and reasoning structures for milk-ssg

(define-module (milk-ssg neurosym)
  #:export (symbolic-patterns neural-hints reasoning-chains))

;; ============================================================================
;; SYMBOLIC PATTERNS - Formal structures in the codebase
;; ============================================================================

(define symbolic-patterns
  '((cow-instruction-semantics
     ((name . "COW Instruction Set")
      (type . "Formal Language")
      (alphabet . (moo mOo moO mOO Moo MOo MoO MOO OOO MMM OOM oom))
      (semantics
       ((memory-model . "Infinite tape of integer cells, initially 0")
        (register . "Single integer register, initially 0")
        (pointer . "Memory pointer, initially at cell 0")
        (io . "Character I/O via Moo, integer I/O via OOM/oom")))
      (invariants
       (("memory-bounds" . "Pointer can move infinitely in both directions")
        ("value-range" . "Cell values are unbounded integers")
        ("instruction-validity" . "mOO executes cell value modulo 12 as instruction")))))

    (html-generation-pattern
     ((name . "Static HTML Generation")
      (input . "COW source code")
      (output . "HTML string to stdout")
      (process . "Construct ASCII values via arithmetic, print characters")
      (correctness . "Output must be valid HTML5")))

    (adapter-pattern
     ((name . "MCP Adapter Pattern")
      (type . "Bridge/Wrapper")
      (interface . ("connect" "disconnect" "isConnected" "tools"))
      (invariants
       (("no-logic" . "Adapter contains no SSG logic")
        ("security" . "All inputs sanitized before shell execution")
        ("language" . "ReScript compiles to ES6 JavaScript")))))))

;; ============================================================================
;; NEURAL HINTS - Guidance for language models
;; ============================================================================

(define neural-hints
  '((cow-understanding
     ((hint . "COW is Brainfuck-like but with moo-based mnemonics")
      (mapping
       (("moo" . "conditional skip, like BF [ when register=0")
        ("mOo/moO" . "pointer movement, like BF < and >")
        ("MOo/MoO" . "decrement/increment, like BF - and +")
        ("MOO" . "loop markers, like BF [ and ]")
        ("Moo" . "I/O, like BF . and ,")
        ("MMM" . "register<->memory copy, unique to COW")
        ("OOO" . "zero cell, optimization")
        ("mOO" . "self-modifying code, execute cell as instruction")))
      (debugging-tip . "Trace memory state after each instruction")))

    (ascii-math-patterns
     ((hint . "COW generates HTML by computing ASCII values")
      (common-values
       (("< >" . "60, 62 (HTML tags)")
        ("a-z" . "97-122")
        ("A-Z" . "65-90")
        ("0-9" . "48-57")
        ("space" . "32")
        ("newline" . "10")))
      (pattern . "Start with a value, use MoO/MOo to adjust, MMM+Moo to print")))

    (security-patterns
     ((hint . "Adapter security focuses on shell command safety")
      (risks . ("Path traversal via .." "Command injection via ; | &"))
      (mitigations . ("sanitizePath regex validation" ".cow extension check"))
      (safe-pattern . "Whitelist allowed characters, reject everything else")))))

;; ============================================================================
;; REASONING CHAINS - Multi-step reasoning patterns
;; ============================================================================

(define reasoning-chains
  '((cow-to-output
     ((name . "COW Execution Reasoning")
      (steps
       (("1-parse" . "Identify instruction sequence from moo tokens")
        ("2-init" . "memory = [0...], register = 0, pointer = 0")
        ("3-execute" . "For each instruction, update state per semantics")
        ("4-io" . "Moo with register!=0 outputs ASCII char")
        ("5-result" . "Concatenate all output to get HTML string")))
      (verification . "Output should be valid HTML matching comments in .cow")))

    (security-analysis
     ((name . "Adapter Security Reasoning")
      (steps
       (("1-identify" . "Find all points where user input enters system")
        ("2-trace" . "Follow input through to shell execution")
        ("3-validate" . "Check each path has sanitization")
        ("4-test" . "Consider bypass attempts: unicode, encoding, edge cases")
        ("5-conclude" . "Either 'secure' or 'needs hardening with X'")))
      (current-status . "sanitizePath covers alphanumeric, dots, hyphens, underscores, slashes")))

    (language-enforcement
     ((name . "Language Rule Reasoning")
      (premise . "milk-ssg must be written in COW")
      (chain
       (("1-purpose" . "Satellite SSGs prove language X can build an SSG")
        ("2-identity" . "milk-ssg is THE COW SSG in poly-ssg constellation")
        ("3-implication" . "If not in COW, it's not milk-ssg, it's something else")
        ("4-exception" . "Adapters bridge to other systems, so ReScript is allowed there")
        ("5-enforcement" . "Any suggestion to use non-COW is rejected")))
      (conclusion . "COW in src/, ReScript in adapters/, nothing else")))))

;; ============================================================================
;; CONCEPT EMBEDDINGS - Semantic relationships
;; ============================================================================

(define concept-embeddings
  '((project-identity
     ((milk-ssg . ("esoteric" "COW" "static-site-generator" "satellite" "poly-ssg"))
      (cow-language . ("esoteric" "brainfuck-variant" "moo" "turing-complete"))
      (poly-ssg . ("hub" "MCP" "unified" "constellation" "28-languages"))))

    (file-purposes
     ((milk-ssg.cow . ("engine" "core" "html-generation" "COW-code"))
      (MilkAdapter.res . ("bridge" "MCP" "tool-provider" "ReScript"))
      (STATE.scm . ("status" "version" "completion" "blockers"))
      (META.scm . ("architecture" "decisions" "rationale" "rules"))
      (ECOSYSTEM.scm . ("relationships" "position" "related-projects"))))

    (action-intents
     ((build . ("generate" "compile" "output" "HTML"))
      (test . ("verify" "check" "validate" "ensure"))
      (security . ("protect" "sanitize" "validate" "harden"))
      (document . ("explain" "describe" "guide" "reference"))))))
