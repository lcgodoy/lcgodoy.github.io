;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "urban-drm"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("standalone" "")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("tikz" "") ("xcolor" "")))
   (TeX-run-style-hooks
    "latex2e"
    "standalone"
    "standalone10"
    "tikz"
    "xcolor")
   (LaTeX-add-xcolor-definecolors
    "mybgcolor"))
 :latex)

