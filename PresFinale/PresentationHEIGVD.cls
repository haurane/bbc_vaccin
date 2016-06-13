%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Classe Présentation Beamer HEIG-VD, 04/05/2016
%	Auteur : Florian Dufour
%	Contact : florian.dufour@heig-vd.ch, Institut IDE
%   Remerciements : 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{PresentationHEIGVD}[03/05/2016, V1.0]

% classe de base

%\LoadClass[a4paper, 11pt]{article}
\LoadClass[xcolor=dvipsnames,t]{beamer}
% extensions

\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,francais]{babel}
\RequirePackage{array}
\RequirePackage{tikz}
\RequirePackage[absolute,overlay]{textpos} % pour positionner facilement tout sorte de choses
%\RequirePackage{simpsons} % invocation Simpsons !!! 
\RequirePackage{wasysym}
\RequirePackage{xparse,l3regex}
\RequirePackage{environ}
\RequirePackage{xcolor}
\RequirePackage{setspace} % espace notamment dans table, bof
\RequirePackage{pgf} % ici utile pour la commande \logo
\RequirePackage{xpatch} % pour patcher le template
\RequirePackage{appendixnumberbeamer} % utile si utilisation de slides en appendices, annexes

% Pour pouvoir récupérer le titre
\RequirePackage{authoraftertitle}

% Patcher, ajuster le template de base

\makeatletter % patcher le template pour customiser le titre et texte de la slide, package pgf, not easy to deal with
\patchcmd\beamer@@tmpl@frametitle{sep=0.3cm}{sep=1cm}{}{}
\makeatother

\makeatletter % ajuster les marges des slides
	\define@key{beamerframe}{t}[true]{
		\beamer@frametopskip=.2cm plus .5\paperheight\relax
		\beamer@framebottomskip=0pt plus 1fill\relax
		\beamer@frametopskipautobreak=\beamer@frametopskip\relax
		\beamer@framebottomskipautobreak=\beamer@framebottomskip\relax
		\def\beamer@initfirstlineunskip{}}
\makeatother 

\logo{\pgfputat{\pgfxy(-12.68,6.805)}{\pgfbox[top,left]{\includegraphics[height=1.454cm]{images/HEIG-VD_Logo_14x29_RVB_ROUGE.png}}}} % changer localisation du logo, pas la panacée, dépend du code de base 
\beamertemplatenavigationsymbolsempty % supprimer la navigation bar si besoin 


\addtobeamertemplate{frametitle}{\vskip-1ex}{} % repositionner le titre de la slide, complète le patch
\addtobeamertemplate{frametitle}{
	\begin{textblock*}{\paperwidth}(1cm,0.75cm)
		\textcolor[RGB]{166,166,166}{\noindent\rule{11cm}{0.4pt}}
	\end{textblock*}}{
	\begin{textblock*}{\paperwidth}(1cm,2.19cm)
		\textcolor[RGB]{166,166,166}{\noindent\rule{11cm}{0.4pt}}
	\end{textblock*}}%{\vskip-0.5ex}  % ajouter les 2 lignes à côté du logo pour le titre de la slide   

\addtobeamertemplate{frametitle}{\begin{textblock*}{\paperwidth}(11.62cm,8.94cm) 
		{\includegraphics[height=0.4cm]{images/LogoBasDroite.PNG}}
	\end{textblock*}} % placer le petit logo en bas à droite

\addtobeamertemplate{frametitle}{}{\vspace{0.5em}} % augmente espace entre titre de la slide et le texte dessous

\setbeamertemplate{footline}[frame number] % ajouter le numéro de frame en bas %http://tex.stackexchange.com/questions/5362/frame-number-right-of-presentation-controls	
\addtobeamertemplate{frametitle}{\vskip+0.3em}{} 
%\addtobeamertemplate{frametitle}{}{\hskip+0.3em}

\addtobeamertemplate{frametitle}{
	\begin{textblock*}{\paperwidth}(1cm,8.92cm)
		\textcolor[RGB]{166,166,166}{\noindent\rule{11cm}{0.4pt}}
	\end{textblock*}} % petit hack pour mettre la ligne au bas de la slide et ne pas l'afficher sur la page de titre, optimisable

