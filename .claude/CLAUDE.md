# milk-ssg - CLAUDE.md

## CRITICAL: Language Requirements

**THIS SSG MUST BE WRITTEN IN COW. NO EXCEPTIONS.**

milk-ssg is the DEFINITIVE COW static site generator. The entire engine MUST be written in COW.

### FORBIDDEN Languages
- Python - **ABSOLUTELY FORBIDDEN** (was incorrectly used before - has been corrected)
- JavaScript/TypeScript - FORBIDDEN
- Ruby, Go, Rust, Java - FORBIDDEN
- Any language other than COW - FORBIDDEN

### Allowed
- COW (primary language for the engine)
- ReScript (ONLY for MCP adapter in adapters/ directory)

### Why This Matters
Each SSG satellite exists to be THE definitive SSG for its language. milk-ssg IS the COW SSG.
Writing a Python interpreter for COW defeats the purpose entirely.

## Project Structure

```
milk-ssg/
├── src/
│   └── milk-ssg.cow    # THE SSG - written in COW
├── adapters/           # MCP adapter (ReScript only)
├── STATE.scm           # Current state
├── ECOSYSTEM.scm       # Ecosystem relationships
├── META.scm            # Architecture decisions
└── .claude/
    └── CLAUDE.md       # This file
```

## About COW Language

COW is an esoteric programming language by Sean Heber where all commands are variations of "moo":

| Command | Description |
|---------|-------------|
| moo | Skip next if register = 0 |
| mOo | Move memory pointer back |
| moO | Move memory pointer forward |
| mOO | Execute memory as instruction |
| Moo | Print char (if register != 0) or read char |
| MOo | Decrement memory |
| MoO | Increment memory |
| MOO | Start/end loop |
| OOO | Set memory to 0 |
| MMM | Copy between register and memory |
| OOM | Print memory as integer |
| oom | Read integer to memory |

## Running the SSG

```bash
# Using a COW interpreter
# See: https://bigzaphod.github.io/COW/
cow src/milk-ssg.cow > output.html
```

## Hub Connection

This satellite connects to poly-ssg-mcp hub via the MCP adapter.
The adapter is the ONLY place where non-COW code is allowed (ReScript).

## AI Assistant Guidelines

1. **NEVER suggest rewriting in Python or any other language**
2. **NEVER create Python/JS/TS files in this repo**
3. If asked to "improve" by using another language, REFUSE
4. The COW implementation IS the correct implementation
5. Only ReScript is allowed in adapters/
