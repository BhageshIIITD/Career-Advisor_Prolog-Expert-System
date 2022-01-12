/*Bhagesh Gaur*/
:-  write('                                       Welcome to the Career Advisor'),nl,
	  write('----------------------------------------------------------------------------------------------------------'),nl,nl,
	  write('Hi! Please answer the following series of questions so that I can help you out with relevant career advise.'),nl,
	  write('Please enter \'advise.\' to start the system. Also, enter a dot(.) after your each response to submit it.'),nl,nl.


advise :- system_reset, advisor(Z). /*Start the system*/


advisor(Z) :- field(Z,_),!.


/*Dynamic initialisation of the responses and flags*/

:- dynamic(response/2). 
:- dynamic(flag/1).
:- dynamic(flagp/1).


/*Retracting all the assertions from the fact base*/

system_reset :- retract(response(_,_)), fail. 
system_reset.


/*Flags*/

flag(nf).
flagp(hnd).


/*Some general predicates*/

tech_skills :- tech_skills_great(great).
nontech_skills :- tech_skills_great(not_so_great).

creative :- think_creative_analytical(create).
analytical :- think_creative_analytical(analyse).

logical :- think_logical_imagine(logic).
imaginative :- think_logical_imagine(imagine).

indoor :- indoor_outdoor(in).
outdoor :- indoor_outdoor(out).

higher_study :- study_more_work(hstudy).

entrepreneur :- study_more_work(work),corporate_entrepreneur(entre).
corporate :- study_more_work(work),corporate_entrepreneur(job).

aptitude_high :- aptitude(yes),high_grades(yes).
aptitude_low :- high_grades(no).
aptitude_low :- aptitude(no).





/*Different Fields available*/
field(productdeveloper,X) :-
  imaginative, creative, tech_skills, 
  like_to(solve_problems),
  computer_or_hands(computer), corporate,
  communication(yes),electives(design), ethical_behaviour(yes),
  flexible(yes), initiative(yes), commitment(yes), practical(yes), product_knowledge(yes),
  team_work(yes), project(softdev_des),
  X='Advise: \nYou are a imaginative and creative person. \n
You are also having good technical skills. \n
Your are having good communication skills, ethical belief, flexiblity in work, leadership & practical mindset and commitment.\n
So, you are well suited in the field of product development.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(software,X) :-
  analytical, logical, tech_skills,  
  like_to(solve_problems), corporate,
  computer_or_hands(computer), aptitude_high,
  course(dsa_math), /*[dsa,math]*/
  communication(yes),project(softdev),
  X='Advise: \nYou are good at analytical and logical thinking, and at solving problems.\n
You are also having good technical skills, high aptitude and perfer working on a computer. \n
Since, you have even done projects in software development, \n
so, you are well suited in the field of software development in corporate sector.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(artificial_intelligence,X) :-
  analytical, logical, tech_skills,  
  like_to(solve_problems), aptitude_high,
  computer_or_hands(computer), corporate,
  course(dsa_math_ml), /*[dsa,math,ml]*/
  communication(yes), project(softdev_ai_ml_robo), 
  X='Advise: \nYou are good at analytical and logical thinking, and at solving problems.\n
You are also having good technical skills, high aptitude and perfer working on a computer. \n
Since, you have even done projects in either software development, artificial_intelligence, machine learning or robotics. \n
So, you are well suited in the field of artificial_intelligence.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(data_science,X) :-
  analytical, logical, tech_skills,  
  like_to(solve_problems), corporate, communication(yes),
  computer_or_hands(computer), research(yes), aptitude_high,
  course(math), /*[math]*/
  project(data_ana_data_sci), 
  X='Advise: \nYou are good at analytical and logical thinking, and at solving problems.\n
You are also having good technical skills, research ability and perfer working on a computer. \n
Since, you have even done projects in data analytics or data science. \n
So, you are well suited in the field of data science.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(quantum_computation,X) :-
  analytical, logical, tech_skills,  
  like_to(solve_problems), research(yes), aptitude_high,
  course(dsa_ml_elec_phys_math_any_stem), /*[dsa,ml,electronics,physics,math,any_stem]*/
  project(softdev_ml_quantum_phy_elec_any_stem), 
  X='Advise: \nYou are good at analytical and logical thinking, and at solving problems.\n
