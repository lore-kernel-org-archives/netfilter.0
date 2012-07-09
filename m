From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptbles and multiple ipset matces
Date: Mon, 9 Jul 2012 08:41:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1207090839490.21584@blackhole.kfki.hu>
References: <1341809613.5850.13.camel@donetsk.home.lusan.id.au>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1341809613.5850.13.camel@donetsk.home.lusan.id.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikolai Lusan <nikolai@lusan.id.au>
Cc: netfilter@vger.kernel.org

On Mon, 9 Jul 2012, Nikolai Lusan wrote:

> I'm putting together a new firewall, using ipsets to simplify the
> overall rules. I would like to know if I can use multiple sets in a
> single rule. For example would the following be possible:
> 
> ipset create incoming_ports bitmap:port
> ipset add incoming_ports 53
> ipset add incoming_ports 25
> ipset add incoming_ports 80
> ipset add incoming_ports 143
> 
> ipset create local_addresses bitmap:ip
> ipset add local_addresses 192.168.0.1
> ipset add local_addresses 150.250.150.253
> 
> iptables -A -p tcp -m set --set local_addresses src\
> --set incoming_ports dst -j ACCEPT
> 
> Or should I match on one thing first and push the result into a chain to
> match with the second set?

There is no need to break up the rule into chains/rules, multiple matches 
of the same type in one rule is supported.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
