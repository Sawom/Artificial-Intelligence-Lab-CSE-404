/*facts*/

male(joy).
male(asif).
male(rafid).
male(alif).
male(jami).
male(afzal).
male(hasan).
male(talha).
male(shuvo).
male(anam).
male(rashid).
male(samin).
male(tahmid).
male(sagor).
male(rafi).
male(amin).
male(rashid).
male(jihad).
male(nahid).
male(niloy).
male(kabir).
male(mehedi).
male(rahul).
male(saad).
male(fahim).
male(mobin).

female(tasnia).
female(mim).
female(piya).
female(brishty).
female(maliha).
female(tithi).
female(akhi).
female(dipannita).
female(fariha).
female(nusrat).
female(asma).
female(tanha).
female(ritu).
female(priya).
female(sumona).
female(rodry).
female(kotha).
female(tamanna).
female(raisa).



father(joy,asif).
father(joy,rafid).
father(asif,alif).
father(asif,jami).
father(alif,talha).
father(jami,shuvo).
father(talha,samin).
father(talha,tahmid).
father(samin,rashid).
father(tahmid,jihad).
father(tahmid,nahid).
father(jihad,ruhul).
father(rafid,hasan).
father(rafid,afzal).
father(hasan,anam).
father(anam,sagor).
father(anam,rafi).
father(sagor,niloy).
father(niloy,saad).
father(rafi,kabir).
father(kabir,fahim).
father(afzal,sogir).
father(sogir,amin).
father(amin,mehedi).
father(mehedi,mobin).


mother(tasnia,asif).
mother(tasnia,rafid).
mother(mim,alif).
mother(mim,jami).
mother(brishty,talha).
mother(maliha,shuvo).
mother(dipannita,samin).
mother(dipannita,tahmid).
mother(asma,rashid).
mother(tanha,jihad).
mother(tanha,nahid).
mother(rodry,ruhul).
mother(piya,hasan).
mother(piya,afzal).
mother(tithi,anam).
mother(fariha,sagor).
mother(fariha,rafi).
mother(tanha,rashid).
mother(kotha,saad).
mother(piya,kabir).
mother(tamanna,fahim).
mother(akhi,sogir).
mother(nusrat,amin).
mother(sumona,mehedi).
mother(raisa,mobin).


/*rules*/

parent(X,Y):-
     mother(X,Y);
     father(X,Y).

sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

sibling(Y,X):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

grandparent(X,Y):-
     parent(Z,Y),
     parent(X,Z).


greatgrandparent(X,Y):-
    parent(X,P),
    parent(P,Z),
    parent(Z,Y).

greatgreatgrandparent(X,Y):-
     parent(A,Y),
     parent(B,A),
     parent(C,B),
     parent(X,C).

firstcousin(X,Y):-
    parent(Z,X),
    parent(W,Y),
    sibling(Z,W).
firstcousin(Y,X):-
    parent(Z,X),
    parent(W,Y),
    sibling(Z,W).

secondcousin(X,Y):-
    greatgrandparent(Z,X),
    greatgrandparent(Z,Y),
    \+firstcousin(X,Y),
    \+sibling(X,Y),
    X\=Y.

thirdcousin(X,Y):-
    greatgreatgrandparent(Z,X),
    greatgreatgrandparent(Z,Y),
    \+firstcousin(X,Y),
    \+secondcousin(X,Y),
    \+sibling(X,Y),
    X\=Y.

firstcousin_onceremoved(X,Y):-
    parent(Z,Y),
    firstcousin(X,Z).
firstcousin_onceremoved(X,Y):-
    parent(Z,X),
    firstcousin(Z,Y).

firstcousin_twiceremoved(X,Y):-
    firstcousin(X,Z),
    grandparent(Z,Y).
firstcousin_twiceremoved(X,Y):-
    firstcousin(Z,Y),
    grandparent(Z,X).

secondcousin_onceremoved(X,Y):-
     parent(Z,Y),
     secondcousin(X,Z).
secondcousin_onceremoved(X,Y):-
     parent(Z,X),
     secondcousin(Z,Y).

secondcousin_twiceremoved(X,Y):-
     grandparent(Z,Y),
     secondcousin(X,Z).
secondcousin_twiceremoved(X,Y):-
     grandparent(Z,X),
     secondcousin(Z,Y).

thirdcousin_onceremoved(X,Y):-
     parent(Z,Y),
     thirdcousin(X,Z).
thirdcousin_onceremoved(X,Y):-
     parent(Z,X),
     thirdcousin(Z,Y).

thirdcousin_twiceremoved(X,Y):-
     grandparent(Z,Y),
     thirdcousin(X,Z).
thirdcousin_twiceremoved(X,Y):-
     grandparent(Z,X),
     thirdcousin(Z,Y).

