% https://www.ahapuzzles.com/logic/logic-puzzles/basic-3/

name(austin).
name(dominic).
name(emmett).
name(xavier).

position(1).
position(2).
position(3).
position(4).

bike(black).
bike(blue).
bike(green).
bike(red).

profile(Name, Position, Bike) :- name(Name), position(Position), bike(Bike).

all_positions(Positions) :- findall(Position, position(Position), Positions).
all_bikes(Bikes) :- findall(Bike, bike(Bike), Bikes).

hint0([
  profile(austin,  PositionA, BikeA),
  profile(dominic, PositionB, BikeB),
  profile(emmett,  PositionC, BikeC),
  profile(xavier,  PositionD, BikeD)
  ]) :-
    all_positions(Positions), permutation(Positions, [PositionA, PositionB, PositionC, PositionD]),
    all_bikes(Bikes), permutation(Bikes, [BikeA, BikeB, BikeC, BikeD]).

hint1(S) :- % 1. Emmet and Austin's bikes are red and black, but not necessarily in that order.
  member(profile(emmett, _, BikeEmmet), S),
  member(profile(austin, _, BikeAustin), S),
  permutation([red, black], [BikeEmmet, BikeAustin]).
hint2(S) :- % 2. The owner of the green bike finished in first.
  member(profile(_, 1, green), S).
hint3(S) :- % 3. Xavier was the fourth.
  member(profile(xavier, 4, _), S).
hint4(S) :- % 4. Emmett didn't finish in second place.
  member(profile(emmett, Position, _), S),
  Position \= 2.
hint5(S) :- % 5. The third place didn't ride a black bike.
  member(profile(_, 3, Bike), S),
  Bike \= black.

solution(S) :-
  hint0(S),
  hint1(S),
  hint2(S),
  hint3(S),
  hint4(S),
  hint5(S).
