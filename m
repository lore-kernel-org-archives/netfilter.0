From: "Nedko Nedev" <nedco@unacs.bg>
Subject: Re: TOS problem
Date: Wed, 5 Mar 2003 22:05:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004001c2e352$9b243520$8268493e@coldunacs>
References: <3e65f3f1.49d8.0@unacs.bg> <Pine.LNX.4.51.0303051453490.24841@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: netfilter@lists.netfilter.org




You are right but strange result i see then i set tos 0x10 for boot
directions
tcpdump i one direction eth1->eth1 show new tos but in eth0->eth1 not :))
and now i'm not absolute sure what
>>tcpdump gets a copy of the packet, then it is mangled

09:55:00.984707 212.5.150.58.27005 > 212.5.134.10.27015: udp 39 [tos 0x10]
09:55:00.993254 212.5.134.10.27015 > 212.5.150.58.27005: udp 176
09:55:01.035795 212.5.150.58.27005 > 212.5.134.10.27015: udp 39 [tos 0x10]
09:55:01.059674 212.5.134.10.27015 > 212.5.150.58.27005: udp 152
09:55:01.068017 212.5.150.58.27005 > 212.5.134.10.27015: udp 38 [tos 0x10]
09:55:01.113957 212.5.150.58.27005 > 212.5.134.10.27015: udp 39 [tos 0x10]
09:55:01.123299 212.5.134.10.27015 > 212.5.150.58.27005: udp 163
09:55:01.152040 212.5.150.58.27005 > 212.5.134.10.27015: udp 39 [tos 0x10]
09:55:01.190807 212.5.134.10.27015 > 212.5.150.58.27005: udp 148
09:55:01.193077 212.5.150.58.27005 > 212.5.134.10.27015: udp 39 [tos 0x10]
09:55:01.234989 212.5.150.58.27005 > 212.5.134.10.27015: udp 39 [tos 0x10]

Regards,
Nedko


----- Original Message -----
From: "Maciej Soltysiak" <solt@dns.toxicfilms.tv>
To: <nedco@unacs.bg>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, March 05, 2003 3:55 PM
Subject: Re: TOS problem


>
>
>
> > on tcpdump get
> > 02:36:44.898854 62.176.107.193 > 62.73.77.8: icmp: echo request
> > 02:36:44.956965 62.73.77.8 > 62.176.107.193: icmp: echo reply [tos 0x10]
> >
> > Am I doing something wrong?
> tcpdump on a different machine, if you're tcpdumping on a the iptables
> machine tcpdump gets a copy of the packet, then it is mangled, so tcpdump
> won't show that.
>
> Regards,
> Maciej
>
>
>


