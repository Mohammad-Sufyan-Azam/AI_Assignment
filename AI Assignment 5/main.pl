% Getting facts.
get_facts:-
  open('C:\\Users\\MOHD SUFYAN\\input_facts.txt', read, Text), 
  read_file(Text, Lines),
  close(Text),
  facts(Lines).

facts([H|T]):- (H == end_of_file)->facts(T); assert(H), facts(T).
facts([]).

% File reading.
read_file(Stream, []) :- at_end_of_stream(Stream).
read_file(Stream, [H|T]) :- \+ at_end_of_stream(Stream), read(Stream, H), read_file(Stream, T).

% Check courses and interest present.
start:- get_facts, interest(X), course_taken(Y), process(X, Y).

process(Interest, Course):- Course == 'None', predict_on_interest(Interest); get_all_course_done(Courses_Done), interest_pre_requisite_courses(Interest, Requisite_courses), 
                            extract_remaining_courses(Courses_Done, Requisite_courses).

predict_on_interest(Interest):- interest_pre_requisite_courses(Interest, Required_Courses), print_electives(Required_Courses).

get_all_course_done(Courses_Done):- findall(X, course_taken(X), Courses_Done).

extract_remaining_courses(Courses_Done, Requisite_courses):- subtract(Requisite_courses, Courses_Done, Remaining_courses), print_electives(Remaining_courses).


print_electives(List):- print_final_message, print_list(List).

print_list([]).
print_list([H | T]) :- write('--> '), write(H), write('\n'), print_list(T).

print_final_message:- write('----------------------------------'), write('\n'), 
                      write('You can take these electives-\n'), 
                      write('----------------------------------'), write('\n').

subtract_lists([], _, _).
subtract_lists(X, [], X).
subtract_lists(All, [H|T], L):- list_member(H, All), list_delete(H, All, A), subtract_lists(A, T, L).

list_delete(H, [H], []).
list_delete(H,[H|L1], L1).
list_delete(H, [Y|L2], [Y|L1]) :- list_delete(H,L2,L1).

list_member(H,[H|_]).
list_member(H,[_|T]) :- list_member(H,T).