\setbeamercovered{transparent} % pour utilisation du gris quand texte pas affiché dans les animations %\setbeamercovered{transparent=0} texte transparent
\setbeamersize{text margin left=1cm,text margin right=1cm} % marges
\setbeamertemplate{itemize items}[circle] % utiliser des "bullets points"
\setbeamercolor{itemize item}{fg=black} % couleur des bullets points au niveau 1 item
\setbeamercolor{itemize subitem}{fg=black}
\setbeamercolor{enumerate item}{fg=HEIG}
\setbeamercolor{section in toc}{fg=black} % couleur section dans table des matières
\setbeamercolor{subsection in toc}{fg=black}
\setbeamercolor{frametitle}{fg = HEIG} % changer couleur frametitle, sélection de la couleur HEIG définie manuellement (en fait du rouge)
\setbeamercolor{framesubtitle}{fg = SUBT} % changer couleur framesubtitle
\setbeamerfont{frametitle}{size=\Large,series=\bfseries}{} % gérer la taille de la police du titre de la slide
\setbeamerfont{framesubtitle}{size=\normalsize,series=\normalfont} % gérer la taille de la police du sous-titre de la slide

\definecolor{HEIG}{RGB}{255, 0, 0} % couleur HEIG-VD red
\definecolor{SUBT}{RGB}{166, 166, 166} % couleur sous-titre de la slide
  
% ce qui suit pour quelques notations math.
\newcommand\prob{{\mathbb{P}\text{r}}}
\newcommand\esp{{\mathbb{E}\text{sp}}}
\newcommand\var{{\mathbb{V}\text{ar}}}
\newcommand\cov{{\mathbb{C}\text{ov}}}
\newcommand\corr{{\mathbb{C}\text{orr}}}
\newcommand\ic{{\mathbb{IC}}}
\newcommand\loin{{\mathcal N}}
\newcommand\loif{{\mathcal F}}
\newcommand\loib{{\mathcal B}}
\newcommand\loix{{{\mathcal X}^2}}
\newcommand\loit{{{\mathcal S}\text{t}}}
\newcommand\hz{{\text{H}_0}}
\newcommand\hu{{\text{H}_1}}
\newcommand\eq{\mbox{=}}

\newcommand{\nologo}{\setbeamertemplate{logo}{}}  % supprime le logo pour une slide %http://tex.stackexchange.com/questions/228872/university-logo-in-top-right-corner-of-every-slide-except-the-title-page-in-beam
\newcommand{\noFootline}{\setbeamertemplate{footline}{}} % même chose pour retirer le numéro de la slide de la page de titre, attention comptage commence à 2 sur la page 2
\newcommand\fr{\selectlanguage{francais}} %sélectionner le français si besoin


\newcommand{\makeheigvdtitle}[1]{
{\nologo % supprimer le logo entre les accolades
{\noFootline % supprimer footline entre les accolades

\usebackgroundtemplate{
	\vbox to 0.88\paperheight{\vfil\hbox to 1\paperwidth{\hfil							\includegraphics[width=8.2cm, height=6.2cm]{images/hpylori_white.png}\hfil}\vfil}} % utiliser une image ou autre en background de la slide


\begin{frame}


\begin{textblock*}{5cm}(0.02cm,0.75cm) 
		\includegraphics[width=4.7cm]{images/HEIG-VD_Logo_96x29_RVB_ROUGE.png}
	\end{textblock*} % logo de l'école en haut à gauche de la slide

%	\begin{textblock*}{\paperwidth}(0.826cm,6.75cm) 
% 		\begin{flushleft}
%			{\LARGE \color{HEIG} \textbf{Titre}}
%		\end{flushleft}
%	\end{textblock*} % dans le cas d'un titre et d'un sous titre sur la première slide
%    
%	\begin{textblock*}{\paperwidth}(0.826cm,7.38cm) 
%		\begin{flushleft}
%			{\large \color{HEIG} Sous-titre}
%		\end{flushleft}
%	\end{textblock*} % dans le cas d'un titre et d'un sous titre sur la première slide

	\begin{textblock*}{\paperwidth}(0.826cm,7.38cm) 
		\begin{flushleft}
			{\LARGE \color{HEIG} \textbf{\MyTitle}}
		\end{flushleft}
	\end{textblock*} % dans le cas d'un titre sans sous titre sur la première slide
		
	\begin{textblock*}{5cm}(10.43cm,8.22cm) 
		\includegraphics[width=1.58cm]{images/HESSO2.png}
	\end{textblock*}

	\begin{textblock*}{\paperwidth}(0.826cm,8.66cm) 
		\begin{small}
			\MyAuthor \\ \MyDate
		\end{small}{\footnotesize #1}

	\end{textblock*}

\end{frame}

} % (supprimer footline)
} % (end supprimer logo)


\usebackgroundtemplate{...} % ne plus utiliser le contenu défini en background 

}


