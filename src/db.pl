
:- discontiguous married/2.
:- discontiguous father/2.
:- discontiguous mother/2.

female('Lara Croft').
female('Lucy Lu').
female('Sina Rose').
female('Karla Kolumna').
female('Alesya Kracivaya').

male('Hans Gruber').
male('Karl Heinz').
male('Kurt Bach').
male('Otto Normalverbraucher').
male('Max Mustermann').

married('Sina Rose', 'Otto Normalverbraucher').
mother('Sina Rose', 'Lara Croft').
father('Otto Normalverbraucher', 'Lara Croft').
mother('Sina Rose', 'Kurt Bach').
father('Otto Normalverbraucher', 'Kurt Bach').

married('Lara Croft', 'Hans Gruber').
mother('Lara Croft', 'Karl Heinz').
father('Hans Gruber', 'Karl Heinz').
mother('Lara Croft', 'Lucy Lu').
father('Hans Gruber', 'Lucy Lu').

married('Karla Kolumna', 'Kurt Bach').
mother('Karla Kolumna', 'Alesya Kracivaya').
father('Kurt Bach', 'Alesya Kracivaya').
mother('Karla Kolumna', 'Max Mustermann').
father('Kurt Bach', 'Max Mustermann').
