From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset macipmap troubles
Date: Thu, 7 Apr 2011 17:47:08 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104071734470.22021@blackhole.kfki.hu>
References: <4D9DD03D.2070801@univ-nantes.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D9DD03D.2070801@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Cc: netfilter@vger.kernel.org

On Thu, 7 Apr 2011, Jean-Philippe Menil wrote:

> i'am in trouble with ipset (6.2) on a 2.6.38.2 kernel.
> I try to add the macipmap set on prerouting mangle chain, and i can't
> understand what i'm doing wrong.
> Basiclly, i'm doing the following:
> 
> $IPTABLES -t mangle -N test_pre
> $IPTABLES -t mangle -A PREROUTING -j test_pre
> $IPSET -N test macipmap --network 192.168.100.0/24
> $IPSET ipset -A test 192.168.100.2,00:24:e8:bb:04:68
> $IPTABLES -t mangle -A test_pre -m set --match-set test src -j MARK --set-mark
> 10
> $IPTABLES -t mangle -A test_pre -m set --match-set test src -j ACCEPT
> $IPTABLES -t mangle -A test_pre -m set --match-set test dst -j MARK --set-mark
> 10
> $IPTABLES -t mangle -A test_pre -m set --match-set test dst -j ACCEPT
> $IPTABLES -t mangle -A test_pre -m set --match-set test src,dst -j MARK
> --set-mark 10
> $IPTABLES -t mangle -A test_pre -m set --match-set test src,dst -j ACCEPT
> $IPTABLES -t mangle -I test_pre -s 192.168.100.2 -m mac --mac-source
> 00:24:E8:BB:04:68 -j LOG --log-prefix "TEST "
> 
> an ipset -L :
> 
> root@test-jp-2:~# ipset -L
> Name: test
> Type: bitmap:ip,mac
> Header: range 192.168.100.0-192.168.100.255
> Size in memory: 4208
> References: 6
> Members:
> 192.168.100.2,00:24:E8:BB:04:68
> 
> root@test-jp-2:~# iptables -t mangle -nvL test_pre
> Chain test_pre (1 references)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 LOG        all  --  *      *       192.168.100.2        0.0.0.0/0
> MAC 00:24:E8:BB:04:68 LOG flags 0 level 4 prefix "TEST "
>     0     0 MARK       all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test src MARK set 0xa
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test src
>     0     0 MARK       all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test dst MARK set 0xa
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test dst
>     0     0 MARK       all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test src,dst MARK set 0xa
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test src,dst
> 
> Next the client do a request (http):
> 
> root@test-jp-2:~# iptables -t mangle -nvL test_pre
> Chain test_pre (1 references)
>  pkts bytes target     prot opt in     out     source
> destination
>   134 71143 LOG        all  --  *      *       192.168.100.2        0.0.0.0/0
> MAC 00:24:E8:BB:04:68 LOG flags 0 level 4 prefix "TEST "
>     0     0 MARK       all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test src MARK set 0xa
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test src
>     0     0 MARK       all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test dst MARK set 0xa
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test dst
>   134 71143 MARK       all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test src,dst MARK set 0xa
>   134 71143 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
> match-set test src,dst
> 
> I expected that only the "-m set --match-set test src" rule will match, but
> obviously, only the rule src,dst match.

The bitmap:ip,mac type requires two direction parameters, therefore all 
references with a single dir parameter are non-matching conditions.

The match with "--match-set test src,dst" contains two dir parameters so 
not ignored. However, due to backward compatibility with earlier ipset 
releases, the actual value of the second dir parameter is ignored, i.e. 
interpreted as "src".

It's admittedly a confusing feature, I'm going to remove it. So in the 
future the matches "--match-set test src,dst" or "--match-set test 
dst,dst" will not match with bitmap:ip,mac type of sets, because the 
second dir parameter will be required to be equal to "src".

Best regards,
Jozsef 
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
