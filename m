From: Ian Laurie <iml@zip.com.au>
Subject: philosophical question regarding NAT
Date: Tue, 10 May 2005 11:13:04 +0000
Message-ID: <1115723584l.29661l.0l@server.moose.blogdns.org>
Reply-To: iml@zip.com.au
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="Flowed"
To: netfilter@lists.netfilter.org

I've got a philosophical question regarding NAT as follows.

Imagine the following unrealistic gateway firewall:

## eth0 =3D WAN, eth1 =3D LAN
*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A POSTROUTING -o eth0 -j MASQUERADE
COMMIT

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
COMMIT

Although NAT is enabled and LAN side systems will be NATed to the=20
gateway's WAN side IP address, WAN side systems can still access=20
systems on the inside of the firewall if they know what the LAN=20
side addresses are (and have a route to the gateway somehow).

In other words, even though NAT is active the bridging function=20
provided by ip_forward is still happening as well.

It seems you can disable the bridging function with the following=20
PREROUTING rule:

-A PREROUTING -i eth0 -d <private_lan_block> -j DROP

which enforces NAT, ie, only NATed things can get through.  While=20
you can achieve the same thing by setting policy of FORWARD to DROP=20
and allowing only RELATED and ESTABLISHED stuff through (which I do)
I am surprised I have not seen this PREROUTING rule used more=20
often as a safety measure.

It doesn't seem to break anything, does anyone know why this=20
technique isn't seen more often?

Ian





