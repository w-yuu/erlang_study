-module(timer).
-compile(export_all).


start(Time,Fun) ->
    spawn(timer, timer,Time,Fun).

cancel(Pid) -> Pid ! cancel.

timer(Time,Fun) ->
    receive
        cancel ->
            void
    after Time ->
            %io:format("OK2~n"),
            Fun(),
            Fun()
    end.
