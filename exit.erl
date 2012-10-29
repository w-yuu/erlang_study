-module(exit).
-compile(export_all).


on_exit(Pid,Fun) ->
    spawn(fun() ->
                process_flag(trap_exit, true),
                link(pid) ,
                receive
                    {'EXIT', Pid, Why} ->
                        Fun(Why)
                end
        end).

