From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DHCP issue - iptables rules not hit when using ebtables - MAC
 based   firewall bypass
Date: Sat, 27 Jun 2009 11:36:52 +0200
Message-ID: <4A45E834.5080604@plouf.fr.eu.org>
References: <4A45D0EE.50400@telenet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A45D0EE.50400@telenet.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

fvancrae@telenet.be a =E9crit :
>=20
> I am using ebtables on my firewall to have one consumer device (clien=
t)=20
> bypass the firewall entirely and act as if it is directly connected t=
o=20
> the internet.
>=20
> For this I create a bridge (non transparant) and specify a MAC based=20
> rule in the BROUTING chain
> -s MAC -i eth1 -j ACCEPT
> -d MAC -i eth0 -j ACCEPT
> BROUTING POLICY DROP

This seems incomplete to me. How do you deal with broadcast frames=20
received on eth0 such as ARP requests for your device IP address ?

> eth0 is my routers WLAN interface
> eth1 is my routers LAN interface
>=20
> Then I wanted to block the DHCP request for that MAC on my firewall (=
who=20
> is DHCPD)
> but it seems that no iptable or ebtable rule can be used to block thi=
s=20
> packet (or even an outgoing packet of my DHCPD)
>=20
> My client always gets an IP inside my LAN.

Does the DHCP server listen on eth0 or the bridge interface ? Some DHCP=
=20
softwares (either client or server side) are bound directly to the=20
network interface and thus bypass iptables and ebtables. So I guess you=
=20
might either blacklist the device MAC address in the DHCP server=20
configuration if possible, or have it listening on the bridge interface=
=20
(and add ebtables rules to avoid DHCP traffic from leaking through eth0=
).
