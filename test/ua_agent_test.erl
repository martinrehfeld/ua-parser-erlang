-module(ua_agent_test).

-include_lib("eunit/include/eunit.hrl").

get_ua_test() ->
    UserAgentString = "Hello, I'm a User-Agent",
    UA = ua_agent:new(UserAgentString),
    UserAgentString == UA:get_ua().

os_test() ->
    Windows = [
        {"Windows", "Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)"},
        {"Windows", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8"},
        {"Windows", "Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.2.149.27 Safari/525.13"},
        {"Windows", "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1) Gecko/20090612 Firefox/3.5"},
        {"OS X", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7; en-us) AppleWebKit/531.2+ (KHTML, like Gecko) Version/4.0.1 Safari/530.18"},
        {"Linux", "Opera/9.64 (X11; Linux i686; U; Linux Mint; it) Presto/2.1.1"},
        {"iPad", "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10"},
        {"iPhone", "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C28 Safari/419.3"},
        {"iPod", "Mozilla/5.0 (iPod; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7"}
    ],
    Fun = fun({Expected, Agent}) ->
            UA = ua_agent:new(Agent),
            ?assertEqual(Expected, UA:platform())
    end,

    lists:foreach(Fun, Windows).
