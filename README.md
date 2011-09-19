User Agent Parser
=================

This small library allows you to quickly extract the `platform` and `browser`
out of the user agent.

Usage
-----

	UA = ua_agent:new("Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8").
	UA:platform(). # => "Windows"
	UA:browser().  # => "Safari"
