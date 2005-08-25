From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: ipsec nat and iptables
Date: Thu, 25 Aug 2005 08:45:26 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829074E6@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Guillermo Calvo <guillermocalvo@datacenter1.com>, netfilter@lists.netfilter.org

Guillermo,=20

There are a few things that need to be done when IPSEC in order to
traverse the tunnel.  First and foremost you need to NOT masquerade the
IPSEC packets.  Here's how what is accomplished.

Change:
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
To
iptables -t nat -A POSTROUTING -p ! esp -o eth1 -j MASQUERADE

IPSEC will go through iptables twice.  First for the IPSEC encoded
packets and finally the decoded packets.  You don't want to run the
decoded packets through the POSTROUTING NAT a second time.  So "-p !
esp" becomes your friend here.

Second, you now have private traffic coming in your firewall on the
external interface (because of this second parsing of the packets).  So
you need your rules to reflect that.  You might want to log everything
before you drop to see what might be getting caught that shouldn't be.

Also, you will need to turn on IP forwarding on the firewall (Which
might also be your problem).


Gary=20


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Guillermo Calvo
> Sent: Thursday, August 25, 2005 8:31 AM
> To: netfilter@lists.netfilter.org
> Subject: ipsec nat and iptables
>=20
>=20
> Hello
>=20
> I'm trying to setup a network to network vpn using native ipsec
support
> on Centos 4.1
>=20
>=20
> Network A
> eth0=3D  conected to internet
> eth1=3D conected to private lan 192.168.1.1
>=20
> Network B
> eth0 conected to Internet
> eth1=3D conected to private lan 192.168.2.1
>=20
> >From server A I'm able to ping 192.168.2.1 and viceversa but
computers
> in the private lan can't see the other side
>=20
> I'm using pre-shared keys also I set nat_transversal in racoon
>=20
> Also I set my servers like iptables router
> iptables -A INPUT -m state --state INVALID -j DROP
> iptables -A FORWARD -m state --state INVALID -j DROP
> iptables -A OUTPUT -m state --state INVALID -j DROP
>=20
> iptables -A FORWARD -i eth1 -o eth0
> iptables -A FORWARD -i eth0 -o eth1
>=20
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
>=20
> iptables -A INPUT -i eth0 -j ACCEPT
> iptables -A INPUT -i ethY -m state --state ESTABLISHED,RELATED -j
ACCEPT
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
>=20
>=20
> Thanks in advance
>=20
> Guillermo Calvo
>=20


