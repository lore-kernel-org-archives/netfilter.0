From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Masqureading issues... packets go over wrong link
Date: Fri, 13 Aug 2004 11:06:13 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E352@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter mailing list <netfilter@lists.netfilter.org>

Antony Stone wrote:
> On Friday 13 August 2004 5:42 pm, dravya wrote:
>=20
>> Hello all,
>>=20
>> I have a system setup with two phones/interfaces (ppp0 and ppp1). I
>> access the internet via these two interfaces only.
>>=20
>> I have the following rules in my iptables:
>>=20
>> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>> iptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE
>>=20
>> and yet when a machine on my network uses my machine as the gateway
>> to ping outside, packets travel on the wrong link causing change of
>> ip address of the phones. I have tested this using ethereal and it
>> clearly shows a ppp0 packet (src add of ppp0) outgoing on ppp1, as I
>> was capturing on ppp1. Also, iptables is masquerading as it shows
>> the number of packets it masqueraded.
>=20
> I agree with you that the above rules ought to ensure that packets
> going out of each interface have the appropriate source address.
>=20
> What does your routing table look like (presumably you are using
> iproute2 to balance traffic, or route based on source etc, to share
> the two links)?=20


I've run into this in the past. The reason that netfilter doesn't
conntrack back to the same interface is because Netfilter doesn't
regularly do routing (interface isn't kept in the conntrack table). I've
fixed this problem myself by policy routing all traffic, then binding
them to return to the same interface.

This is done be utilizing the MARK and CONNMARK extensions.

So, an example in your case would be:

	MY_POLICY_ETH0=3D1
	MY_POLICY_ETH1=3D2
	MY_POLICY_DEFAULT=3D2
=09
	iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
	iptables -t mangle -A PREROUTING -i ${INET1} -m mark ! --mark 0
-j ACCEPT
	iptables -t mangle -A PREROUTING -i ${INET1} -m mark --mark 0 -j
MARK ${MY_POLICY_ETH0}
	iptables -t mangle -A PREROUTING -i ${INET2} -m mark --mark 0 -j
MARK ${MY_POLICY_ETH1}
	iptables -t mangle -A PREROUTING -i ${INET3} -m mark --mark 0 -j
MARK ${MY_POLICY_DEFAULT}
	iptables -t mangle -A PREROUTING -j CONNMARK --save-mark
=09
	iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

Make sure to do the same for the OUTPUT chain if you have the same issue
with locally sourced data. iproute2 would have two routing tables
exactly like the main table except that the default route points to
favor the interface you'd like to output traffic too.

	# ip route list table 1
	..
	default via <ext_gw_eth0> dev eth0  src <ext_ip_eth0>
	# ip route list table 2
	..
	default via <ext_gw_eth1> dev eth1  src <ext_ip_eth1>

I'm assuming you have a working knowledge of iproute2. Please follow up
if you need more help.

