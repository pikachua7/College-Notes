male(dashrath).
male(ram).
male(luv).
male(kush).
female(sita).
female(sita).
female(kausalya).
parent(dashrath,ram).
parent(dashrath,bharat).
parent(ram,luv).
parent(ram,kush).
parent(sita,luv).
parent(sita,kush).
parent(kausalya,ram).
father(X,Y):-male(X),parent(X,Y).
mother(X,Y):-female(X),parent(X,Y).
grandfather(X,Z):-male(X),male(Y),parent(X,Y),parent(Y,Z).
grandmother(X,Z):-female(X),male(Y),parent(X,Y),parent(Y,Z).


















