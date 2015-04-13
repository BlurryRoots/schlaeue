
%:- discontiguous married/2.
%:- discontiguous parent/2.

% define persons present in family tree
person(1, 'Karina Käse', female).
person(2, 'Sina Käse', female).
person(3, 'Karolina Koks', female).
person(4, 'Karla Kolumna', female).
person(5, 'Lara Normalverbraucher', female).
person(6, 'Alesya Kolumna', female).
person(7, 'Lucy Koks', female).
person(8, 'Markus Käse', male).
person(9, 'Otto Normalverbraucher', male).
person(10, 'Tom Käse', male).
person(11, 'Frank Koks', male).
person(12, 'Kurt Normalverbraucher', male).
person(13, 'Hans Koks', male).
person(14, 'Max Kolumna', male).
person(15, 'Karl Koks', male).
person(16, 'Bernd Normalverbraucher', male).

% define married couples
married(1, 8).
married(2, 9).
married(3, 11).
married(4, 12).
married(5, 13).

% define children of Karina & Markus
parent(1, 2).
parent(8, 2).
parent(1, 10).
parent(8, 10).
% define children of Sina & Tom
parent(2, 5).
parent(9, 5).
parent(2, 12).
parent(9, 12).
parent(2, 16).
parent(9, 16).
% define children of Karolina & Frank
parent(3, 13).
parent(11, 13).
% define children of Karla & Kurt
parent(4, 6).
parent(12, 6).
parent(4, 14).
parent(12, 14).
% define children of Lara & Hans
parent(5, 7).
parent(13, 7).
parent(5, 15).
parent(13, 15).
