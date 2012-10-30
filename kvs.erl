%%単純な名前サーバ
%%@supec kvs:start() -> true
%%サーバを起動する。この関数は、kvsという名前でサーバを作る。
%%
%%@spec kvs:store(Key, Value) -> true
%%KeyとValueを対応付ける。
%%
%%@spec kvs:lookup(Key) -> {ok,Value} | undefined
%%Keyの値を検索する。Keyに対応する値があれば{ok, Value}を返す。対応する値がなければundefinedを返す
%%
%%
-module(kvs).
-export([start/0, store/2, lookup/1]).

start() ->
    register(kvs,spawn(fun() -> loop() end)).

store(Key, Value) -> rpc({store, Key, Value}).

lookup(Key) -> rpc({lookup,Key}).

rpc(Q) -> 
    kvs ! {self(), Q},
    receive
        {kvs,Reply} ->
            Reply
    end.

loop() -> 
    receive
        {From, {store, Key, Value}} ->
            put(Key, {ok, Value}),
            From ! {kvs, true},
            loop();
        {From, {lookup,Key}} ->
            From ! {kvs, get(Key)},
            loop()
    end.
    

