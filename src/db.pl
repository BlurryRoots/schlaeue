
:- discontiguous married/2.
:- discontiguous parent/2.

person(1, 'Karina Käse').
person(2, 'Sina Käse').
person(3, 'Karolina Koks').
person(4, 'Karla Kolumna').
person(5, 'Lara Normalverbraucher').
person(6, 'Alesya Kolumna').
person(7, 'Lucy Koks').
person(8, 'Markus Käse').
person(9, 'Otto Normalverbraucher').
person(10, 'Tom Käse').
person(11, 'Frank Koks').
person(12, 'Kurt Normalverbraucher').
person(13, 'Hans Koks').
person(14, 'Max Kolumna').
person(15, 'Karl Koks').

female(1).
female(2).
female(3).
female(4).
female(5).
female(6).
female(7).

male(8).
male(9).
male(10).
male(11).
male(12).
male(13).
male(14).
male(15).

married(1, 8).
married(2, 9).
married(3, 11).
married(4, 12).
married(5, 13).

% Karina & Markus
parent(1, 2).
parent(8, 2).
parent(1, 10).
parent(8, 10).
% Sina & Tom
parent(2, 5).
parent(9, 5).
parent(2, 12).
parent(9, 12).
% Karolina & Frank
parent(3, 13).
parent(11, 13).
% Karla & Kurt
parent(4, 6).
parent(12, 6).
parent(4, 14).
parent(12, 14).
% Lara & Hans
parent(5, 7).
parent(13, 7).
parent(5, 15).
parent(13, 15).
