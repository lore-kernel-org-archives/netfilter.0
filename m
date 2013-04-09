From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Zone based rules
Date: Tue, 9 Apr 2013 20:22:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1304092019580.926@aurora.sdinet.de>
References: <1365521506.25705.28.camel@BEWS005.euractiv.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1365521506.25705.28.camel@BEWS005.euractiv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 9 Apr 2013, Jimmy Thrasibule wrote:

> Each zone is responsible of its incoming and outgoing traffic. However
> this role is played by the same box and if a packet is accepted by a
> zone, it cannot be denied by another zone.
> 
> Let me give you an example:
> 
>  -----------
> | Marketing |---------
>  -----------          | eth0
>                  ----------
>                 | Firewall |
>                  ----------
>  ---------            | eth1
> | Servers |-----------
>  ---------
> 
> Marketing wants to reach a server. However, marketing is very large on
> its outgoing traffic (allows everything) on the server side however we
> would reject any SSH connection coming from marketing.
> 
> Here are the iptables rules I would go for:
> 
>   # Zones creation.
>   -N ZONE_MRKT
>   -N MRKT_OUT
> 
>   -N ZONE_SRV
>   -N SRV_IN
> 
>   # Traffic coming from the zones.
>   -A FORWARD -i eth0 ZONE_MRKT
>   -A FORWARD -i eth1 ZONE_SRV
> 
>   # Traffic to the zones.
>   -A FORWARD -o eth0 ZONE_MRKT
>   -A FORWARD -o eth1 ZONE_SRV
> 
> 
>   # Let's look at marketing.
>   -A ZONE_MKRT -i eth0 -s mar.ket.ing.net/mask -d any/0 -j MRKT_OUT
>   # Marketing allows any outgoing traffic.
>   -A MRKT_OUT -j ACCEPT
> 
>   # Servers
>   -A ZONE_SRV -o eth1 -s any/0 -d ser.ver.s.net/mask -j SRV_IN
>   -A SRV_IN -s mar.ket.ing.net/mask -p tcp --dport 22 -j DROP
> 
> 
> In this example traffic leaving a zone is checked first so any traffic
> from marketing is allowed while the servers zone denies traffic from
> marketing.
> 
> In can change the rules order but this will not solve the problem.
> Another solution would be to mark the packet and then check the mark at
> the end to decide on whether to accept or reject. But how about
> performances on a large set of rules as the firewall will have to go
> through all of them before taking a decision?
> 
> How would you manage such a case?

How about using "-j RETURN" instead of ACCEPT?

In your structure if you RETURN in MRKT_OUT the processing continues 
with the next rule in ZONE_MKT

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
