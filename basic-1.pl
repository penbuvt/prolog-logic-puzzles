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
hint1(S) :- member(profile(amy, _, banana), S).
hint2(S) :- Age \== ten, member(profile(belle, Age, _), S).
hint3(S) :- member(profile(_, nine, grape), S).
hint4(S) :- member(profile(belle, _, apple), S).

solution(S) :-
  hint0(S),
  hint1(S),
  hint2(S),
  hint3(S),
  hint4(S).
