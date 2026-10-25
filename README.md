# CSCI 3130 — Formal Languages & Automata Theory — Study Pack

Study materials generated from the lecture PDFs in this repository
(`lec1.pdf`–`lec6.pdf`, `Print.pdf`, `quiz1.pdf`).

## Contents

| File | Description |
|------|-------------|
| `cheatsheet.pdf` | **Full-coverage midterm cheat sheet** (A4 landscape, 9pt, 3 columns, 4 pages — print double-sided as 2 sheets). Covers all knowledge points of Lectures 1–6 (Chapters 1–6): sets/functions/relations/graphs, proof techniques, languages & grammars, DFA/NFA + subset construction, state minimization, regular expressions & GTG elimination, regular grammars, closure properties & decision questions, the Pumping Lemma with worked examples, context-free grammars, parsing & ambiguity, grammar transformations, Chomsky & Greibach normal forms, and the CYK algorithm. Hard points (subset construction, GTG elimination, pumping lemma games, CNF conversion, CYK, …) are worked out step by step. |
| `cheatsheet.tex` | LaTeX source of the cheat sheet (recompile with `pdflatex cheatsheet.tex`). |
| `mock_midterm.pdf` | **Mock midterm exam** (English), 8 questions, 100 points, covering all lectures. Part I: questions; Part II: full solutions (Q&A in one PDF). Includes two TikZ state diagrams, a transition table, and a complete CYK table. |
| `mock_midterm.tex` | LaTeX source of the mock midterm. |

## Midterm coverage map

| Question | Topic | Lecture |
|----------|-------|---------|
| 1 | Sets, DeMorgan, induction, contradiction | 1 |
| 2 | Languages, grammars, derivations, equivalence | 1 |
| 3 | DFA design, δ*, minimality | 2 |
| 4 | NFA, subset construction | 2 |
| 5 | Regular expressions, regular grammar → NFA | 3 |
| 6 | Closure properties, product DFA, decision questions, homomorphism | 4 |
| 7 | Pumping lemma (aⁿbⁿ, primes) | 4 |
| 8 | CFG, ambiguity, CNF, CYK | 5–6 |
