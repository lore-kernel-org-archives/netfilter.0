From: "Matthieu Turpault" <mt.netfilter@comelis.fr>
Subject: RE: ip_conntrack module, advanced routing and multiple ISP
Date: Tue, 16 Sep 2003 13:02:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <MGEFIJGLOCLFFKBKAFEPGEDIEHAA.mt.netfilter@comelis.fr>
References: <MGEFIJGLOCLFFKBKAFEPAENBEGAA.mt.netfilter@comelis.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <MGEFIJGLOCLFFKBKAFEPAENBEGAA.mt.netfilter@comelis.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Who can share his opinion on this matter?

Receiving *no answer at all* usually means one of 2 things:
1) extremely ignorant question, not even worth a lousy RTFM reply :-(
2) brilliant question, nobody ever came up with such a marvelous idea :-)

I don't think it's 2), so if the answer is 1), then please enlighten me!

Thanks in advance

M. T.

> -----Message d'origine-----
> De : netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]De la part de Matthieu
> Turpault
> Envoy=E9 : lundi 15 septembre 2003 12:28
> =C0 : netfilter@lists.netfilter.org
> Objet : ip_conntrack module, advanced routing and multiple ISP
>
>
> Hi list,
>
> 	I have a firewall with 4 NIC:
> 		- 3 interfaces connected to the net (eth2, eth3, eth5) by
> 		    3 ISP;
> 		- 1 interface connected to the internal network.
>
> 	eth2 is connected to a router (10.0.1.1) which does masquerading.
>
> 	Outcoming request (from the internal network to the net) are load
> 	 balanced to the 3 ISP (cf my configuration at the end of the mail).
>
> 	All incoming request from the net to internal network by port
> 	 http, pop3, imap, ftp, smtp, https are correctly routed.
>
> 	All outcoming request from the internal network to the net by
> 	 port http, pop3, imap are correctly routed.
>
> 	The problem is that I can't connect from the internal network to
> 	 a ftp server of the net. In fact, I can connect to a ftp server
> 	 of the net but the "ls" command failed the most of the time (1/3).
> 	 I use passive mode.
>
> 	Can you help me please ?
>
> 	Thanks in advance
>
>
>      If I add the route by the command
> 	  ip route add <@ftpServer> via <@GATEWAY_ISP2>
> 	  it is OK
>
> 	Here is my configuration (long but complete... I hope):
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 		Routing table and rules
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> [root@firewall firewall]# ip ru l
> 0:      from all lookup local
> 32763:  from all fwmark        3 lookup 212
> 32764:  from all fwmark        2 lookup 211
> 32765:  from all fwmark        1 lookup 210
> 32766:  from all lookup main
> 32767:  from all lookup 253
>
> --------------------------------------------------------------
> [root@firewall firewall]# ip route list
> <@NETMASK_ISP2>/30 dev eth5  proto kernel  scope link  src <@ISP2>
> 10.0.3.0/30 dev eth5  scope link
> 10.0.1.0/24 dev eth2  scope link
> 10.1.0.0/24 dev eth0  scope link
> <@NETMASK_ISP3>/24 dev eth3  scope link
> 127.0.0.0/8 dev lo  scope link
> default
>         nexthop via 10.0.1.1  dev eth2 weight 1 onlink
>         nexthop via <@GATEWAY_ISP2>  dev eth5 weight 1 onlink
>         nexthop via <@GATEWAY_ISP3>  dev eth3 weight 1 onlink
> --------------------------------------------------------------
> [root@firewall firewall]# ip ro l t 210
> <@NETMASK_ISP2>/30 dev eth5  proto kernel  scope link  src <@ISP2>
> 10.0.3.0/30 dev eth5  scope link
> 10.0.1.0/24 dev eth2  scope link
> 10.1.0.0/24 dev eth0  scope link
> <@NETMASK_ISP3>/24 dev eth3  scope link
> 127.0.0.0/8 dev lo  scope link
> default via 10.0.1.1 dev eth2
> ---------------------------------------------------------------
> [root@firewall firewall]# ip ro l t 211
> <@NETMASK_ISP2>/30 dev eth5  proto kernel  scope link  src <@ISP2>
> 10.0.3.0/30 dev eth5  scope link
> 10.0.1.0/24 dev eth2  scope link
> 10.1.0.0/24 dev eth0  scope link
> <@NETMASK_ISP3>/24 dev eth3  scope link
> 127.0.0.0/8 dev lo  scope link
> default via <@GATEWAY_ISP3> dev eth3
> -----------------------------------------------------------------
> [root@firewall firewall]# ip ro l t 212
> <@NETMASK_ISP2>/30 dev eth5  proto kernel  scope link  src <@ISP2>
> 10.0.3.0/30 dev eth5  scope link
> 10.0.1.0/24 dev eth2  scope link
> 10.1.0.0/24 dev eth0  scope link
> <@NETMASK_ISP3>/24 dev eth3  scope link
> 127.0.0.0/8 dev lo  scope link
> default via <@GATEWAY_ISP2> dev eth5
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	IPTABLES tables
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> [root@firewall firewall]# iptables -L -v -n -t nat
> Chain PREROUTING (policy ACCEPT 531K packets, 34M bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>  4496  293K net_dnat   all  --  eth2   *       0.0.0.0/0
> 0.0.0.0/0
> 39294 1956K net_dnat   all  --  eth3   *       0.0.0.0/0
> 0.0.0.0/0
> 18601 1158K net_dnat   all  --  eth5   *       0.0.0.0/0
> 0.0.0.0/0
>
> Chain POSTROUTING (policy ACCEPT 81932 packets, 4985K bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>  182K 9122K eth3_masq  all  --  *      eth3    0.0.0.0/0
> 0.0.0.0/0
>  166K 8193K eth5_masq  all  --  *      eth5    0.0.0.0/0
> 0.0.0.0/0
>
> Chain OUTPUT (policy ACCEPT 32386 packets, 2508K bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>
> Chain eth3_masq (1 references)
>  pkts bytes target     prot opt in     out     source
> destination
>  159K 7823K MASQUERADE  all  --  *      *       10.1.0.0/24
> 0.0.0.0/0
>
>
> Chain eth5_masq (1 references)
>  pkts bytes target     prot opt in     out     source
> destination
>  159K 7825K MASQUERADE  all  --  *      *       10.1.0.0/24
> 0.0.0.0/0
>
>
> Chain net_dnat (3 references)
> (...)
> ----------------------------------------------------------------
>
> [root@firewall firewall]# iptables -L -v -n -t mangle
> Chain PREROUTING (policy ACCEPT 4008K packets, 1940M bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>  2223  168K MARK       tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp spt:21 MARK set 0x1
>  9364 3221K MARK       tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp spt:20 MARK set 0x1
>     0     0 MARK       udp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          udp spt:21 MARK set 0x1
>     0     0 MARK       udp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          udp spt:20 MARK set 0x1
> 14916 1413K MARK       all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          ctorigdst <@ISP2> MARK set 0x3
> 72454   17M MARK       all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          ctorigdst <@ISP3> MARK set 0x2
> 94175   43M MARK       all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          ctorigdst 10.0.1.10 MARK set 0x1
> 4008K 1940M pretos     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0
>  1282  108K MARK       all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          ctorigsrc <@ISP2> MARK set 0x3
>  1327  112K MARK       all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          ctorigsrc <@ISP3> MARK set 0x2
> 65220   41M MARK       all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          ctorigsrc 10.1.0.10 MARK set 0x1
>
> Chain INPUT (policy ACCEPT 154K packets, 16M bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>
> Chain FORWARD (policy ACCEPT 3828K packets, 1923M bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>
> Chain OUTPUT (policy ACCEPT 86903 packets, 5978K bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>  7587  402K MARK       all  --  *      *       <@ISP2>         0.0.0.0/0
> MARK set 0x3
> 24567 1440K MARK       all  --  *      *       <@ISP3>         0.0.0.0/0
> MARK set 0x2
>  5332  418K MARK       all  --  *      *       10.0.1.10
> 0.0.0.0/0          MARK set 0x1
> 86903 5978K outtos     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0
>
> Chain POSTROUTING (policy ACCEPT 3890K packets, 1927M bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>
> Chain outtos (1 references)
>  pkts bytes target     prot opt in     out     source
> destination
>   712 61690 TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp dpt:22 TOS set 0x10
>  2708  438K TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp spt:22 TOS set 0x10
>     8   320 TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp dpt:21 TOS set 0x10
>     0     0 TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp spt:21 TOS set 0x10
>     0     0 TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp spt:20 TOS set 0x08
>     0     0 TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp dpt:20 TOS set 0x08
>
> Chain pretos (1 references)
>  pkts bytes target     prot opt in     out     source
> destination
> 22272 1209K TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp dpt:22 TOS set 0x10
> 19801 8705K TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp spt:22 TOS set 0x10
>  2140  112K TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp dpt:21 TOS set 0x10
>  2223  168K TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp spt:21 TOS set 0x10
>  9364 3221K TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp spt:20 TOS set 0x08
>  8865 7140K TOS        tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          tcp dpt:20 TOS set 0x08
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 		LOADED MODULES
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> [root@firewall firewall]# lsmod
> Module                  Size  Used by    Not tainted
> nls_iso8859-15          4060   0  (autoclean)
> isofs                  28856   0  (autoclean)
> zlib_inflate           21764   0  (autoclean) [isofs]
> vfat                   12204   0  (autoclean)
> fat                    38072   0  (autoclean) [vfat]
> ide-cd                 33860   0  (autoclean)
> cdrom                  32736   0  (autoclean) [ide-cd]
> ipt_MARK                1336  13  (autoclean)
> ipt_conntrack           1528   6  (autoclean)
> ipt_TOS                 1592  12  (autoclean)
> ipt_MASQUERADE          2200  20  (autoclean)
> ipt_LOG                 4312  11  (autoclean)
> ipt_REJECT              3768   4  (autoclean)
> ipt_state               1048  71  (autoclean)
> iptable_mangle          2712   1  (autoclean)
> ip_nat_irc              3472   0  (unused)
> ip_nat_ftp              4240   0  (unused)
> iptable_nat            21894   3  [ipt_MASQUERADE ip_nat_irc ip_nat_ftp]
> ip_conntrack_irc        4400   1  [ip_nat_irc]
> ip_conntrack_ftp        5424   1  [ip_nat_ftp]
> ip_conntrack           28864   5  [ipt_conntrack ipt_MASQUERADE ipt_state
> ip_nat_irc ip_nat_ftp iptable_nat ip_conntrack_irc ip_conntrack_ftp]
> iptable_filter          2348   1  (autoclean)
> ip_tables              15424  12  [ipt_MARK ipt_conntrack ipt_TOS
> ipt_MASQUERADE ipt_LOG ipt_REJECT ipt_state iptable_mangle iptable_nat
> iptable_filter]
> af_packet              16328   1  (autoclean)
> sundance               16224   3  (autoclean)
> eepro100               22228   2  (autoclean)
> mii                     3980   0  (autoclean) [sundance eepro100]
> usb-uhci               26128   0  (unused)
> usbcore                77324   1  [usb-uhci]
> rtc                     8776   0  (autoclean)
> reiserfs              183540   5
>
>
>
>


