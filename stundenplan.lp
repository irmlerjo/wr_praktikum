%general rules
raum(X):-sporthalle(X).
raum(X):-physik(X).
raum(X):-chemie(X).
raum(X):-biologie(X).
raum(X):-geographie(X).
raum(X):-kunst(X).
raum(X):-musik(X).

%tag(1..5).
tag(mo).
tag(di).
tag(mi).
tag(do).
tag(fr).

stunde(1..7).

% Es darf zu selben Zeit nicht, zwei Belegungen, mit demselben Lehrer, derselben Klasse oder dem gleichen Raum geben.
{belegung(F,T,S,R,K,L) : klasse(KS,K,A), lehrer(L,F1,F2), raum(R)}1 :- fach(F), tag(T), stunde(S).

% Anzahl der Fachstunden einer Klasse pro Woche.
wochenstunde(F,K,N) :- fach(F), klasse(KS,K,A), N = #count { F,T,S,K : belegung(F,T,S,R,K,L) }.

%#show wochenstunde/3.

% Es muss die gleiche Stundenzahl wie im Lehrplan verlangt belegt werden.
:- wochenstunden_lehrplan(F,KS,N), wochenstunde(F,K,N2), klasse(KS,K,A), N!=N2.

% Die Fächer sollen von den richtigen Lehrern unterrichtet werden.
:-belegung(F,T,S,R,K,L), lehrer(L,F1,F2), F!=F1, F!=F2.

% Eine Klasse soll in einem Fach von einem bestimmten Lehrer unterrichtet werden
:-belegung(F1,T1,S1,R1,K1,L1),belegung(F2,T2,S2,R2,K2,L2), F1=F2, K1=K2, T1=T2, S1!=S2, L1!=L2.
:-belegung(F1,T1,S1,R1,K1,L1),belegung(F2,T2,S2,R2,K2,L2), F1=F2, K1=K2, T1!=T2, L1!=L2.

% Der Klassenlehrer unterrichtet mindestens ein Fach für die entsprechende Klasse
:-belegung(F,T,S,R,K,L), klassenlehrer(K,KL), lehrer(KL,F1,F2), 1{F1=F;F2=F},L!=KL.

% Wahlfächer sollen nur von den entsprechenden Kursen besucht werden (funktioniert nicht)
%:-belegung(F,T,S,R,K,L), wahlfach(F), klasse(KS,K,A), F!=A.

% Nur Sport in der Sporthalle
:-belegung(F,T,S,R,K,L), sporthalle(R), F!="Sport".

% Weitere Raumeinschränkungen für entsprechende Fächer
:-belegung("Kunst",T,S,R,K,L), not kunst(R).
:-belegung("Musik",T,S,R,K,L), not musik(R).
:-belegung("Biologie",T,S,R,K,L), not biologie(R).
:-belegung("Chemie",T,S,R,K,L), not chemie(R).
:-belegung("Physik",T,S,R,K,L), not physik(R).
:-belegung("Geographie",T,S,R,K,L), not geographie(R).
:-belegung("Sport",T,S,R,K,L), not sporthalle(R).

#show belegung/6.
