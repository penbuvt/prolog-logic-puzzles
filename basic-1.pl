% https://www.ahapuzzles.com/logic/logic-puzzles/basic-1/

person(amy).
person(belle).
person(chloe).

fruit(apple).
fruit(banana).
fruit(grape).

age(eight).
age(nine).
age(ten).

profile(Name, Age, Fruit) :- person(Name), age(Age), fruit(Fruit).

hint0([
  profile(amy, AgeA, FruitA),
  profile(belle, AgeB, FruitB),
  profile(chloe, AgeC, FruitC)
  ]) :- 
    member(eight, [AgeA, AgeB, AgeC]),
    member(nine, [AgeA, AgeB, AgeC]),
    member(ten, [AgeA, AgeB, AgeC]),
    member(apple, [FruitA, FruitB, FruitC]),
    member(banana, [FruitA, FruitB, FruitC]),
    member(grape, [FruitA, FruitB, FruitC]).
% 1. Amy likes bananas.
hint1(S) :- member(profile(amy, _, banana), S).
% 2. Belle isn't 10.
hint2(S) :- Age \== ten, member(profile(belle, Age, _), S).
% 3. The 9 years old girl likes grapes.
hint3(S) :- member(profile(_, nine, grape), S).
% 4. Belle likes apples.
hint4(S) :- member(profile(belle, _, apple), S).

solution(S) :-
  hint0(S),
  hint1(S),
  hint2(S),
  hint3(S),
  hint4(S).
