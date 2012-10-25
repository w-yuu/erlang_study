-module(todo).
-export([title_clear/1]).
-include("todo.hrl").

%%タイトルをタイトルとバリューを結合した値にする
title_clear(#easy_todo{title = Title,value=Value} = R) ->
R#easy_todo{title = string:concat(Title,Value)};
title_clear(_)->false.