You are also having good technical skills and research ability \n
Since, you have interest in phyics, math and other stem subjects, and \n
have even done projects in either softwaredev, ml, quantum physics, electronics or any other STEM subjet. \n
So, you are well suited in the field of quantum computation.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(electronics,X) :-
  tech_skills, logical, 
  like_to(solve_problems), corporate, aptitude_high,
  course(electro), /*[electronics]*/
  communication(yes), project(elec),
  X='Advise: \nYou are good at logical thinking, and at solving problems.\n
You are also having good technical skills, high aptitude and good communication skills.\n
Since, you have interest in electronics and done projects based in it.\n
So, you are well suited in the field of electronics in corporate sector.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(hospitality_culinary,X) :-  
  computer_or_hands(hands), 
  service_minded(yes), serving_people(yes),
  planning(yes), like_to(dealing_with_people), communication(yes),
  X='Advise: \nYou are good at dealing with people, communication and planning.\n
You are also service minded and perfer working with hands. \n
So, you are well suited in the field of hospitality and culinary practices.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(marketing,X) :-  
  imaginative, creative, 
  course(busi), /*[business]*/
  planning(yes), like_to(dealing_with_people), communication(yes),
  X='Advise: \nYou are good at dealing with people, communication and planning.\n
You are also imaginative, creative and interested in business development. \n
So, you are well suited in the field of marketing.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(computational_biology,X) :-  
  analytical, logical, tech_skills, aptitude_high, like_to(solve_problems),
  course(softdev_bio), /*[softwaredev, biology]*/
  project(softdev_ml_bio),
  X='Advise: \nYou are good at analytical and logical thinking, and at solving problems.\n
You are also having good technical skills and high aptitude. \n
Since, you have interest in software development and biology, and \n
have even done projects in either softwaredev, ml or biology. \n
So, you are well suited in the field of computational biology.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(analyst,X) :-
  analytical, logical, aptitude_high, research(yes),
  course(math), /*[math]*/
  communication(yes),
  X='Advise: \nYou are good at analytical and logical thinking.\n
You are also having high aptitude and good communication skills. \n
Since, you have interest in math and at researching. \n
So, you are well suited for a career as an analyst.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(civil_services,X) :-
  serving_people(yes), aptitude_high, administrative(yes), patience_discipline(yes), ethical_behaviour(yes),
  planning(yes), like_to(dealing_with_people), communication(yes), serve_community(yes),
  X='Advise: \nYou want to serve people and interested in the administrative work.\n
You are also good at dealing with people, planning and have good communication skills. \n
You possess patience and discipline, and want to serve the community.\n
Since, You are also having high aptitude, you can prepare and sit for the exam of civil services. \n
You are well suited in the field of civil services.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(politics,X) :-
  serving_people(yes), like_to(dealing_with_people), communication(yes), leadership(yes),
  X='Advise: \nYou want to serve people and are also good at dealing with people.\n
You are also having good communication and leadership skills. \n
So, you are well suited in the field of politics.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(stock_market,X) :-
  analytical, aptitude_high, research(yes), patience_discipline(yes),
  course(math), /*[math]*/ 
  communication(yes), like_to(dealing_with_people), 
  X='Advise: \nYou are good at analytical thinking and research.\n
You are also good at dealing with people, have high aptitude and good communication skills. \n
Since, you have interest in math and, possess patience and discipline. \n
So, you are well suited for a career as a stock broker.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(ngo_nonprofit,X) :-
  serving_people(yes), like_to(dealing_with_people), serve_community(yes),
  X='Advise: \nYou want to serve people and are also good at dealing with people.\n
You want to serve the community.\n
So, you are well suited for a career in NGOs or non-profit organizations.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(consulting,X) :-
  analytical, logical, aptitude_high, like_to(solve_problems),
  course(math), /*[math]*/ 
  communication(yes), flexible(yes), team_work(yes),
  X='Advise: \nYou are good at analytical and logical thinking and, at solving problems.\n
You are also having high aptitude and good communication skills.\n
Since, you are flexible in your work style, work well in a team and, are interested in math.\n
So, you are well suited in the field of consulting.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(arts,X) :-
  extra_curr(per_arts), awards_extra_curr(yes), /*extra_curr([art,performing_arts,movie_making,audio_visual])*/
  dedication(yes), confident(yes),
  X='Advise: \nSince, you are good at extracurricular in arts, including performing arts such as dancing, singing, instrumental, acting, etc.,\n
