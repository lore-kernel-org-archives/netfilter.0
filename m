From: =?iso-8859-1?Q?Gunnar_Fr=F6din?= <gunnar68@gunfro.com>
Subject: Re: Port forwarding.
Date: Mon, 28 Jun 2004 14:20:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c45d0a$5529b7b0$6600a8c0@simba>
References: <001301c45cf0$9f7cf710$6600a8c0@simba> <200406281057.52955.Antony@Soft-Solutions.co.uk> <001301c45cf9$51dbfc00$6600a8c0@simba> <200406281134.37964.Antony@Soft-Solutions.co.uk>
Reply-To: =?iso-8859-1?Q?Gunnar_Fr=F6din?= <gunnar68@gunfro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Lets wait with the dns config for a moment ok?

Answer to question 1: YES

Answer to question 2:

Chain FORWARD (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
destination
       6      360 ACCEPT     tcp  --  eth0   eth1    0.0.0.0/0
192.168.0.100      tcp dpt:25 state NEW,RELATED,ESTABLISHED
       0        0 ACCEPT     tcp  --  eth1   eth0    192.168.0.100
0.0.0.0/0          tcp spt:25 state NEW,RELATED,ESTABLISHED


Chain PREROUTING (policy ACCEPT 20 packets, 2796 bytes)
    pkts      bytes target     prot opt in     out     source
destination
       1       60 DNAT       tcp  --  *      *       0.0.0.0/0
10.20.30.40        tcp dpt:25 to:192.168.0.100:25

I tryed to telnet in, witch times-out after 6 attempts






On Monday 28 June 2004 11:18 am, Gunnar Fr=F6din wrote:

> Ok about the splitt DNS, i'm new at this(Linux) but I think I know, but if
> you have the time, some more info would be god, there is a DNS on
> 192.168.0.100

Is that DNS server providing responses to internal clients only, or to
external clients as well (in which case, how have you done the DNAT rules
for
that one!?)

> The real problem is that the port forwarding dose not work at all !!!

What, not even from the outside?   Hm.   The ruleset you posted looked
sensible enough.

Two questions then:

1. Is the public address 217.215.x.x which you are using as the original
destination in your DNAT rule bound to the external interface (eth0) of the
firewall?

2. What do the packet counts for the appropriate rules show from
"iptables -L
FORWARD -nvx; iptables -L PREROUTING -t nat -nvx"?

The packet counts should show us whether packets are:
a) arriving
b) getting DNATted
c) being FORWARDed
d) getting replies

Regards,

Antony.

--
Ramdisk is not an installation procedure.

                                                     Please reply to the
list;
                                                           please don't CC
me.




