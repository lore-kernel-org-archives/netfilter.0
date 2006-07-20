From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FORWARD packet problem
Date: Thu, 20 Jul 2006 17:46:38 +0200
Message-ID: <44BFA55E.504@plouf.fr.eu.org>
References: <44BE4BCE.8060509@darkstar.nom.za>	<44BE8385.4080509@plouf.fr.eu.org>
	<44BF8A13.2010205@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44BF8A13.2010205@darkstar.nom.za>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Paulo Andre a =E9crit :
>>
>>> I have a multiple isp fw
>>> eth0 =3D int
>>> eth1 =3D default isp
>>> eth2 =3D sec isp
>>>
>>> when I try and make a connection to and internal server via the eth2=20
>>> , the packet appears on the PREROUTING table, and then not on FORWARD=
=20
>>> , anyone have any ideas?

[disable rp_filter on the interface]

> Thanks Pascal, that fixed it.

Be aware that now eth2 is not protected against IP spoofing by the input=20
routing any more. So you must use iptables rules to drop incoming=20
packets with an "impossible" IP source address on this interface, i.e.=20
an address belonging to another interface (lo, eth0, eth1) subnet.

> Would I have to use CONNMARK and MARK to get connections leaving the=20
> correct interface?

I'm not sure I understand your question correctly. Do you mean routing=20
reply packets belonging to connections coming from the secondary ISP=20
back through the same interface ?

If so, you have to use CONNMARK+MARK+advanced routing only when there is=20
no other way to identify packets which must be sent via the non-default=20
interface. If they have distinctive characteristics other than the=20
source or destination IP addresses (for example the source or=20
destination port), you don't need CONNMARK and can use only=20
MARK+advanced routing. If they have distinctive source IP addresses, you=20
can use only advanced routing. And of course, if they have distinctive=20
destination IP addresses, you only need standard routing.

But routing the packets through the correct interface won't allow you to=20
re-enable rp_filter, at least when MARK is in use, because the rp_filter=20
validation does not take iptables rules into account. I'm not sure about=20
using only advanced routing though (does rp_filter validation use the=20
packet destination address ?).

