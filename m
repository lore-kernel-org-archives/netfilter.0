From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Problems with bridge+router setup
Date: Mon, 28 Dec 2015 11:44:31 +0100
Message-ID: <5681128F.5090203@plouf.fr.eu.org>
References: <b012b8f6ef5b98338b2ce4544df60a24@vpn.quintux.com> <20151227142118.27861ea5@playground> <7f5d15a0a7067992b1ae21b149d64266@vpn.quintux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7f5d15a0a7067992b1ae21b149d64266@vpn.quintux.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Misterke a =E9crit :
>=20
> Client B however is a Digital TV box and my triple-play provider=20
> unfortunately requires those to be directly connected to the cable=20
> modem, which will hand them actually a DHCP address in a particular=20
> range and probably do other special stuff.

Does it use VLAN tagging (IEEE 802.1q) or plain ethernet ?

> So, what I would like the RPi2 to do is:
>   - For ethernet frames TO or FROM specific MAC adresses (those of=20
> clients of type B) on its eth1 side, just pass them on from/to eth0
>   - For anything else, behave like a router and have iptables rules=20
> dictate what is allowed and when outputting to the eth0-side do=20
> NAT/masquerading

What about broadcast packets such as ARP requests or DHCP replies sent
by the cable modem ? How do you decide if they should be bridged ?

>       * -A INPUT -p icmp -m icmp --icmp-type source-quench -j ACCEPT

ICMP source quench is deprecated and considered harmful.

> But I also have additional questions:
>    - To act as a router, I need IP addresses at both sides of the=20
> bridge.  At the eth0 side, that should
>      be a DHCP address coming from the cable modem, but at the other =
end=20
> it should be a static address.
>      Now, in the previous simple bridge setup, I already had the brid=
ge=20
> get a DHCP address and I could
>      even add a second static address to br0, but then those addresse=
s=20
> would exist at both ends of the
>      bridge, right?  So, should I then create ebtables/iptables rules=
=20
> somehow to avoid that someone
>      would notice the internal IP address on the internet and vice=20
> versa?
>    - Next to that, when running dnsmasq to hand out DHCP addresses, I=
 of=20
> course don't want it to start
>      offering addresses to the Internet side of the bridge.  So, eith=
er=20
> I somehow need to tell dnsmasq
>      to only work on the LAN side (eth1) or perhaps I would again hav=
e=20
> to somehow limit this with
>      ebtables/iptables.
>=20
> Any advice from anyone on all this?

My advice is to not use br0 but only eth0 and eth1 for IP setup, DHCP,
routing and so on.
