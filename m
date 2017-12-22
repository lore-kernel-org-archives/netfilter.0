From: Robert White <rwhite@pobox.com>
Subject: Re: limit + log + tcp not working ?
Date: Fri, 22 Dec 2017 22:25:34 +0000
Message-ID: <2d098403-8886-d219-dfcd-987ed5952ed6@pobox.com>
References: <CANSGRxTJHLttrZw6Oy+mfxN07ow_fq9yuO=X=JsJv6wuLDgSjg@mail.gmail.com>
 <64babe0d-7b38-1f6f-e192-1f4aa79a0fd6@pobox.com>
 <CANSGRxROfErREdSKv4ooheYPD-bT3r33h1LTkDqeHryvTOBBPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANSGRxROfErREdSKv4ooheYPD-bT3r33h1LTkDqeHryvTOBBPQ@mail.gmail.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: paulo bruck <paulobruck1@gmail.com>
Cc: netfilter@vger.kernel.org, pauloric <pauloric@contatogs.com.br>

On 12/22/2017 08:52 PM, paulo bruck wrote:
> thanks Robert
> 
> My bad 8(  I choose a wrong example.
> 
> Changing to kbytes now I see traffic throw rule.
> What I'm trying to understand is the sequence and meaning of limit
> taking different positions inside a rule.
> 
> 
> counter packets 7077 bytes 690164 limit rate 10 kbytes/minute counter
> packets 0 bytes 0 tcp sport http counter packets 0 bytes 0 log prefix
> "acesso a porta 80" flags all counter packets 0 bytes 0
> 
> If I use limit + tcp + log  as above means:

You are thinking about it too hard.

Each rule is evaluated left-to-right. Every element has a "truth" value,
a boolean pass-fail. So things like "counter" and "log" are "always
true" (it has no "test-like action").

Other elements like "tcp dport http" are multiple tests in one, where
first it has to be "tcp" and, now that the tcp-ness is established the
packet is known to have a destination port, so the port number can be
compared to 80 (the http well known port) for equality.

The first time you hit something that is "false" the rest of the line is
skipped.

So mentally put the words "and then" between each directive.

So :: counter and then limit rate 10 kbytes/minute and then counter and
then tcp sport http and then counter and then log prefix "whatever"
flags all and then counter

A very few things break this rule. Like "accept" and "drop" are terminal
to the rule, and the chain, once you "accept" then the rest of the rule
and the rest of the chain just don't matter.

So limit comes before action if you want that action to be limited by
that limit.

Same for literally everything else.

Now what this means is that order is important, but unlike iptables, you
can stack the non-terminal actions several deep in a rule, even
returning adding extra tests after one action and before the next.

So you can make long and complex rules that get progressively more picky
about the packets that get to that point.

The caraige return is like a "start-from-scratch" where the previous
rule is done and the condition is reset to "true".

That is, any rule could be mentally rewritten as "true and then (rest of
rule).

This is why you can just have a log statement as the whole rule if you
want to log every packet that hasn't yet hit a terminal like accept or
drop. Indeed a bare log rule at the end of a chain is a great way to log
all the packets that are about to hit the "policy" of the chain, or
which have otherwise gotten to the end of a sub-chain when you were
expecting to handle every possibility.

So just relax and understand that the whole thing is "as you read",
while iptables was "test-and-do".

So no, the limit isn't limiting "all packets that enter the rule", it
limits all packets that "get as far along the rule as the limit statement".

So ...

limit rate 10 kbytes/minute tcp dport http log "whatever" flags all
and
tcp dport http limit rate 10 kbytes/minute log "whatever" flags all

produce completely different results.

In the first one you are only considering 10 kilobytes a minute of
packets, then of that limited set you are logging the http requests.

In the second one you are considering the first 10 kilobytes of http
requests per minute.

So in the first rule the ssh and ftp and sip and dhcp and all the other
traffic are being considered in the limit, and then only the http is
being logged. This is almost certianly not what you want.

In the second the http-ness is considered first, and then you limit the
logging rate.

And of course it is not "10 kbytes of log" it's 10 kbytes of data" so if
you are sending large requests, and the Mtu is the nominal 1500 bytes
per packet, your ten kbytes is probably seven or eight packets a minute
total.

See... thing, and then thing, and then thing... as you read.

--Rob.
