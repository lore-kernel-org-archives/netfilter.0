From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: More neqbie questions
Date: Mon, 2 Aug 2004 19:57:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051224@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Cc: netfilter@lists.netfilter.org

> The "Check the obvious" answer fixed 90% of my problems.  Thanks =
Jason.  :D

Glad to hear it...

> THe last 10% is still the Squid Proxy.  Here's a dump of my current =
rule
> set, as requested by Antony

Thanks--I'm leaving this intact for the sake of the list.

My thought on the squid problem is that you are REDIRECT-ing to port =
8080, yet you have no INPUT rule to allow traffic to that port; like:

	iptables -A INPUT -p tcp --syn -i $INT -s $INTERNAL_NET --dport 8080 -j =
ACCEPT

Now, you *do* have an INPUT rule for 8000--is that something else, or =
was that a typo?

> root@firewall:/etc/iptables# iptables -L -nvx; iptables -L -t nat -nvx
>
> Chain INPUT (policy DROP 102 packets, 19663 bytes)
>
>      pkts      bytes target     prot opt in     out     source
>       destination
>        46     3904 ACCEPT     all  --  *      *       0.0.0.0/0
>     0.0.0.0/0           state RELATED,ESTABLISHED
>
>
>         0        0 ACCEPT     all  --  lo     *       0.0.0.0/0
>     0.0.0.0/0
>         0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:22
>         0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:8000
>         0        0 ACCEPT     udp  --  eth1   *       0.0.0.0/0
>     0.0.0.0/0           udp dpt:53
>         0        0 DROP       udp  --  eth1   *       0.0.0.0/0
>     200.21.1.255        udp dpts:135:139
>       102    19663 LOG        all  --  *      *       0.0.0.0/0
>     0.0.0.0/0           LOG flags 0 level 4
>
>
> Chain FORWARD (policy DROP 7 packets, 392 bytes)
>
>      pkts      bytes target     prot opt in     out     source
>       destination
>       132     9660 ACCEPT     all  --  *      *       0.0.0.0/0
>     0.0.0.0/0           state RELATED,ESTABLISHED
>
>
>         0        0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:80
>         0        0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:22
>         0        0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:21
>         0        0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:25
>         0        0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:110
>         0        0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:143
>         7      392 LOG        all  --  *      *       0.0.0.0/0
>     0.0.0.0/0           LOG flags 0 level 4
>
>
> Chain OUTPUT (policy DROP 0 packets, 0 bytes)
>
>      pkts      bytes target     prot opt in     out     source
>       destination
>        45     3880 ACCEPT     all  --  *      *       0.0.0.0/0
>     0.0.0.0/0           state RELATED,ESTABLISHED
>
>
>         0        0 ACCEPT     all  --  *      lo      0.0.0.0/0
>     0.0.0.0/0
>         0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:80
>         0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:22
>         0        0 ACCEPT     udp  --  *      *       0.0.0.0/0
>     0.0.0.0/0           udp dpt:53
>         0        0 LOG        all  --  *      *       0.0.0.0/0
>     0.0.0.0/0           LOG flags 0 level 4
> Chain PREROUTING (policy ACCEPT 99817 packets, 17098458 bytes)
>
>      pkts      bytes target     prot opt in     out     source
>       destination
>         3      144 REDIRECT   tcp  --  eth1   *       0.0.0.0/0
>     0.0.0.0/0           tcp dpt:80 redir ports 808
> 0
>
>
>
> Chain POSTROUTING (policy ACCEPT 656 packets, 45391 bytes)
>
>      pkts      bytes target     prot opt in     out     source
>       destination
>         0        0 MASQUERADE  tcp  --  *      *       0.0.0.0/0
>      0.0.0.0/0
>
>
> Chain OUTPUT (policy ACCEPT 1459 packets, 105475 bytes)
>
>      pkts      bytes target     prot opt in     out     source
>       destination
>
> I'll be glad when I can move away from windows networks.  I didn't
> realize how much spam was created on ports 135-138 until I started
> trying to parse the syslog.

I'm a big fan of the pkttype match:

  iptables -A INPUT -m pkttype --pkt-type broadcast -j DROP

Keeps me from having to chase down every port that every OS/App is going =
to decide to broadcast on...

-j

