% wissensdatenbank, beinhaltet alle fakten über stammbaum
%

female(karina).
female(sina).
female(erna).
female(karolina).
female(karla).
female(lara).
female(alesya).
female(lucy).

male(markus).
male(otto).
male(tom).
male(frank).
male(kurt).
male(bernd).
male(hans).
male(max).
male(karl).

married(karina, markus).
married(sina, otto).
married(karolina, frank).
married(karla, kurt).
married(lara, hans).

parent(karina, sina).
parent(karina, tom).
parent(karina, erna).
parent(markus, sina).
parent(markus, tom).
parent(markus, erna).
%
parent(karolina, hans).
parent(frank, hans).
%
parent(sina, kurt).
parent(sina, bernd).
parent(sina, lara).
parent(otto, kurt).
parent(otto, bernd).
parent(otto, lara).
%
parent(karla, max).
parent(karla, alesya).
parent(kurt, max).
parent(kurt, alesya).
%
parent(lara, karl).
parent(lara, lucy).
parent(hans, karl).
parent(hans, lucy).

