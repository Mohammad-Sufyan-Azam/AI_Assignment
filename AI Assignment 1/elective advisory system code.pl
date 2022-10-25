start :- welcome_msg(_).

welcome_msg(_) :- write("----------------------------------------------------"), nl, write("Welcome To My Career Elective Advisory System!!"), nl, 
write("----------------------------------------------------"), nl, nl, write("So my friend, may i know your name? "), read(N), nl, courses_done(N), nl, nl.

courses_done(N) :- write("Hi "), write(N), write("! "), get_career_options(_).

get_career_options(_) :- write("Choose any career-"), nl, write("1) Data Science Engineer"), nl, write("2) AI Engineer"), nl, write("3) Software Developer"), 
nl, read(X), nl, nl, write("Select the courses which you have done (Write course code for yes, and 'no' for no)- "), nl, nl, get_prerequisites(X).

is_member(X, [X | _]) :- !.
is_member(X, [_ | Y]) :- is_member(X, Y).

append_list([], L2, L2).    
append_list([X | L1], L2, [X | L3]) :- append_list(L1, L2, L3).

insert_end(L, X, NewL) :- append_list(L, [X], NewL).

ask_gpa(_) :- write("What is your current cgpa? "), read(_), nl, nl.
ask_workshop(_) :- write("Have you attended any workshops? "), read(_), nl, nl.
ask_internships(_) :- write("Have you done any internships in this field? "), read(_), nl, nl.

get_prerequisites(X) :- X=:=1, 
write("Introduction To Programming(CSE101)"), read(A), nl, write("Data Structures And Algorithms(CSE102)"), read(B), nl, 
write("Fundamentals of Database Management System(CSE202)"), read(C), nl, write("Linear Algebra(MTH100)"), read(D), nl, 
write("Advanced Programming(CSE201)"), read(E), nl, nl, ask_gpa(X), ask_workshop(X), ask_internships(X), display_elective(X, [A, B, C, D, E]);
X=:=2, 
write("Introduction To Programming(CSE101): "), read(A), nl, write("Data Structures And Algorithms(CSE102): "), read(B), nl, 
write("Fundamentals of Database Management System(CSE202): "), read(C), nl, write("Linear Algebra(MTH100): "), read(D), nl, 
write("Probability and Statistics(MTH201)"), read(E), nl, write("Statistical Machine Learning(CSE342)"), read(F), nl,
write(course_name("CSE343")), read(G), nl, write(course_name("CSE641")), write(": "), read(H), nl, nl, display_electives(X, [A, B, C, D, E, F, G, H]);
X=:=3, 
write(course_name("CSE101")), write(": "), read(A), nl, write(course_name("CSE102")), write(": "), read(B), nl, 
write(course_name("CSE231")), write(": "), read(C), nl, write(course_name("CSE222")), write(": "), read(D), nl, nl, display_electives(X, [A, B, C, D]).

display_electives(1, List) :- 
display_list(List), 
(is_member("cse101", List) =:= true, write(elective("cse102")); true), 
(is_member("cse102", List) =:= true, write(elective("cse202")); true), 
(is_member("cse202", List) =:= true, is_member("cse101", List), is_member("mth100", List), is_member("mth201", List), write(elective("cse506")); true), 
(is_member("cse202", List) =:= true, is_member("cse102", List), write(elective("cse507")); true), 
(is_member("cse202", List) =:= true, write(elective("cse557")), write(elective("cse606")), write(elective("cse656"))).

display_electives(2, _) :- write("You can choose from these electives-"), nl, display_electives_list(["CSE102", "CSE343", "CSE618", "CSE642", "CSE643", "CSE660", "MTH100"]).

display_electives(3, _) :- write("You can choose from these electives-"), nl, display_electives_list(["CSE101", "CSE102", "MTH100", "CSE201", "CSE202", "CSE231", "CSE232"]).

display_elective(1, _) :- write("You can choose from these electives-"), nl, display_electives_list(["CSE102", "CSE202", "CSE506", "CSE507", "CSE557", "CSE606", "CSE656"]).
display_list([]).
display_list([H|T]) :- write(H), nl, display_list(T).

display_electives_list([]).
display_electives_list([H|T]) :- elective(H), nl, display_electives_list(T). 

list1_in_list2([],[]).
list1_in_list2([X|X1],[X|Y1]) :- helper_list1_in_list2(X1,Xs), list1_in_list2(Xs,Y1).


%Knowledge Base.