audio visual arts including vfx, av, video editing, movie making, etc.\n
You are dedicated towards it, confident in performing/doing it and have been winning awards in your extracurricular events.\n
Hence, you are well suited for a career in arts.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(entrepreneurship,X) :-
  entrepreneur, creative,  tech_skills, course(busi), /*[business]*/ 
  aptitude_high, like_to(solve_problems),
  leadership(yes), communication(yes), flexible(yes), team_work(yes), networking(yes), 
  business_management_skills(yes), timemanagement__organisation_skills(yes),
  X='Advise: \nYou dont\'t want to work in corporate sector. You are creative, have good technical skills,\n
high aptitude and like to solve problems. You are a leader and a team player with good communication skills. \n
You are also flexible and good at networking and, possess business and time management skills.\n
Hence, you are well suited for a career as an entrepreneur.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(sports,X) :-
  extra_curr([sports]), awards_extra_curr(yes), 
  dedication(yes), confident(yes), 
  X='Advise: \nSince, you are good at extracurricular in sports,\n
You are dedicated towards it, confident in participating in it and have been winning awards in your sport\'s events.\n
Hence, you are well suited for a career in your respective sports.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(higher_education,X) :-
  higher_study, flagp(hnd), research(yes), enjoy_btech(no), high_grades(yes), pursue(yes), retract(flagp(hnd)), asserta(flagp(hd)),/*[ca,management,investment_banking,law,medical,others]*/
  X='Advise: \nSince, you didn\'t enjoy your BTech and don\'t wish to work at this moment and are interested in research.\n
You also have high grades and want to pursue other disciplines,\n
hence, you need to go for higher studies to pursue other disciplines.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(higher_education,X) :- 
  higher_study, flagp(hnd), high_grades(yes),  retract(flagp(hnd)), asserta(flagp(hd)), 
  X='Advise: \nSince, you wish to study more, hence you can go for higher studies and even\n
switch discplines/to explore other disciplines.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(higher_education,X) :- 
  higher_study, flagp(hnd), research(yes), high_grades(yes),  retract(flagp(hnd)), asserta(flagp(hd)),
  X='Advise: \nSince, you wish to study more and are interested in research, hence you can go for higher studies, get into research and even.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(higher_education,X) :-
  higher_study,flagp(hnd), enjoy_btech(no),  retract(flagp(hnd)), asserta(flagp(hd)),
  X='Advise: \nSince, you didn\'t enjoy your BTech and don\'t wish to work at this moment.\n
So, you can go for higher studies.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(higher_education,X) :-
  higher_study, flagp(hnd),pursue(yes),  retract(flagp(hnd)), asserta(flagp(hd)),/*[ca,management,investment_banking,law,medical,others]*/
  X='Advise: \nSince, you have just graduated from IIITD with a BTech degree,\n
hence, you need to go for higher studies to pursue other disciplines.\n\n',
  write(X),retract(flag(nf)),asserta(flag(f)).

field(discover_yourself,X):-
  flag(nf),
  X='Advise: \nSince, you possess so many diffrent skills and traits, you need to determine \n
the ones you are really good at or the ones you wish to pursue.\n\n',write(X). 




/*Questions to be asked and their corresponding verbose*/
question(enjoy_btech) :-
  write('You just graduated from IIITD with a BTech degree. Did you enjoy your degree program and, have interest in your academic discipline)?'), nl.

question(think_logical_imagine) :-
  write('Are you a person who thinks logically or imaginatively?'), nl.

question(think_creative_analytical) :-
  write('Are you a person who thinks creatively or analyticaly?'), nl.

question(tech_skills_great) :-
  write('How are your technical skills?'), nl.

question(communication) :-
  write('Do you have good communication skills?'), nl.

question(study_more_work) :-
  write('Do wish to work or study, research more?'), nl.

question(corporate_entrepreneur) :-
  write('Do you want start your own company or do you wish to work in the corporate?'), nl.

question(service_minded) :-
  write('Do you want to create or provide services?'), nl.

question(pursue) :-
  write('Do you want to switch or change your discipline?'), nl.

question(computer_or_hands) :-
  write('Do you like performing tasks on a computer or physically with your hands?'), nl.

question(like_to) :-
  write('Do you like to solve problems or dealing with people?'), nl.

question(aptitude) :-
  write('Did you take extra courses/credits in your undergrad or do you like solving puzzles and taking quizes?'), nl.

