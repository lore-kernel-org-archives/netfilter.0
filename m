From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Port forwarding.
Date: Mon, 28 Jun 2004 11:34:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406281134.37964.Antony@Soft-Solutions.co.uk>
References: <001301c45cf0$9f7cf710$6600a8c0@simba> <200406281057.52955.Antony@Soft-Solutions.co.uk> <001301c45cf9$51dbfc00$6600a8c0@simba>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c45cf9$51dbfc00$6600a8c0@simba>
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

On Monday 28 June 2004 11:18 am, Gunnar Fr=F6din wrote:

> Ok about the splitt DNS, i'm new at this(Linux) but I think I know, but=
 if
> you have the time, some more info would be god, there is a DNS on
> 192.168.0.100

Is that DNS server providing responses to internal clients only, or to=20
external clients as well (in which case, how have you done the DNAT rules=
 for=20
that one!?)

> The real problem is that the port forwarding dose not work at all !!!

What, not even from the outside?   Hm.   The ruleset you posted looked=20
sensible enough.

Two questions then:

1. Is the public address 217.215.x.x which you are using as the original=20
destination in your DNAT rule bound to the external interface (eth0) of t=
he=20
firewall?

2. What do the packet counts for the appropriate rules show from "iptable=
s -L=20
FORWARD -nvx; iptables -L PREROUTING -t nat -nvx"?

The packet counts should show us whether packets are:
a) arriving
b) getting DNATted
c) being FORWARDed
d) getting replies

Regards,

Antony.

--=20
Ramdisk is not an installation procedure.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


