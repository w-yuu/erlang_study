-module(para_1).
-compile(export_all).

loop() ->
    receive
        {From,{rectangle, Width,Ht}} ->
            %io:format("Area of rectangle is ~p~n",[Width * Ht]),
            From ! {self(),{ Width * Ht}},
            loop();
        {From,{circle,R}} ->
            %io:format("Area of circle is ~p~n",[3.14159 * R * R]),
            From ! { self(), {(3.14159 * R * R)}},
            loop();
        {From,{Other}} ->
            %io:format("I don't know waht the area of a ~p is ~n",[Other]),
                    From !{self(), {Other}},
            loop()
    end.

rpc(Pid,Request) ->
    Pid ! {self(), Request},
    receive
       Responce ->
           Responce
    end. 
    