question(high_grades) :-
  write('Is your overall CGPA greater than 8.0 ?'), nl.

question(course) :-
  write('Which of the following course sets best describe your interests?'), nl. /*Which of the following subjects are of interest to you?*/

question(electives) :-
  write('Which category of electives do you prefer?'), nl.

question(research) :- 
  write('Are you interested in research or research related practices?'), nl.

question(extra_curr) :-
  write('Are you involved in extracurricular activities, if yes which one?'), nl.

question(awards_extra_curr) :-
  write('Have you won any awards in your extracurricular activities?'), nl.

question(project) :-
  write('Which of the following project topic sets you are most likely to take up?'), nl,  /*Which of the following domains do you prefer for your projects?*/
  write('Please choose the option which sounds most intriguing to you.'), nl.

question(product_knowledge) :-
  write('Do you know how to indentify requirements and fulfill them?'), nl.

question(dedication) :-
  write('Are you able to dedicate yourself towards any task that you take up?'), nl.

question(commitment) :-
  write('Are you able to commit yourself towards a goal/target of your choice?'), nl.

question(confident) :-
  write('Are you confident of your choices and decisions?'), nl.

question(team_work) :-
  write('Do you prefer working in a team or on your own?'), nl.

question(leadership) :-
  write('Do you have what it takes to be a leader?'), nl.

question(flexible) :-
  write('Are you open to changes in work, timings, demands, etc. ?'), nl.

question(ethical_behaviour) :-
  write('Do believe ethics are important in this fast moving world?'), nl.

question(initiative) :-
  write('Do you believe taking initiatives and leading them to success?'), nl.

question(practical) :-
  write('Do you believe in more in hard results or exploration based on your intuition?'), nl.

question(serving_people) :-
  write('Do you like serving and helping people out?'), nl.

question(administrative) :-
  write('Do you wish to take up administrative positions and getting things done?'), nl.

question(serve_community) :-
  write('Do believe in doing something for an entire community and bringing about positive changes?'), nl.

question(patience_discipline) :-
  write('Do you think you can maintain your patience and discipline under any  circumstances?'), nl.

question(planning) :-
  write('Do you like planning events, road maps, etc.?'), nl.

question(networking) :-
  write('Do like spotting people who are quite talented at certain tasks/jobs and inviting them to work together?'), nl.

question(business_management_skills) :-
  write('Do you enjoy managing tasks and contributing to their completion?'), nl.

question(timemanagement__organisation_skills) :-
  write('Do you believe that you are able to manage your time well according to your commitments and priorities?'), nl.




/*Answers and their corresponding verbose to be printed as options*/

answer(yes) :-
  write('Yes.').

answer(no) :-
  write('No.').

answer(logic) :-
  write('Logically').

answer(imagine) :-
  write('Imaginatively').

answer(create) :-
  write('Creatively').

answer(analyse) :-
  write('Analyticaly').

answer(great) :-
  write('Great').

answer(not_so_great) :-
  write('Not so great').

answer(hstudy) :-
  write('Study more').

answer(work) :-
  write('Work').

answer(entre) :-
  write('Start my own company/venture').

answer(job) :-
  write('Work in the corporate').

answer(computer) :-
  write('Working on a computer').

answer(hands) :-
  write('Working with my hands').

answer(solve_problems) :-
  write('Solving a problem.').

answer(dealing_with_people) :-
  write('Dealing with people.').

answer(ssh) :-
  write('SSH').

answer(design) :-
  write('Design').

answer(computersc) :-
  write('Computer Sc.').

answer(ece) :-
  write('Electronics').

answer(per_arts) :-
  write('Art, performing arts, movie making or audio visual').

answer(sports) :-
  write('Sports').

answer(other) :-
  write('Other').

answer(none) :-
  write('None').

answer(math) :-
  write('{Math}').

answer(dsa_math) :-
  write('{DSA,Computer Sci.,Math}').

answer(dsa_math_ml) :-
  write('{DSA,Computer Sci.,Math,ML}').

answer(dsa_ml_elec_phys_math_any_stem) :-
  write('{DSA,Computer Sci.,Math,ML,Electronics,Physics or Any Other STEM Subject}').

answer(electro) :-
  write('{Electronics}').

answer(busi) :-
  write('{Business}').

answer(softdev_bio) :-
  write('{Computer Sci.,Biology}').

answer(softdev_des) :-
  write('{Software Development,Design}').

