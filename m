From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Problems with bridge+router setup
Date: Mon, 28 Dec 2015 19:46:55 +0100
Message-ID: <5681839F.4080801@plouf.fr.eu.org>
References: <b012b8f6ef5b98338b2ce4544df60a24@vpn.quintux.com> <20151227142118.27861ea5@playground> <7f5d15a0a7067992b1ae21b149d64266@vpn.quintux.com> <5681128F.5090203@plouf.fr.eu.org> <e6259eb987cf9fb4d54fdf3b44ecac86@vpn.quintux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e6259eb987cf9fb4d54fdf3b44ecac86@vpn.quintux.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Misterke a =E9crit :
>=20
> On 2015-12-28 11:44, Pascal Hambourg wrote:
>> Does it use VLAN tagging (IEEE 802.1q) or plain ethernet ?
>=20
> I don't think I can use VLAN tagging.

I am not saying to use VLAN tagging. I am asking whether the
communication between the cable modem and the TV box over the LAN uses
VLAN tagging, because I have seen it with a triple-play provider, and i=
n
that case it is easy to identify which packets must be bridged : those
with a VLAN tag.

>> What about broadcast packets such as ARP requests or DHCP replies se=
nt
>> by the cable modem ? How do you decide if they should be bridged ?
>=20
> Good question. This is the sort of stuff I'm struggling with and basi=
cally
> looking for people that can indicate how to sort this out. Would pass=
ing
> all ARP requests and broadcast frames be dangerous from a security
> point-of-view?

It depends what your security requirements are. Beyond security, it
could disrupt normal operations of the hosts on the network.

> Could I have an ebtables rule that would only let DHCP
> replies for the client B MAC-addresses pass?

We can see in your kernel log that DHCP replies have the broadcast MAC
and IP destination addresses, so it requires to look into the DHCP
payload, not only the MAC/IP/UDP headers. I do not see how to do this
with ebtables. It may be done with iptables and the u32 match through
the bridge-nf feature.

> What would happen if I don't
> allow other broadcast packets and/or ARP frames to be bridged?

It depends on the the type of traffic used by communications between th=
e
cable modem and the TV box.

>> My advice is to not use br0 but only eth0 and eth1 for IP setup,=20
>> DHCP, routing and so on.
>=20
> But then how to combine this with the need to bridge stuff for client=
 B?

By carefully identifying which packets must be bridged.

> Can I have eth0 and eth1 part of a bridge but still each having their=
=20
> own IP address?

Yes, ebtables' broute table allows it. When DROP is applied to a packet
in the broute table, it does not appear to be related with the bridge t=
o
iptables and the IP layer.

=46or example, I have used it on a box which acts as an IP router for I=
Pv4
traffic and as an ethernet bridge for IPv6 traffic. Each ethernet
interface has an IPv4 address, and the bridge interface has an IPv6 add=
ress.

But in your specific situation, you may need to use br0 as the logical
interface facing the cable modem, and only force routing of packets
received by the interface eth1 not sent by the TV box. So br0 would hav=
e
the internal LAN IP address, eth1 the external LAN IP address and DHCP
server, and eth0 no IP address.

One caveat about DHCP software (client and server) : they usually attac=
h
directly to the interface and by-pass filtering rules. So you may need
to set up the DHCP server to ignore requests from the TV box.

> I guess that would then mean making the address part of br0
> manual instead of dhcp, for eth1 making it static and for eth0 making=
 it
> dhcp.  But then what interface would be used in the different chains =
for
> ebtables/iptables?  Ex. if a packet comes into eth1 but doesn't have =
an
> IP address in the range of the IP address assigned to eth1, will it t=
hen
> be considered being for br0?  Or will everything still be considered =
to
> be for br0 even if the target IP address is that of eth1?

It depends whether DROP or ACCEPT is applied to the packet by ebtables
in the broute table.
