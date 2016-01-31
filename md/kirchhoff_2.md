
---
output: 
  pdf_document

header-includes:
	\usepackage{tikz}
	\usepackage[european]{circuitikz}
---

#Knotenpunktregel
##Beispiel 2

Für den untenstehenden Knoten ist der zeitliche Verlauf der drei Ströme $I_1 = f(t)$, $I_2 = f(t)$ und $I_3 = f(t)$ bekannt.
Zeichne den fehlenden Strom $I_4$ auf.\

\begin{tikzpicture}
	\draw 
	(0,0) to[short, i=$i_1$, -*] (2,0)
	(2,0) to[short, i=$i_2$] (4,0)
	(2,2) to[short, i=$i_3$] (2,0)
	(2,0) to[short, i=$i_4$] (2,-2);
\end{tikzpicture}

![Stromverlauf](figure/kirchhoff_2-1.png)
