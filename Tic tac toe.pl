win(Board, Player) :- row_win(Board, Player);
 col_win(Board, Player);
 diagwin(Board, Player).
row_win(Board, Player) :- Board = [Player,Player,Player,_,_,_,_,_,_];
 Board = [_,_,_,Player,Player,Player,_,_,_];
Board = [_,_,_,_,_,_,Player,Player,Player].
col_win(Board, Player) :- Board = [Player,_,_,Player,_,_,Player,_,_];
 Board = [_,Player,_,_,Player,_,_,Player,_];
 Board = [_,_,Player,_,_,Player,_,_,Player].
diagwin(Board, Player) :- Board = [Player,_,_,_,Player,_,_,_,Player];
Board = [_,_,Player,_,Player,_,Player,_,_].
omove([a,B,C,D,E,F,G,H,I], Player, [Player,B,C,D,E,F,G,H,I]).
omove([A,a,C,D,E,F,G,H,I], Player, [A,Player,C,D,E,F,G,H,I]).
omove([A,B,a,D,E,F,G,H,I], Player, [A,B,Player,D,E,F,G,H,I]).
omove([A,B,C,a,E,F,G,H,I], Player, [A,B,C,Player,E,F,G,H,I]).
omove([A,B,C,D,a,F,G,H,I], Player, [A,B,C,D,Player,F,G,H,I]).
omove([A,B,C,D,E,a,G,H,I], Player, [A,B,C,D,E,Player,G,H,I]).
omove([A,B,C,D,E,F,a,H,I], Player, [A,B,C,D,E,F,Player,H,I]).
omove([A,B,C,D,E,F,G,a,I], Player, [A,B,C,D,E,F,G,Player,I]).
omove([A,B,C,D,E,F,G,H,a], Player, [A,B,C,D,E,F,G,H,Player]).
xmove([a,B,C,D,E,F,G,H,I], 1, [x,B,C,D,E,F,G,H,I]).
xmove([A,a,C,D,E,F,G,H,I], 2, [A,x,C,D,E,F,G,H,I]).
xmove([A,B,a,D,E,F,G,H,I], 3, [A,B,x,D,E,F,G,H,I]).
xmove([A,B,C,a,E,F,G,H,I], 4, [A,B,C,x,E,F,G,H,I]).
xmove([A,B,C,D,a,F,G,H,I], 5, [A,B,C,D,x,F,G,H,I]).
xmove([A,B,C,D,E,a,G,H,I], 6, [A,B,C,D,E,x,G,H,I]).
xmove([A,B,C,D,E,F,a,H,I], 7, [A,B,C,D,E,F,x,H,I]).
xmove([A,B,C,D,E,F,G,a,I], 8, [A,B,C,D,E,F,G,x,I]).
xmove([A,B,C,D,E,F,G,H,a], 9, [A,B,C,D,E,F,G,H,x]).
xmove(Board, _, Board) :- write('Illegal Move.'), nl.
disp([A,B,C,D,E,F,G,H,I]) :-
write([A,B,C]),nl,
write([D,E,F]),nl,
write([G,H,I]),nl,nl.
start :- how_to_play, strt([a,a,a,a,a,a,a,a,a]).
how_to_play :-
 write('Welcome to Tic Tac Toe Game You are x player, Enter positions followed by a period.'),
 nl,
 disp([1,2,3,4,5,6,7,8,9]).
strt(Board) :- win(Board, x), write('Congratulation !! You win!').
strt(Board) :- win(Board, o), write('AI win!').
strt(Board) :- read(N),
 xmove(Board, N, NewBoard),
 disp(NewBoard),
 oplay(NewBoard, NewnewBoard),
 disp(NewnewBoard),
 strt(NewnewBoard).
can_x_win(Board) :- omove(Board, x, NewBoard), win(NewBoard, x).
oplay(Board,NewBoard) :-
 omove(Board, o, NewBoard),
 win(NewBoard, o),!.
oplay(Board,NewBoard) :-
 omove(Board, o, NewBoard),
 not(can_x_win(NewBoard)).
oplay(Board,NewBoard) :-
 omove(Board, o, NewBoard).
oplay(Board,NewBoard) :-
 not(member(a,Board)),!,
 write('Game Ended Without Winner!'), nl,
 NewBoard = Board.
