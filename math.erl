-module(math).
-export([max/2]).

max(X,Y) when  X > Y , is_number(X),is_number(Y) -> X;
max(X,Y) when X < Y, is_number(X),is_number(Y) -> Y;
max(X,Y) when X=:=Y, is_number(X),is_number(Y) -> x;
max(_,_) -> 'error'.
