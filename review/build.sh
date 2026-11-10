#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
pandoc lec6_notes.md lec7_notes.md worked_examples.md \
  --from=markdown --standalone --toc --toc-depth=2 \
  --pdf-engine=xelatex --include-in-header=layout.tex \
  -V papersize=a4 -V geometry:margin=20mm -V fontsize=11pt \
  -V mainfont='DejaVu Serif' -V sansfont='DejaVu Sans' \
  -V monofont='DejaVu Sans Mono' -V CJKmainfont='Noto Serif CJK SC' \
  -V colorlinks=true -V urlcolor=blue -V linkcolor=blue \
  -M title='CSCI 3130：Lec 6–7 复习笔记与例题' \
  -M subtitle='CFG 化简与范式 · CYK · PDA · DCFL' \
  -o lec6_7_review.pdf
