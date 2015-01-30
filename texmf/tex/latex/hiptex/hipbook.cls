%% File: egs.cls
%% =============================================
%% IMPORTANT NOTICE:
%% See the copyright conditions below.
%% =============================================
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{hipbook}
          [2000/07/21 6.0 (PWD)]
 %  It requires the local files
 %     extreport.cls   size10.clo    fleqn.clo
\newif\ifafour@
\newif\ifafive@
\newif\ifasix@

\newif\ifgrxdvi@
\newif\ifgrdvips@
\newif\ifgrpdftex@

\newif\iftwelvept@
\newif\iffourteenpt@
\newif\ifseventeenpt@
\newif\iftwoside@

\newif\ifwinenc@
\newif\ifkoienc@
\newif\ifdosenc@

\def\civiltype{lh}
\def\cstype{izhitsacs}

\@ifundefined{define@key}{\RequirePackage{keyval}}{}%

\DeclareOption*{\expandafter\mypacksetkeys\expandafter{\CurrentOption}}

\def\mypacksetkeys#1{\setkeys{IzhitsaBook}{#1}}

\define@key{IzhitsaBook}{civil}{\def\civiltype{#1}}
\define@key{IzhitsaBook}{cs}{\def\cstype{#1}}

\DeclareOption{a4paper}{\afour@true \afive@false \asix@false}
\DeclareOption{a5paper}{\afive@true \afour@false \asix@false}
\DeclareOption{a6paper}{\asix@true \afive@false \afour@false}

\DeclareOption{12pt}{\twelvept@true \fourteenpt@false}
\DeclareOption{14pt}{\fourteenpt@true \twelvept@false}
\DeclareOption{17pt}{\seventeenpt@true \twelvept@false}

\DeclareOption{twoside}{\twoside@true}

\DeclareOption{xdvi}{\grxdvi@true \grdvips@false \grpdftex@false}
\DeclareOption{dvips}{\grdvips@true \grxdvi@false \grpdftex@false}
\DeclareOption{pdftex}{\grpdftex@true \grxdvi@false \grdvips@false}

\DeclareOption{cp1251}{\winenc@true \koienc@false \dosenc@false}
\DeclareOption{koi8r}{\koienc@true \winenc@false \dosenc@false}
\DeclareOption{cp866}{\dosenc@true \winenc@false \koienc@false}

\ProcessOptions

%\def\arg{twoside}
%\def\arg{\arg,14pt}

\ifafour@
  \PassOptionsToClass{a4paper}{extreport} 
\fi

\ifafive@
  \PassOptionsToClass{a5paper}{extreport} 
\fi

\ifasix@
  \PassOptionsToClass{a6paper}{extreport} 
\fi

\iftwelvept@
  \PassOptionsToClass{12pt}{extreport} 
\fi

\iffourteenpt@
  \PassOptionsToClass{14pt}{extreport} 
\fi

\ifseventeenpt@
  \PassOptionsToClass{17pt}{extreport} 
\fi

\iftwoside@
  \PassOptionsToClass{twoside}{extreport} 
\fi

\LoadClass{extreport}
% ==========================================================================================

\RequirePackage[rm,medium,center,indentfirst,nobottomtitles,pagestyles]{titlesec}
\RequirePackage[symbol,perpage]{footmisc}

% ==========================================================================================

\newread\inmux
\gdef\nword{1}%
\def\startfwp{%
    \openin\inmux\jobname.fwp\relax
  }

\def\nextword{%
    \ifeof\inmux
    \phantom{\thepage}
    \else
       \read\inmux to\nword \nword
    \fi
 }

% ==========================================================================================

\ifwinenc@
  \PassOptionsToPackage{cp1251}{inputenc} 
\else
  \ifdosenc@
     \PassOptionsToPackage{cp866}{inputenc} 
   \else
      \ifkoienc@
         \PassOptionsToPackage{koi8-r}{inputenc} 
      \else
         \PassOptionsToPackage{utf8}{inputenc} 
      \fi
   \fi
\fi


\usepackage[churchslavonic]{babel}
\usepackage[T2A]{fontenc}
\usepackage{inputenc}
\usepackage[civil = \civiltype, cs = \cstype]{hipfonts}

% ==========================================================================================

\ifafour@
  %\usepackage[a5paper,left=13mm,right=27mm,top=30mm,bottom=10mm]{geometry}
  \usepackage[a4paper,left=18mm,right=52mm,top=30mm,bottom=30mm]{geometry}
  \textwidth 160mm
  \hoffset -7mm

  \else \ifafive@
    %\usepackage[a5paper,left=13mm,right=27mm,top=30mm,bottom=10mm]{geometry}
    \usepackage[a5paper,left=8mm,right=22mm,top=20mm,bottom=7mm]{geometry}
    \def\footnotesize{\small}
  \else \ifasix@
   % \usepackage[a6paper,left=3mm,right=16mm,top=5mm,bottom=0mm]{geometry}
      %\usepackage[a6paper,left=2mm,right=15mm,top=2mm,bottom=3mm]{geometry}
      \usepackage[a6paper,left=2mm,right=15mm,top=2mm,bottom=0mm]{geometry}
      \fi
   \fi
\fi

% ==========================================================================================

\ifgrdvips@
  \usepackage[dvips]{color}
  \usepackage[dvips]{graphics}
\else
  \ifgrpdftex@
    \usepackage[pdftex]{color}
    \usepackage[pdftex]{graphics}
  \else
    \usepackage[xdvi]{color}
    \usepackage[xdvi]{graphics}
  \fi
\fi

% ==========================================================================================

\definecolor{red}{rgb}{1,0,0}
\definecolor{white}{rgb}{1,1,1}

% ==========================================================================================

\newcommand{\hdrcross}{
  \begin{figure*}[h]
    \begin{center}
    %\vskip -1.1\baselineskip
    %\fbox{
     \ifafive@
      \scalebox{0.46}{\includegraphics* [-26, 348] [639, 443]{hdrcross}}
     \else
       \ifasix@
         \scalebox{0.365}{\includegraphics* [-26, 348] [639, 443]{hdrcross}}
       \fi
     \fi
    %}
    \vskip -1.5\baselineskip
    \end{center}
  \end{figure*}
  \nopagebreak
}

\newcommand{\hdrcrosspage}{
  \begin{figure*}
    \begin{center}
      %\vskip -2.1\baselineskip
      \vskip -1.7\baselineskip
    %\fbox{
     \ifafive@
      %\scalebox{0.46}{\includegraphics* [-26, 348] [639, 443]{hdrcross2}}
      \scalebox{0.51}{\includegraphics* [-26, 348] [639, 443]{hdrcross}}
     \else
      \ifasix@
        \hspace{-0.35pc}
        \scalebox{0.376}{\includegraphics* [-26, 348] [637, 443]{hdrcross}}
        %\hspace{-0.75pc}
        %\scalebox{0.21}{\includegraphics* [0, 0] [1219, 192]{hdrcross3.ps}}
      \else
       \ifafour@
        \hspace{-0.35pc}
        \scalebox{0.68}{\includegraphics* [-26, 348] [637, 443]{hdrcross}}
        \vskip -1.2\baselineskip
       \fi
      \fi
     \fi
    %}
    \vskip -1.7\baselineskip
    \end{center}
  \end{figure*}
  %\izhspecsym
  \thispagestyle{hdrcross}
}

\newcommand{\delimpict}{
  \nopagebreak[5]
   \ifafour@
    \vskip 0.7\baselineskip
    \centerline{\scalebox{0.57}{\includegraphics* [23, 164] [256, 188]{delimpict}}}
   \else
    \vskip 0.5\baselineskip
    \centerline{\scalebox{0.37}{\includegraphics* [23, 164] [256, 188]{delimpict}}}
   \fi
}

\newcommand{\csendpict}{
  \begin{figure*}[h]
    \begin{center}
    %\vskip 1.0\baselineskip
    %\vskip 2.2\baselineskip % for csendpictlarge
    \vskip 1\baselineskip
    %\fbox{
      %\scalebox{0.55}{\includegraphics* [30, 161] [181, 214]{endpict}}
      %\scalebox{0.75}{\includegraphics* [0, 0] [127, 62]{csendpictlarge}}
      %\scalebox{0.1}{\includegraphics* [0, 0] [1132, 554]{csendpictlarge2a.ps}}
      %\scalebox{0.25}{\includegraphics{c}}
      %\scalebox{0.0875}{\includegraphics{c4}}
      \scalebox{0.09}{\includegraphics{csendpict}}
    %}
    \vskip -1.7\baselineskip
    \end{center}
  \end{figure*}
}

\newcommand{\csendpictsmall}{
  \begin{figure*}[h]
    \begin{center}
    %\vskip 1.0\baselineskip
    %\fbox{
     \ifafour@
      \vskip 1\baselineskip
      \scalebox{0.31}{\includegraphics* [0, 0] [352, 127]{csendpictsmall}}
      \vskip -1.0\baselineskip
     \else
      \vskip 2.2\baselineskip
      \scalebox{0.21}{\includegraphics* [0, 0] [352, 127]{csendpictsmall}}
      \vskip -1.7\baselineskip
     \fi
    %}
    \end{center}
  \end{figure*}
}

\newcommand{\csendpictriodion}{
  \begin{figure*}[h]
    \begin{center}
    %\vskip 1.0\baselineskip
    %\fbox{
     \ifafour@
      \vskip 1.5\baselineskip
      \scalebox{0.31}{\includegraphics* [58, 299] [547, 446]{csendpictriodion}}
      \vskip -1.0\baselineskip
     \else
      \vskip 2.2\baselineskip
      \scalebox{0.21}{\includegraphics* [0, 0] [352, 127]{csendpictriodion}}
      \vskip -1.7\baselineskip
     \fi
    %}
    \end{center}
  \end{figure*}
}

% ==========================================================================================

\author{}
%      \scalebox{0.73}{\includegraphics* [-26, 348] [639, 443]{hdrcross2}}
%}
\date{}

% ==========================================================================================

%\renewcommand{\bottomtitlespace}{3\baselineskip}
\renewcommand{\bottomtitlespace}{2\baselineskip}

\titleformat{\section}[hang]
  {\large\filcenter}{}{0em}{\color{red}\bfseries}{}

\titleformat{\subsection}[hang]
  {\small\filcenter}{}{0em}{\color{red}\bfseries }

\titleformat{\subsubsection}[hang]
  {\small\filcenter}{}{0em}{\color{red} }

\titleformat{\paragraph}[runin]{\footnotesize}{}{0em}{}

\titlespacing*{\section}{0pt}{0.5\baselineskip}{0.25\baselineskip}
%\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0.0\baselineskip}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0.0\baselineskip}
\titlespacing*{\subsubsection}{0pt}{0.25\baselineskip}{0.1\baselineskip}
\titlespacing*{\paragraph}{\parindent}{0.3\baselineskip}{\parindent}

\newtitlemark{\subsectiontitle}

% ==========================================================================================

\newpagestyle{hdrcross}[\rm\small]{ 
  \sethead[][][\special{catchword}]{}{}{\special{catchword}}
  \setfoot{}{}{\small\nextword} 
  }

\newpagestyle{izhitsabook}[\rm\small]{
  \sethead[\civil\scriptsize\usepage][\footnotesize
  \sectiontitle][\special{catchword}]
  {}{\footnotesize
    \subsectiontitle}{\civil\scriptsize\usepage\special{catchword}}
  \headrule \setfoot{}{}{\small\nextword} }

\newpagestyle{izhcontentspage}[\rm\small]{
  \sethead[\footnotesize\civil\usepage][\footnotesize
  \sectiontitle][]
  {}{\footnotesize\ 
    }{\scriptsize\civil\usepage}
  \headrule \setfoot{}{}{\footnotesize\nextword} }

\renewcommand\tableofcontents{%
    \thispagestyle{izhcontentspage}
    \section*{\contentsname}
    \vskip 0.5\baselineskip
    \@starttoc{toc}%
    }

% ==========================================================================================

% \newcounter{song}
% \newcommand\titel{\@startsection {song}{3}{0mm}%
%        {-3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus.2ex}%
%        {\footnotesize}}

% \renewcommand\@seccntformat[1]{\@ifundefined{#1@cntformat}%
%    {\csname the#1\endcsname\quad}%  default
%    {\csname #1@cntformat\endcsname}% individual control
%  }
  
%  \newcommand\song@cntformat{\protect\makebox[14mm][l]{\fbox{%
%    \Large\textbf{\thesong}}}}

% \newcounter{refrainc}
% \newcommand\refrain[1]{\@startsection {refrainc}{2}{0mm}%
%        {-3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus.2ex}%
%        {\footnotesize{#1}}}

% ==========================================================================================

\newcommand\kavykaendold[2]{%
  \let\thefootnotesav\thefootnote%
  \def\thefootnote{{\normalfont{#1}}}%
  \footnote{#2}%
  \let\thefootnote\thefootnotesav%
}

\newcommand\kavykabeginold[1]{%
  \let\thefootnotesav\thefootnote%
  \def\thefootnote{#1}%
  \footnotemark%
  \let\thefootnote\thefootnotesav%
}

% ==========================================================================================

\def\@fnsymbol#1{\ifcase#1\or \char176\or\char176\or
  \char176\char176\or\char176\char176\or
  \char176\char176\char176 \or\char176\char176\char176 \or
  \char176\char176\char176\char176 \or\char176\char176\char176\char176 \or
  \char176\char176\char176\char176\char176 \or\char176\char176\char176\char176\char176 \or
  \char176\char176\char176\char176\char176\char176
   \else\@ctrerr\fi}

  \CheckCommand*\kavykaend{\@ifnextchar [%]
    \@xfootnote
    {%
      \stepcounter\@mpfn \protected@xdef\@thefnmark{\thempfn}%
      \@footnotemark \@footnotetext
    }%
  }
  \newcommand*\kavykaend{\@ifnextchar [%]
    \@xfootnote
    {%
      \stepcounter\@mpfn \protected@xdef\@thefnmark{\thempfn}%
      \FN@pp@footnote\@footnotemark
      \ifFN@pp@towrite
        \FN@pp@writetemp
        \FN@pp@towritefalse
      \fi
      \@footnotetext
    }%
  }
  \CheckCommand*\kavykabegin{%
    \@ifnextchar [%]
    \@xfootnotemark
    {%
      \stepcounter{footnote}%
      \protected@xdef\@thefnmark{\thefootnote}%
      \@footnotemark
    }%
  }
  \newcommand*\kavykabegin{%
    \@ifnextchar [%]
    \@xfootnotemark
    {%
      \stepcounter{footnote}%
      \protected@xdef\@thefnmark{\thefootnote}%
      \FN@pp@footnote\@footnotemark
      \ifFN@pp@towrite
        \FN@pp@writetemp
        \FN@pp@towritefalse
      \fi
    }%
  }

% ==========================================================================================

\cs

% ==============================================================================

\newcommand{\stdcrosstitle}[1]{%
  \title{
    \vskip -30 mm
                                %\fbox{
                                % \scalebox{0.6}{\includegraphics* [170, 450] [420, 827] {david1.ps}} 
                                %\scalebox{0.3}{\includegraphics* {david.ps}} 
    {\izhverylarge +} % православный крест
                                %} \\
    \\
    \vskip 15 mm
    #1
    \vskip -70mm}
}

\newcommand{\bukv}[1]{{\color{red}#1}}
\newcommand{\Bukv}[1]{{\color{red}#1}}
\newcommand{\rem}[1]{{\small\color{red}#1}}

\newcommand{\slava}{%
  \vskip 0.75\baselineskip%
  \centerline{\color{red}Сла'ва:}%
  }

% \def\contentsname{W=главле'нiе кни'ги сея`:}
\def\contentsname{12345}

\renewcommand{\contentsname}{12345}

\newcommand{\stdsecondpage}{%
  \newpage
  \thispagestyle{empty} 
  \phantom{abc}\vskip 1.75\baselineskip 
  \begin{center}
    {\izhitsaraw+} 
    \vskip 0.5\baselineskip 
    %\small 
    {\cs Во сла'ву ст~jь'й, _е=диносу'щнjьй,\\ нераздjь'льнjьй
      и= животворя'щей тр\оцы, а=ми'нь.}
  \end{center}
  \newpage
}

% ==========================================================================================

%\footnotesep 1\baselineskip
%\footskip 0.5\baselineskip
%\setlength{\footskip}{2mm}

\headsep = 0.75\baselineskip
\footskip = 1.5\baselineskip

\startfwp

\ifafour@
\font\izhverylarge = izhitsacs at 272pt
\font\izhitsaraw = izhitsacs at 40pt
\else
\font\izhverylarge = izhitsacs at 172pt
\font\izhitsaraw = izhitsacs at 20pt
\fi
\font\izhitsanormal = izhitsacs

\frenchspacing

\setmarks{section}{subsection}

\pagestyle{izhitsabook}

\renewcommand{\rmdefault}{\default@csfamily}
%\renewcommand{\rmdefault}{Orthodox}

%\endinput

