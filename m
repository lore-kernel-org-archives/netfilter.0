From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Fairly complex multi-ISP firewall/router problem
Date: Fri, 02 Apr 2004 23:32:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080941528.1655.95.camel@anduril.intranet.cartel-securite.net>
References: <c4kjrg$lqm$1@gatekeeper.tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <c4kjrg$lqm$1@gatekeeper.tmr.com>
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
To: Bill Davidsen <davidsen@tmr.com>
Cc: netfilter@lists.netfilter.org

Le ven 02/04/2004 =E0 22:57, Bill Davidsen a =E9crit :
> I am trying to set up a single Linux router, RH9.0, for a non-profit I=20
> am supporting with some free consulting. They have two ISP lines, each=20
> of which has a three bit CIDR block, and an internal network.
> I want to have an IP for each of the services, mail and http, on each=20
> ISP, so that is DSL is down I can use cable, and vice-versa.

So you have this kind of setup :

	ISP1		ISP2
	 |		 |
	 `----- RH9 -----'
		 |
		 |
		LAN ---- Server

And you DNAT both ISP1 and ISP2 IPs to internal server.

> The problem is that a packet can come from any IP outside, and when the=
=20
> reply packet is sent out, it may go out either NIC. And that's the root=
=20
> of the problem

Yes it is...

> getting the source IP to match the NIC. I've added rules=20
> to the mangle table to MARK the packets, that just doesn't seem to work=
=20
> reliably.

This won't work for a quite simple reason : MARK only works internally,
so you won't get any MARK back with the answer you need to route.
However, you can still use other means, such as the force.

> I want very much to do this without patching the kernel

Fine.

If I were you, I would double address the server within the LAN, one IP
affected to ISP1 DNAT and the other one to ISP2 DNAT. This way :

	iptables -t nat -A PREROUTING -d ISP1_IP -j DNAT --to LAN_IP1
	iptables -t nat -A PREROUTING -d ISP2_IP -j DNAT --to LAN_IP2

So, replies will come to the firewall with LAN_IP1 source if connection
has been initiated from ISP1, and LAN_IP2 for ISP2. And then, you can
use fairly simple source policy routing setting such as described in
LARTC :

	http://lartc.org/howto/lartc.rpdb.html#LARTC.RPDB.SIMPLE

# ip rule add from $LAN_IP1 table isp1
# ip route add default via $ISP1_GW dev $IFACE2ISP1 table isp1
# ip rule add from $LAN_IP2 table isp2
# ip route add default via $IPS2_GW dev $IFACE2ISP2 table isp2
# ip route cache flush

This way, packets should go out through the appropriate interface.
However, it implies some configuration stuff on the server, especially
for Web server on which you may want to set vhosts up to handle stuff
properly.

And finally, if you move your server to DMZ, double address your DMZ
with both ISP adresses ranges.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

