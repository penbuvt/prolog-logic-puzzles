% https://www.ahapuzzles.com/logic/logic-puzzles/basic-2/

sport(basketball).
sport(football).
sport(tennis).

age(12).
age(13).
age(14).

name(carter).
name(luke).
name(theo).

profile(Name, Sport, Age) :- name(Name), sport(Sport), age(Age).

all_sports(Sports) :- findall(Sport, sport(Sport), Sports).
all_ages(Ages) :- findall(Age, age(Age), Ages).

hint0([
  profile(carter, SportA, AgeA),
  profile(luke, SportB, AgeB),
  profile(theo, SportC, AgeC)
  ]) :-
    all_sports(Sports), permutation(Sports, [SportA, SportB, SportC]),
    all_ages(Ages), permutation(Ages, [AgeA, AgeB, AgeC]).
hint1(S) :- member(profile(luke, Sport, _), S), Sport \= tennis.
hint2(S) :- all_ages(Ages), max_list(Ages, Age), member(profile(_, basketball, Age), S).
hint3(S) :- all_ages(Ages), member(profile(luke, _, Age), S), \+ min_list(Ages, Age), \+ max_list(Ages, Age).
hint4(S) :- member(profile(theo, _, Age), S), all_ages(Ages), \+ max_list(Ages, Age).

solution(S) :-
  hint0(S),
  hint1(S),
  hint2(S),
  hint3(S),
  hint4(S).
