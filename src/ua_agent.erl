-module(ua_agent, [UA]).

-define(REGEXP_TO_PLATFORM, [
        {"iPod"              , "iPod"},
        {"iPad"              , "iPad"},
        {"iPhone"            , "iPhone"},
        {"Windows"           , "Windows"},
        {"OS X \\d+[._]\\d+" , "OS X"},
        {"Android"           , "Android"},
        {"Linux"             , "Linux"}
    ]).

-define(REGEXP_TO_BROWSER, [
        {"Konqueror" , "Konqueror"},
        {"Chrome"    , "Chrome"},
        {"Safari"    , "Safari"},
        {"MSIE"      , "IE"},
        {"Opera"     , "Opera"},
        {"Firefox"   , "Firefox"}
    ]).

-ifdef(TEST).
-compile(export_all).
-else.
-export([platform/0, browser/0]).
-endif.

browser() ->
    browser(?REGEXP_TO_BROWSER).

browser([{Regexp, Browser}|T]) ->
    case re:run(UA, Regexp, [global, caseless]) of
        {match, _} -> Browser;
        _          -> browser(T)
    end;

browser([]) -> undefined.

platform() ->
    platform(?REGEXP_TO_PLATFORM).

platform([{Regexp, OS}|T]) ->
    case re:run(UA, Regexp, [global, caseless]) of
        {match, _} -> OS;
        _          -> platform(T)
    end;

platform([]) -> undefined.