answer(softdev) :-
  write('{Software Development}').

answer(softdev_ai_ml_robo) :-
  write('{Software Development, Artificial Intelligence, Machine Learning, Robotics}').

answer(data_ana_data_sci) :-
  write('{Data Analytics, Data Science}').

answer(softdev_ml_quantum_phy_elec_any_stem) :-
  write('{Software Development, Machine Learning, Quantum Physics, Electronics, or any other STEM domain}').

answer(elec) :-
  write('{Electronics}').

answer(softdev_ml_bio) :-
  write('{Software Development, Machine Learning, Biology}').




/*Asking questions and assigning them answer*/

enjoy_btech(Answer) :-
  response(enjoy_btech,Answer).
enjoy_btech(Answer) :-
  \+ response(enjoy_btech, _),
  ask(enjoy_btech,Answer,[yes,no]).

think_logical_imagine(Answer) :-
  response(think_logical_imagine,Answer).
think_logical_imagine(Answer) :-
  \+ response(think_logical_imagine,_),
  ask(think_logical_imagine,Answer,[logic,imagine]).

think_creative_analytical(Answer) :-
  response(think_creative_analytical,Answer).
think_creative_analytical(Answer) :-
  \+ response(think_creative_analytical,_),
  ask(think_creative_analytical,Answer,[create,analyse]).

tech_skills_great(Answer) :-
  response(tech_skills_great,Answer).
tech_skills_great(Answer) :-
  \+ response(tech_skills_great,_),
  ask(tech_skills_great,Answer,[great,not_so_great]).

communication(Answer) :-
  response(communication,Answer).
communication(Answer) :-
  \+ response(communication,_),
  ask(communication,Answer,[yes,no]).

study_more_work(Answer) :-
  response(study_more_work,Answer).
study_more_work(Answer) :-
  \+ response(study_more_work,_),
  ask(study_more_work,Answer,[hstudy,work]).

corporate_entrepreneur(Answer) :-
  response(corporate_entrepreneur,Answer).
corporate_entrepreneur(Answer) :-
  \+ response(corporate_entrepreneur,_),
  ask(corporate_entrepreneur,Answer,[entre,job]).

service_minded(Answer) :-
  response(service_minded,Answer).
service_minded(Answer) :-
  \+ response(service_minded,_),
  ask(service_minded,Answer,[yes,no]).

pursue(Answer) :-
  response(pursue,Answer).
pursue(Answer) :-
  \+ response(pursue,_),
  ask(pursue,Answer,[yes,no]).

computer_or_hands(Answer) :-
  response(computer_or_hands,Answer).
computer_or_hands(Answer) :-
  \+ response(computer_or_hands,_),
  ask(computer_or_hands,Answer,[computer,hands]).

like_to(Answer) :-
  response(like_to,Answer).
like_to(Answer) :-
  \+ response(like_to,_),
  ask(like_to,Answer,[solve_problems,dealing_with_people]).

aptitude(Answer) :-
  response(aptitude,Answer).
aptitude(Answer) :-
  \+ response(aptitude,_),
  ask(aptitude,Answer,[yes,no]).

high_grades(Answer) :-
  response(high_grades,Answer).
high_grades(Answer) :-
  \+ response(high_grades,_),
  ask(high_grades,Answer,[yes,no]).

course(Answer) :-
  response(course,Answer).
course(Answer) :-
  \+ response(course,_),
  ask(course,Answer,[math,dsa_math,dsa_math_ml,dsa_ml_elec_phys_math_any_stem,electro,busi,softdev_bio,none]).

electives(Answer) :-
  response(electives,Answer).
electives(Answer) :-
  \+ response(electives,_),
  ask(electives,Answer,[ssh,design,computersc,ece]).

research(Answer) :-
  response(research,Answer).
research(Answer) :-
  \+ response(research,_),
  ask(research,Answer,[yes,no]).

extra_curr(Answer) :-
  response(extra_curr,Answer).
extra_curr(Answer) :-
  \+ response(extra_curr,_),
  ask(extra_curr,Answer,[per_arts,sports,other,none]).

awards_extra_curr(Answer) :-
  response(awards_extra_curr,Answer).
awards_extra_curr(Answer) :-
  \+ response(awards_extra_curr,_),
  ask(awards_extra_curr,Answer,[yes,no]).

project(Answer) :-
  response(project,Answer).
