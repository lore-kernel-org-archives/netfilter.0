From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Gateway with Iptables
Date: Mon, 29 Oct 2007 17:12:45 +0100
Message-ID: <008401c81a46$8adab100$0b0ffe0a@NS006819>
References: <472568A2.3040002@liqwidkrystal.com> <4725BF05.5000708@liqwidkrystal.com>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4725BF05.5000708@liqwidkrystal.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> i have a proxy server, when i enable the proxy my mail clients are
> not able to send/receive mail. here is my iptables. please help me
> with the necessary changes.

[...]

> but after applying this users are able to connect
> to the Internet directly without enable proxy.

How do you test this? If you configured Squid for transparent proxying
and allow http (AFAIK you can't transparent proxy https) inbound, your
users don't have to configure a proxy in their browser and will use the
proxy "transparently".

> what else i have to do to stop direct connection , they must use
> proxy.

No offense, but I can't understand your ruleset. It looks like you
scraped things together from other rulesets (which by itself doesn't
have to be not wrong).
I was going to rewrite the script to make sense of it, but I'm not clear
on what is running where and what exactly is allowed. Also:
- AFAICS some user defined chains are not defined so some rules should
generate an error
- some rules seem to allow too much
- rules from the FORWARD chain call a user defined chain for the OUTPUT
chain
- it's easier to set the chain policies to DROP and specifically ACCEPT
what you want to

Perhaps someone else can make sense of this based on current
information, but for me it's impossible (well, I would be able to make
something out of it, but I have no illusion that such ruleset would be
working).


Grts,
Rob


