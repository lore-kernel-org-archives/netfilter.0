From: alexb@atix.com.br
Subject: Re: ROUTING thru two LINKs problem
Date: Wed, 12 Mar 2003 09:45:58 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047473158.3e6f2c0689f3c@www.spsul.com.br>
References: <1047426450.3e6e759219a53@www.spsul.com.br> <Pine.LNX.4.53.0303112356010.13050@gypsy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0303112356010.13050@gypsy>
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
To: Steve Mickeler <steve@warning.ca>
Cc: netfilter@lists.netfilter.org

This doesn't work, since I need to route back thru ISP1 the replyed packets=
 from
trafic coming in thru eth0 but destined to a host after the gateway. The ma=
rk is
known only on the gatway (where netfilter is running) and the real destinat=
ion
host doesn't get it.
I tryed eaven TOS that mangels the incoming packet and arives at the destin=
ation
host, but the responses for this packets aren't always replyed with the sam=
e TOS
(for ICMP it seams to work, but for tcp not), so that I couldn't (again)
distinguish this replyed packets from the destination host from established
packets of destination host startet connections.

I realised that I confused some IPs in my original message, so I'm sending =
again
the chema of my links and gateway and a sample trafic problem


    ISP1                           ISP2  =3D 200.ISP.2.18
      |                              |
      |  200.ISP.1.0/24              |  200.ISP.2.16/30
      |                              |
    ------------------------------------
    | eth0    My Gateway          eth1 | =3D 200.ISP.2.17 DefGW=3D200.ISP.2=
.18
    |                                  |
    |                                  |
    |                eth2              |
    ------------------------------------
                      |
                      |
      ---------------------------------
       |        |          |           |
                                       | 200.ISP.1.64/27
                                       |
                               Ex.: 200.ISP.1.65
wher I have:

ip rule from 200.ISP.1.64/27 to table ISP2
iptables -t nat -A POSTROUTING -s 200.ISP.1.64/27 -j SNAT --to 200.ISP.2.17

Lets say somebody at IP 66.1.1.1 trys to ssh my host 200.ISP.1.65. This
generates a packet with somting like:

proto=3Dtcp src=3D66.1.1.1:520 dst=3D200.ISP.1.65:22 SYN ariving on eth0 of=
 my gatmay

this is then routed thru eth2 reaching 200.ISP.1.65

But the ACK is something like:

proto=3Dtcp src=3D200.ISP.1.65:22 dst=3D66.1.1.1:520 ACK ariving on eth2 of=
 my gatway

The gateway use the rule with from=3D200.ISP.1.64/27 and use ISP2 routin ta=
ble,
but since this packet belongs to a previous conection, SNAT doesn't take pl=
ace
and the packet goes out on eth1 unchanged.
IF ISP2 doesn't care of rp_filter this would reach 66.1.1.1 correctly (thru=
 an
other route), but this ACK packed doesn't reach 66.1.1.1 so that I presum t=
hat
ISP2 is dropping packets with src not in the expected range, in this example
200.ISP.2.16/30.

Thanks, for any help


C=F3pia Steve Mickeler <steve@warning.ca>:

>=20
> use iptables to mark the incoming packets and use iproute2 to route
> the
> packets back out based on the mark
>=20
> Somthing like this should work:
>=20
> iptables -t mangle -i eth0 -j MARK --set-mark 11
>=20
> ip rule add fwmark 11 table ISP1
>=20
>=20
> > How can I route back thru ISP1(eth0) ONLY the packets of conections
> that first
> > started over eth0 ?
> >
> > Thanks for any help
> >
> > Alex
> >
>=20

