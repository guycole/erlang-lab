%test
-module(one53).
-export([discover/0]).

hundreds(Original) ->
    Original div 100.

tens(Original) ->
    (Original - (hundreds(Original) * 100)) div 10.

ones(Original) ->
    Original rem 10.

cubed(Hundreds, Tens, Ones) ->
    Hundreds * Hundreds * Hundreds + Tens * Tens * Tens + Ones * Ones * Ones.

evaluate(Original, Cubed) ->
    case Original == Cubed of
	true -> io:fwrite("original:"), io:format("~3..0B~n", [Original]);
	false -> io:fwrite("")
    end.

evaluate(Original, Hundreds, Tens, Ones) ->
    evaluate(Original, cubed(Hundreds, Tens, Ones)).

do_count(1000) ->
    1000;
do_count(Value) ->
    evaluate(Value, hundreds(Value), tens(Value), ones(Value)), do_count(Value + 1).

discover() ->
    do_count(100).
