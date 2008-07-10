From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: DNAT multiple --to-destination gone: why?
Date: Thu, 10 Jul 2008 12:03:03 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807101201290.27323@fbirervta.pbzchgretzou.qr>
References: <487558AC.8080704@ca.sophos.com> <48759A72.9030503@usa.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48759A72.9030503@usa.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Cepek <josh.cepek@usa.net>
Cc: David Sparks <dave@ca.sophos.com>, netfilter@vger.kernel.org


On Thursday 2008-07-10 07:13, Josh Cepek wrote:
>
> With the statistic match you can create a round-robin that targets each rule in
> turn.  To do what you seek above you could use this series of rules, with your
> own additional matches added as required:
> iptables -A PREROUTING -t nat -m statistic --mode nth --every 2 -j DNAT
> 10.0.0.101-102
> iptables -A PREROUTING -t nat -j DNAT 10.0.0.104-105
>
> This is conceptually the same (but simpler than) the following series of rules:
> iptables -A PREROUTING -t nat -m statistic --mode nth --every 4 -j DNAT
> 10.0.0.101
> iptables -A PREROUTING -t nat -m statistic --mode nth --every 3 -j DNAT
> 10.0.0.102
> iptables -A PREROUTING -t nat -m statistic --mode nth --every 2 -j DNAT
> 10.0.0.104
> iptables -A PREROUTING -t nat -j DNAT 10.0.0.105

It is not conceptually the same. NAT will try to use the same address
pair (in this case, destination IP) for the same source address,
in fact creating a not-so-round-robin. Splitting it up into multiple DNAT
rules makes it a true round-robin.
