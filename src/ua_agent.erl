-module(ua_agent, [UA]).

-define(REGEXP_TO_PLATFORM, [
        {"iPod", "iPod"},
        {"iPad", "iPad"},
        {"iPhone", "iPhone"},
        {"windows", "Windows"},
        {"os x \\d+[._]\\d+", "OS X"},
        {"linux", "Linux"}
    ]).

-ifdef(TEST).
-compile(export_all).
-else.
-export([platform/0]).
-endif.

get_ua() -> UA.

platform() ->
    platform(?REGEXP_TO_PLATFORM).

platform([{Regexp, OS}|T]) ->
    case re:run(UA, Regexp, [global, caseless]) of
        {match, _} -> OS;
        _          -> platform(T)
    end;

platform([]) ->
    undefined.
