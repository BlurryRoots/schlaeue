
:- discontiguous married/2.
:- discontiguous father/2.
:- discontiguous mother/2.

female('Lara Croft').
female('Lucy Lu').
female('Sina Rose').
female('Karla Kolumna').
female('Alesya Kracivaya').
female('Karoline Koks').
female('Karina Käse').

male('Hans Gruber').
male('Karl Heinz').
male('Kurt Bach').
male('Otto Normalverbraucher').
male('Max Mustermann').
male('Frank Frei').
male('Markus Malz').
male('Tom Tulpe').

married('Karina Käse', 'Markus Malz').
mother('Karina Käse', 'Tom Tulpe').
father('Makus Malz', 'Tom Tulpe').

married('Sina Rose', 'Otto Normalverbraucher').
mother('Sina Rose', 'Lara Croft').
father('Otto Normalverbraucher', 'Lara Croft').
mother('Sina Rose', 'Kurt Bach').
father('Otto Normalverbraucher', 'Kurt Bach').

married('Karolina Koks', 'Frank Frei').
mother('Karolina Koks', 'Hans Gruber').
father('Frank Frei', 'Hans Gruber').

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
