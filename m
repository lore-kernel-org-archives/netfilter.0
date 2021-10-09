From: halfdog <me@halfdog.net>
Subject: Re: Invalidate conntrack using iptables rule
Date: Sat, 09 Oct 2021 15:40:49 +0000
Message-ID: <3542-1633794049.505584@Ajb7.dwP8.GSCy>
References: <2015-1629793795.014053@4P1Y.V0pY.lR6P>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <2015-1629793795.014053@4P1Y.V0pY.lR6P>
List-ID: <netfilter.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Any comments on this? Without any feedback I would try the policy
timeout -1 method and dig into the kernel code to see if that
should really work without side effects.

hd

halfdog writes:
> Hello List,
>
> Is there a way to (mis-)use an iptables rule to invalidate the
> currently established conntrack entry related to an packet being
> processed? The packet can be identified due to violating connbytes
> and u32 match criteria.
>
> One solution I came up so far to emulate that behaviour was to
> set a mark/label on the conntrack when the criteria is met the
> first time and then DROP all packets with that mark/label from
> here on. But that somehow would bloat the ruleset and keep an
> useless conntrack entry in memory where just terminating the
> conntrack would do all of it at once.
>
> Another solution might be to modify the conntrack timeout later
> in the raw table using "-j CT --timeout [policy]" applying a
> timer value of "-1" and thus hopefully immediately invalidating
> the conntrack entry.
>
>
>
> Is there an easier solution to that problem? If no, which one
> of the two solutions from above seems to be easier to implement
> and maintain in a stable, riskfree way in the long run?
>
> Kind regards,
> hd

