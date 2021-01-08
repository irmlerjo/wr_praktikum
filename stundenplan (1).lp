%general rules
raum(X):-sporthalle(X).
raum(X):-physik(X).
raum(X):-chemie(X).
raum(X):-biologie(X).
raum(X):-geographie(X).
raum(X):-kunst(X).

tag(1..5).
stunde(1..7).

% Es darf zu selben Zeit nicht, zwei Belegungen, mit demselben Lehrer, derselben Klasse oder dem gleichen Raum geben.
{belegung(F,T,S,R,K,L) : klasse(K), lehrer(L), raum(R)}1 :- fach(F), tag(T), stunde(S).

% Anzahl der Fachstunden einer Klasse pro Woche.
wochenstunde(F,K,N) :- fach(F), klasse(K), N = #count { F,T,S,K : belegung(F,T,S,R,K,L) }.

#show wochenstunde/3.

% Es muss die gleiche Stundenzahl wie im Lehrplan verlangt belegt werden.
:- wochenstunden_lehrplan(F,K,N), wochenstunde(F,K,N2), N!=N2.

#show belegung/6.
