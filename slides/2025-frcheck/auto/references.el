;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "references"
 (lambda ()
   (LaTeX-add-bibitems
    "sainsbury2024likelihood"
    "ono2024effect"
    "olafsdottir2019geographical"
    "gabry2024cmdstanr"
    "pagel2012forecasting"))
 '(or :bibtex :latex))