project(Answer) :-
  \+ response(project,_),
  ask(project,Answer,[softdev_des,softdev,softdev_ai_ml_robo,data_ana_data_sci,softdev_ml_quantum_phy_elec_any_stem,elec,softdev_ml_bio,none]).

product_knowledge(Answer) :-
  response(product_knowledge,Answer).
product_knowledge(Answer) :-
  \+ response(product_knowledge,_),
  ask(product_knowledge,Answer,[yes,no]).

dedication(Answer) :-
  response(dedication,Answer).
dedication(Answer) :-
  \+ response(dedication,_),
  ask(dedication,Answer,[yes,no]).

commitment(Answer) :-
  response(commitment,Answer).
commitment(Answer) :-
  \+ response(commitment,_),
  ask(commitment,Answer,[yes,no]).

confident(Answer) :-
  response(confident,Answer).
confident(Answer) :-
  \+ response(confident,_),
  ask(confident,Answer,[yes,no]).

team_work(Answer) :-
  response(team_work,Answer).
team_work(Answer) :-
  \+ response(team_work,_),
  ask(team_work,Answer,[yes,no]).

leadership(Answer) :-
  response(leadership,Answer).
leadership(Answer) :-
  \+ response(leadership,_),
  ask(leadership,Answer,[yes,no]).

flexible(Answer) :-
  response(flexible,Answer).
flexible(Answer) :-
  \+ response(flexible,_),
  ask(flexible,Answer,[yes,no]).

ethical_behaviour(Answer) :-
  response(ethical_behaviour,Answer).
ethical_behaviour(Answer) :-
  \+ response(ethical_behaviour,_),
  ask(ethical_behaviour,Answer,[yes,no]).

initiative(Answer) :-
  response(initiative,Answer).
initiative(Answer) :-
  \+ response(initiative,_),
  ask(initiative,Answer,[yes,no]).

practical(Answer) :-
  response(practical,Answer).
practical(Answer) :-
  \+ response(practical,_),
  ask(practical,Answer,[yes,no]).

serving_people(Answer) :-
  response(serving_people,Answer).
serving_people(Answer) :-
  \+ response(serving_people,_),
  ask(serving_people,Answer,[yes,no]).

administrative(Answer) :-
  response(administrative,Answer).
administrative(Answer) :-
  \+ response(administrative,_),
  ask(administrative,Answer,[yes,no]).

serve_community(Answer) :-
  response(serve_community,Answer).
serve_community(Answer) :-
  \+ response(serve_community,_),
  ask(serve_community,Answer,[yes,no]).

patience_discipline(Answer) :-
  response(patience_discipline,Answer).
patience_discipline(Answer) :-
  \+ response(patience_discipline,_),
  ask(patience_discipline,Answer,[yes,no]).

planning(Answer) :-
  response(planning,Answer).
planning(Answer) :-
  \+ response(planning,_),
  ask(planning,Answer,[yes,no]).

networking(Answer) :-
  response(networking,Answer).
networking(Answer) :-
  \+ response(networking,_),
  ask(networking,Answer,[yes,no]).

business_management_skills(Answer) :-
  response(business_management_skills,Answer).
business_management_skills(Answer) :-
  \+ response(business_management_skills,_),
  ask(business_management_skills,Answer,[yes,no]).

timemanagement__organisation_skills(Answer) :-
  response(timemanagement__organisation_skills,Answer).
timemanagement__organisation_skills(Answer) :-
  \+ response(timemanagement__organisation_skills,_),
  ask(timemanagement__organisation_skills,Answer,[yes,no]).




/* Acts like a function for printing options in an ordered manner*/
print_options([], _).
print_options([First|Rest], O_Num) :-
  write(O_Num), write('. '),answer(First), nl,
  NextO_Num is O_Num + 1,
  print_options(Rest, NextO_Num).


/* Acts like a function for parsing an option number(entered) and returns the option for the corresponding option number in the Options list [First|Rest]*/
select_ans(1, [First|_], First).
select_ans(O_Num, [First|Rest], Response) :-
  O_Num > 1,
  NextO_Num is O_Num - 1,
  select_ans(NextO_Num, Rest, Response).


/* Acts like a function for asking questions and taking answers from the user*/
ask(Que, Ans, Options) :-
  question(Que),
  print_options(Options, 1),
  read(Sel_choi),
  select_ans(Sel_choi, Options, Response),
  asserta(response(Que, Response)),
  Response = Ans.