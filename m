From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: one server, two isp
Date: Tue, 27 Oct 2009 08:02:53 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD509E7@HSSBS.holdstead.local>
References: <92C120E544E143C8AB18261ED93CC963@campus.ua.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <92C120E544E143C8AB18261ED93CC963@campus.ua.es>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-1?Q?=27Alfredo_S=E1nchez=27?= <Alfredo.Sanchez@ua.es>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> # Redirecciono el puerto de las publicas a la privada
> iptables -A PREROUTING -t nat -p tcp -i eth2 --dport
> 3389 -j
> DNAT --to 192.168.0.118:3389
> iptables -A PREROUTING -t nat -p tcp -i eth1 --dport
> 3389 -j
> DNAT --to 192.168.0.118:3389
> #iptables -A PREROUTING -t nat -p tcp --dport 3389 -j
> DNAT --to 192.168.0.118:3389
> #iptables -A PREROUTING -t nat -p tcp --dport 6000 -j
> DNAT --to 192.168.0.118:6666
> 
> When I try to connect from outside to each of my isps, for example ono,
> I
> see packets entering eth2 and then
> going out eth2 immediately without being routed to eth0.
> I see dnat has changed the destination ip so packets go out eth2 having
> the
> source ip from which I'm connecting from (not the ip of the adapter)
> and
> destination ip 192.168.0.118 (the internal server) but through the
> wrong
> interface.
> These packets should have being sent by eth0 and not eth2. If I connect
> to
> the other isp, neo, it's the same but packets going out eth1
>  instead of eth0.
> Any suggestions?


Yes, as per the email of a different subject 7 days ago, assign two IP's to the terminal server, route incoming IP on eth1 to IP 1 and incoming IP on eth2 to IP 2.  This will simplify the SNAT and use the MARK's that you have set.


