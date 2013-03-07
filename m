From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Connection tracking counters increasing
Date: Thu, 7 Mar 2013 18:44:16 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1303071842460.24878@nerf07.vanv.qr>
References: <5138BC91.9060903@amfes.com> <alpine.LNX.2.01.1303071726260.2529@nerf07.vanv.qr> <5138C95B.1080405@amfes.com> <alpine.LNX.2.01.1303071816090.23717@nerf07.vanv.qr> <assp.177886a3c9.5138CCB6.3050705@amfes.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <assp.177886a3c9.5138CCB6.3050705@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel L. Miller" <dmiller@amfes.com>
Cc: Netfilter-Users <netfilter@vger.kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>


On Thursday 2013-03-07 18:21, Daniel L. Miller wrote:
>>>
>>> I've noticed that my connection tracking counters keep increasing -
>>> /proc/sys/net/netfilter/nf_conntrack_count
>>> and when it reaches /proc/sys/net/netfilter/nf_conntrack_max things break.
>>
>> Could it be you are being DDoSed?
>
> Anything's possible - but I don't have a high-visibility site.  The connection
> counter increments gradually - a new connection every couple of seconds or so.
>
> Trying to understand what's going on, I installed the "conntrack" tool.
> conntrack -S yields:
> entries                 28752
> searched                27822
> found                   11950927
> new                     457431
> invalid                 333
> ignore                  347677
> delete                  465404
> delete_list             428962
> insert                  414575
> insert_failed           0
> drop                    0
> early_drop              0
> icmp_error              0
> expect_new              0
> expect_create           0
> expect_delete           0
> search_restart          0
>
> But more confusing is conntrack -L only shows 52 entries.

You need to count in entries from different conntrack tables
too. I see something similar, however:

18:42 ares07:/home/jengelh # conntrack -L >/dev/null; conntrack -L expect
>/dev/null; cat /proc/sys/net/netfilter/nf_conntrack_count
conntrack v1.4.0 (conntrack-tools): 32 flow entries have been shown.
conntrack v1.4.0 (conntrack-tools): 0 expectations have been shown.
43
18:42 ares07:/home/jengelh # conntrack -L >/dev/null; conntrack -L expect
>/dev/null; cat /proc/sys/net/netfilter/nf_conntrack_count
conntrack v1.4.0 (conntrack-tools): 31 flow entries have been shown.
conntrack v1.4.0 (conntrack-tools): 0 expectations have been shown.
42

That might be connections in state DYING, but perhaps Pablo has an idea
what could be going on w.r.t. different numbers.
