From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port-based routing with OpenVPN
Date: Wed, 26 Sep 2007 12:33:56 +0200
Message-ID: <46FA3594.9050306@plouf.fr.eu.org>
References: <20070915231545.224150@gmx.net>	 <46ED0DE4.1040300@plouf.fr.eu.org> <1190758479.13546.8.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1190758479.13546.8.camel@laptop>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Mario H=FClsegge a =E9crit :
>=20
>  i am sorry, i confused the tcpdump output with another test on a nor=
mal
> eth device, this is the capture on tun0:
>=20
> 23:47:54.378123 IP 192.168.0.125.3794 > ha-42.web.de.www: S 471744113=
:471744113(0) win 5840 <mss 1460,sackOK,timestamp 7974928 0,nop,wscale =
3>
[etc.]
> the answer seems to be blocked in some way.. suggestions?

=46irst, can you check on the VPN gateway that the request is received =
and=20
forwarded to the destination server ?

Then, check the return path routing. One step would be to set the=20
default route through the VPN and check that everything works well.

I see that your workstation source address, 192.168.0.125, is the same=20
as in the capture on the ethernet device, and probably different from=20
the tun0 address. This is normal, because the source address selection=20
occurs before the port based routing is taken into account. However if=20
the VPN gateway has no route to your source address, replies cannot com=
e=20
back. You may need to add an iptables SNAT or MASQUERADE rule for=20
packets leaving the tun0 interface. Beware that with older kernels=20
MASQUERADE may not work well with advanced routing.

Also, if the source address is a private address, the VPN gateway must=20
perform SNAT or MASQUERADE on packets forwarded from the VPN to the=20
public network.

=46inally, check that /proc/sys/net/ipv4/conf/tun0/rp_filter =3D 0, els=
e=20
your workstation routing may drop the replies arriving at tun0 (althoug=
h=20
tcpdump would see them).
