kunst(1).
biologie(2).
musik(3).
geographie(4).
sporthalle(5).
chemie(6).
physik(7).

raum(100).
%raum(101).
%raum(103).
%raum(104).

%klasse(Klassenstufe,Klasse/Kurs,Typ/Fach)
klasse(10,"10/1","Klasse").
%klasse(10,"10/2","Klasse").
%klasse(9,"9/1","Klasse").
klasse(10,"10-Franz","Französisch").

%lehrer(Name,Fach1,Fach2)
lehrer("Fr.Test","Deutsch","Englisch").
lehrer("Fr.Test2","Mathe","Physik").
lehrer("Hr.Test3","Deutsch","Geschichte").
lehrer("Hr.Test4","Musik","Kunst").
lehrer("Fr.Test5","Biologie","Chemie").
lehrer("Hr.Test6","Biologie","Sport").
lehrer("Hr.Test7","Sport","Geschichte").
lehrer("Fr.Test8","Mathe","Chemie").
lehrer("Fr.Test9","Musik","Ethik").
lehrer("Hr.Test10","Mathe","Geographie").
lehrer("Fr.Test11","Deutsch","Geschichte").
lehrer("Fr.Test12","Deutsch","Französisch").

%klassenlehrer(Klasse,Lehrer)
klassenlehrer("10/1","Fr.Test").
klassenlehrer("10/2","Fr.Test11").
klassenlehrer("9/1","Fr.Test2").