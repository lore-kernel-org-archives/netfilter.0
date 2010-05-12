From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: iptable how many rule can manage iptable
Date: Wed, 12 May 2010 20:09:54 +0200
Message-ID: <20100512200954.3f53f3f6@catlap>
References: <l2vf1cc03e01005121009j3ce0e30cj56ac615688a58916@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <l2vf1cc03e01005121009j3ce0e30cj56ac615688a58916@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mamadou =?UTF-8?B?VG91csOp?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

>Hi, all

Hi,

>i'd like to know how many rule can manage iptable.
>I'm asking that because i'd to drop all traffric from my localnet to
>porn site. I've a database of porn site witch contain about 900 000
>domains. I know there are solutions like squidguard. But for my linux
>box i'd to use iptable to prevent users access to porn site and other
>blacklist site.

It's not feasible to implement 900 000 long ruleset in iptables
even with ipset extension or with fancy hierarchical chains. The
other problem is that iptables works on ip addresses and your database
is comprised of domains. There can be more then one site on single ip
address. Blocking IPs and not domains could cut access to some legit
sites.

Squid+squidguard is good option. I've heard of some dns based
solutions (domain blacklisting on dnscache level), but I don't know any
actual software.

Best regards,
Marek
