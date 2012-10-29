-module(if_fun).
-export([is/1]).

is([]) -> false;
is(X) ->
	if
	is_number(X) -> "number!";
	is_atom(X) -> "atom!";
	true -> false
	end.
