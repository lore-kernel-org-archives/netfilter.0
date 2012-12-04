From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Deleting set/SET rules by exact match fails
Date: Tue, 4 Dec 2012 15:25:47 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1211291330490.23615@blackhole.kfki.hu>
References: <50B7477E.8050603@airpost.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50B7477E.8050603@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Born Without <blackhole@airpost.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 29 Nov 2012, Born Without wrote:

> the problem I ran into is, that I'm unable to delete any iptables rule, which
> uses either the set match or the SET target, by the exact matching rule
> options. Deleting by rule number works though.
> See below output.
> 
> System is Debian squeeze with debian kernel 2.6.32.
> I downloaded the debian kernel source package.
> Applied the netlink.patch and compiled/run it successfully.
> Installed latest ipset successfully:
> 
> # ipset version
> ipset v6.16.1, protocol version: 6
> 
> I tried to apt-src iptables and compile that, but made no difference.
> 
> # iptables -V
> iptables v1.4.8

It's an iptables issue - please upgrade/install newer iptables version.

Best regards,
Jozsef 

> -----------------------------------------------------------------
> iptables -vnL FOO
> Chain FOO (1 references)
>  pkts bytes target     prot opt in     out     source destination
> 
> # iptables -A FOO -s 192.168.13.0/24 -p icmp -j SET --add-set foo src
> # iptables -A FOO -m set --match-set foo src -j ACCEPT
> 
> - generate some traffic...
> 
> iptables -vnL FOO
> Chain FOO (1 references)
>  pkts bytes target     prot opt in     out     source destination
>     4   240 SET        icmp --  *      *       192.168.13.0/24 0.0.0.0/0
> add-set foo src
>    18  1148 ACCEPT     all  --  *      *       0.0.0.0/0 0.0.0.0/0
> match-set foo src
> 
> iptables -D FOO -s 192.168.13.0/24 -p icmp -j SET --add-set foo src
> iptables: No chain/target/match by that name.
> 
> # iptables -D FOO -m set --match-set foo src -j ACCEPT
> iptables: Bad rule (does a matching rule exist in that chain?).
> 
> # ipset list foo
> Name: foo
> Type: hash:ip
> Revision: 0
> Header: family inet hashsize 1024 maxelem 65536
> Size in memory: 8288
> References: 2
> Members:
> 192.168.13.254
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