course_name("CSE506") :- write("Data Mining(CSE506)").
course_name("CSE507") :- write("Database System Implementation(CSE507)").
course_name("CSE101") :- write("Introduction To Programming(CSE101)").
course_name("CSE102") :- write("Data Structures And Algorithms(CSE102)").
course_name("CSE201") :- write("Advanced Programming(CSE201)").
course_name("CSE202") :- write("Fundamentals of Database Management System(CSE202)").
course_name("CSE231") :- write("Operating Systems(CSE231)").
course_name("CSE232") :- write("Computer Networks(CSE232)").
course_name("CSE342") :- write("Statistical Machine Learning(CSE342)").
course_name("CSE343") :- write("Machine Learning(CSE343)").
course_name("CSE557") :- write("Big Data Analytics(CSE557)").
course_name("CSE606") :- write("Data Warehouse(CSE606)").
course_name("CSE618") :- write("DMeta-Learning(CSE618)").
course_name("CSE642") :- write("Advanced Machine Learning(CSE642)").
course_name("CSE643") :- write("Artificial Intelligence(CSE643)").
course_name("CSE656") :- write("Information Integration And Applications(CSE656)").
course_name("CSE660") :- write("Trustworthy AI Systems(CSE660)").
course_name("MTH100") :- write("Linear Algebra(MTH100)").

elective("CSE102") :- write("Data Structures And Algorithms"), nl, write("Course Code: CSE102"), nl, write("Pre-requisites required: CSE101"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE102"), nl, write("---------------------------------------"), nl, nl.

elective("CSE202") :- write("Fundamentals of Database Management System"), nl, write("Course Code: CSE202"), nl, write("Pre-requisites required: CSE102"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE202"), nl, write("---------------------------------------"), nl, nl.

elective("CSE506") :- write("Data Mining"), nl, write("Course Code: CSE506"), nl, write("Pre-requisites required: CSE202, CSE101, MTH100, MTH201"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE506"), nl, write("---------------------------------------"), nl, nl.

elective("CSE507") :- write("Database System Implementation"), nl, write("Course Code: CSE507"), nl, write("Pre-requisites required: CSE202, CSE102"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE507"), nl, write("---------------------------------------"), nl, nl.

elective("CSE557") :- write("Big Data Analytics"), nl, write("Course Code: CSE557"), nl, write("Pre-requisites required: CSE202"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE557"), nl, write("---------------------------------------"), nl, nl.

elective("CSE656") :- write("Information Integration And Applications"), nl, write("Course Code: CSE656"), nl, write("Pre-requisites required: CSE202"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE656"), nl, write("---------------------------------------"), nl, nl.

elective("CSE606") :- write("Data Warehouse"), nl, write("Course Code: CSE606"), nl, write("Pre-requisites required: CSE202"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE606"), nl, write("---------------------------------------"), nl, nl.



elective("CSE643") :- write("Artificial Intelligence"), nl, write("Course Code: CSE643"), nl, write("Pre-requisites required: CSE102"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE643"), nl, write("---------------------------------------"), nl, nl.

elective("CSE343") :- write("Machine Learning"), nl, write("Course Code: CSE343"), nl, write("Pre-requisites required: MTH100, MTH201, MTH203, CSE101"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE343"), nl, write("---------------------------------------"), nl, nl.

elective("CSE642") :- write("Advanced Machine Learning"), nl, write("Course Code: CSE642"), nl, write("Pre-requisites required: MTH201, CSE342, CSE343"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE642"), nl, write("---------------------------------------"), nl, nl.

elective("CSE660") :- write("Trustworthy AI Systems"), nl, write("Course Code: CSE660"), nl, write("Pre-requisites required: CSE642/CSE342/CSE343"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE660"), nl, write("---------------------------------------"), nl.

elective("CSE618") :- write("Meta-Learning"), nl, write("Course Code: CSE618"), nl, write("Pre-requisites required: CSE641"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE618"), nl, write("---------------------------------------"), nl.

elective("MTH100") :- write("Linear Algebra"), nl, write("Course Code: MTH100"), nl, write("Pre-requisites required: None"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=MTH100"), nl, write("---------------------------------------"), nl.



elective("CSE101") :- write("Introduction To Programming"), nl, write("Course Code: CSE101"), nl, write("Pre-requisites required: None"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE101"), nl, write("---------------------------------------"), nl, nl.

elective("CSE201") :- write("Advanced Programming"), nl, write("Course Code: CSE201"), nl, write("Pre-requisites required: CSE101, CSE102"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE201"), nl, write("---------------------------------------"), nl, nl.

elective("CSE231") :- write("Operating Systems"), nl, write("Course Code: CSE231"), nl, write("Pre-requisites required: CSE102"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE231"), nl, write("---------------------------------------"), nl, nl.

elective("CSE232") :- write("Computer Networks"), nl, write("Course Code: CSE232"), nl, write("Pre-requisites required: CSE101, CSE231, CSE222"), nl, write("Course Description Link: http://techtree.iiitd.edu.in/viewDescription/filename?=CSE232"), nl, write("---------------------------------------"), nl, nl.


%Questions asked in the knowledge base
question_data("cgpa") :- write("What is your current cgpa? "), nl, nl.
question_data("projects") :- write("How many projects have you done in this field? "), nl, nl.
question_data("internships") :- write("Have you done any internships in this field? "), nl, nl.
question_data("workshop_attended") :- write("Have you attended any workshops? "), nl, nl.

%Answers to be given for the questions in Knowledge Base
answer_data(X, cgpa) :- X >= 8.
answer_data(X, projects) :- X>=3.
answer_data(X, internships) :- X is yes.
answer_data(X, workshops_attended) :- X is yes.




