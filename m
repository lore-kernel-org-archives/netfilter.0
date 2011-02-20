From: Andrew Beverley <andy@andybev.com>
Subject: Re: mark and accept in a single rule
Date: Sun, 20 Feb 2011 17:18:30 +0000
Message-ID: <1298222310.12048.40.camel@andybev>
References: <AANLkTimFXztjt5iJbv2bnP3iqe9GoTcaqEbg1ULsWynZ@mail.gmail.com>
	 <1298215673.12048.12.camel@andybev>
	 <AANLkTimO0tqE4ftCtBLv1n+X6hdJqQANEh7vicz_NL50@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1298222322; bh=AmKkeGOHYijCEI9fY7ntE1Xi0uGrf8GZd4MbJ
	o0VZcg=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=D79GbxY+
	nLOAq9hwcBSPSsEiwg3LpgyZAgYl/k3KPx451TtspMsFuhkJug7e+3cHdM08xKm1kCv
	S5R8g7x2wLAaXL9tSwGh/zHnny1O5VZbCrswikA05IQ7V3p/NtxW6fy6vrkr4DJht5D
	UxEHfOI/8ph/+ncn1lucPW/v652LE=
In-Reply-To: <AANLkTimO0tqE4ftCtBLv1n+X6hdJqQANEh7vicz_NL50@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: E2IA <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, 2011-02-20 at 16:10 +0000, E2IA wrote:
> 
> 2011/2/20 Andrew Beverley <andy@andybev.com>:
> > On Sun, 2011-02-20 at 15:13 +0000, E2IA wrote:
> >> Hi all i'd like to know if it is possible to mark packet and accept in
> >> the single iptable rule.
> >
> > There shouldn't be any need to do this.
> >
> >> i've these 2 rules:
> >>
> >> /usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
> >> --l7proto  yahoo  -j MARK --set-mark 74
> >> /usr/local/sbin/iptables  -t mangle  -A FORWARD      -m mark --mark
> >> 74  -j ACCEPT
> >>
> >> but it seam that the second rule is never match.
> >
> > The second rule *should* be matched. What makes you think that it is
> > not? Remember: a packet ACCEPTed in one chain can be DROPed later.
> >
> > It might be worth you posting your complete set of rules.
> >

[ Top posting fixed ]

> Hi here is my complete rule set:
> #!/bin/bash
> #script Shapping marker config
> /usr/local/sbin/iptables  -t mangle -F FORWARD
> /usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
> --l7proto  yahoo  -j MARK --set-mark 74
> /usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  74
> -j  ACCEPT

<snip>

> /usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
> --l7proto  http  -j MARK --set-mark 9
> /usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  9 -j  ACCEPT

<snip>

> /usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
> --l7proto  finger  -j MARK --set-mark 6
> /usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  6 -j  ACCEPT
> /usr/local/sbin/iptables  -t mangle  -A FORWARD  -j  ACCEPT
> # End
> 
> When doing yahoo messenger it is http, skype and finger witch are
> match enven yahoo is the first rule.
> but when  i keep yahoo rule alone yahoo is mach when doing yahoo messenger.
> 

It's been a while since I played with l7-filter, but I suppose it could
be something to do with the way that it is classifying packets (it
sometimes has to see a significant amount of data before it matches some
protocols).

You might want to try the following for your rules instead, but if your
problem is something to do with l7-filter then it may not help:

iptables -t mangle -A FORWARD -m mark --mark 0 \
	-m layer7 --l7proto yahoo -j MARK --set-mark 74
iptables -t mangle -A FORWARD -m mark --mark 0 \
	-m layer7 --l7proto http -j MARK --set-mark 9

This will only match and mark packets if they haven't already been
marked. The disadvantage of this is that all packets will traverse all
rules making it less efficient.

If you still can't get it to work, you should maybe try asking over at
the l7-filter project.

Andy


