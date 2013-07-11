From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Clarification on the use of the statistic module
Date: Fri, 12 Jul 2013 01:15:56 +0200
Message-ID: <51DF3CAC.7070507@plouf.fr.eu.org>
References: <51DD79C7.3080707@tiendalinux.com> <51DE7697.3020204@plouf.fr.eu.org> <51DEFE24.8030601@tiendalinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51DEFE24.8030601@tiendalinux.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Nestor A. Diaz a =E9crit :
> Hi, thanks for your answer, as i understand the statistic module use =
a
> static counter that change everytime the packet traverse the chains, =
i
> though the counter got altered just one time while the packet travers=
e
> the chains.

Each occurence of the statistic match has its own individual counter.

> According to your suggestion if i remove the line with the "-j ACCEPT=
"
> then the statistic log as I want and in fact it does.
>=20
> However if i jump to a 'DNAT' directly, the problem persist as (50/25=
)
> it doesn't work as i have read from some websites

Of course. Like ACCEPT, DNAT is also a terminal target.

> As solution if I want to jump to DNAT directly then i have to decreas=
e
> the 'every' option as follows which do what i want:
>=20
> # This works:
> /sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --ev=
ery
> 2 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 =
-j
> DNAT --to-destination 192.168.2.20:7101
> /sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --ev=
ery
> 1 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 =
-j
> DNAT --to-destination 192.168.2.20:7102

You realize that "--every 1" does not make any sense and it is much
simpler to just remove the statistic match in that rule, don't you ?

> I am experimenting with the behavior and if I jump to custom chain wh=
ich
> performs other operations like 'log' statistics keep working as
> expected. (50/50) however if i put a 'DNAT' rule things become (50/25=
),
> it seems DNAT affects the behavior but i don't know why,  Any
> explanation for this will be appreciated.

Jumping to a user-defined chain is a good idea if multiple actions are
associated to the same statistic match (e.g. LOG and DNAT). However it
won't change the fact that terminal targets such as ACCEPT, DROP,
REJECT, DNAT... prevent further rules to see the packet, thus change th=
e
actual ratio of further statistic matches.

If the first statistic match takes 1 over N packets, then the next
statistic match will see only the remaining packets, i.e. N-1 over N,
not N. So if you want it to also take 1 over N of all packets, it means
1 over N-1 of the remaining packets. And so on. This is why you had to
decrease the 'every' option. The last rule will take all the remaining
packets without the need for a statistic match
