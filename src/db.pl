
:- discontiguous married/2.
:- discontiguous parent/2.

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
parent('Karina Käse', 'Tom Tulpe').
parent('Makus Malz', 'Tom Tulpe').

married('Sina Rose', 'Otto Normalverbraucher').
parent('Sina Rose', 'Lara Croft').
parent('Otto Normalverbraucher', 'Lara Croft').
parent('Sina Rose', 'Kurt Bach').
parent('Otto Normalverbraucher', 'Kurt Bach').

married('Karolina Koks', 'Frank Frei').
parent('Karolina Koks', 'Hans Gruber').
parent('Frank Frei', 'Hans Gruber').

married('Lara Croft', 'Hans Gruber').
parent('Lara Croft', 'Karl Heinz').
parent('Hans Gruber', 'Karl Heinz').
parent('Lara Croft', 'Lucy Lu').
parent('Hans Gruber', 'Lucy Lu').

married('Karla Kolumna', 'Kurt Bach').
parent('Karla Kolumna', 'Alesya Kracivaya').
parent('Kurt Bach', 'Alesya Kracivaya').
parent('Karla Kolumna', 'Max Mustermann').
parent('Kurt Bach', 'Max Mustermann').
