---
title: Introduction
author: Edward O'Callaghan
---

..Some example content..

```latex
% Copyright © 2012 Edward O'Callaghan. All Rights Reserved.
\ProvidesPackage{texstyle}

%\RequirePackage[l2tabu, orthodox]{nag}

\usepackage{geometry, setspace, graphicx, enumerate, cancel}
\usepackage{amsthm, amsfonts, amsmath, amssymb}
\usepackage{listings}
\usepackage{color}
\usepackage{sidecap}
%\usepackage{dcpic,pictex}
%\usepackage{chemfig} % - for chemistry.
%\usepackage{pgf, tikz, tikz-cd}
%\usepackage{bbm} % /mathbbm{1}
\usepackage{natbib}
\usepackage{microtype}

\onehalfspacing

%\usepackage[ruled,section]{algorithm}
%\usepackage{algpseudocode}

% AMS Theorems
\theoremstyle{plain}% default 
\newtheorem{thm}{Theorem}[section] 
\newtheorem{prob}[thm]{Problem}
\newtheorem{question}[thm]{Question}

\newtheorem{lem}[thm]{Lemma}
\newtheorem{prop}[thm]{Proposition}
\newtheorem*{cor}{Corollary}

\theoremstyle{definition}
\newtheorem{defn}[thm]{Definition}
\newtheorem{conj}[thm]{Conjecture}
\newtheorem{exmp}[thm]{Example}

\theoremstyle{remark} 
\newtheorem*{rem}{Remark} 
\newtheorem*{note}{Note} 
\newtheorem{case}{Case} 

\newcommand{\expc}[1]{\mathbb{E}\left[#1\right]}

\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\F}{\mathbb{F}}
\newcommand{\Ga}{\mathbb{G}}

\newcommand{\Cat}{\mathcal{K}}
\newcommand{\Id}{\mathit{id}_}

%\usepackage{xparse}
\newcommand{\nth}{n\textsuperscript{th}}
\newcommand{\bigo}[1]{\mathcal{O}(#1)}

% \setlength{\topmargin}{0.2cm}
% \setlength{\footskip}{0.2cm}
% \setlength{\hoffset}{-1cm}
% \setlength{\voffset}{-2cm}
	
\usepackage{hyperref}
```
