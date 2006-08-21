From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Where the de-SNAT actually takes place?
Date: Mon, 21 Aug 2006 16:51:38 +0200
Message-ID: <44E9C87A.8010108@plouf.fr.eu.org>
References: <44E74CA0.9080808@gazeta.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44E74CA0.9080808@gazeta.pl>
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
To: netfilter@lists.netfilter.org

Hello,

longraider a =E9crit :
>=20
> linux-2.6.14.2 with imq patch
> eth0 - iface where two inet connections are attached
> eth1 - server
> eth2 - LAN
> There is SNAT involved on one net connection. The other conn is for
> servers, and there is proxy-arp active (at eth0 and eth1).
>=20
> I type:
> iptables -t nat -A PREROUTING -i eth0 -j LOG
> And after that, dmesg shows something like that:
> 17:08:53 IN=3Deth0 OUT=3D SRC=3Dsome_remote_IP DST=3DIP_of_the_linux_bo=
x
>=20
> Shouldn't be there DST=3D10.0.0.5 for example (ie. de-SNATed)?

This packet probably does not belong to a SNAT-ed or MASQ-ed connection.
Actually, with this rule you won't see the return packets belonging to=20
your SNAT-ed connection. In short, the 'nat' table chains only see the=20
first packet of a "connection", and only if it has the state NEW (not=20
RELATED). All the subsequent valid packets belonging or related to that=20
connection (state NEW, ESTABLISHED, or RELATED) don't go through theses=20
chains. The action taken by these packets is automatically determined by=20
the NAT operation applied to the first packet and the direction of the=20
packet.

For instance, with this rule :
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.2.3.4

The first 'direct' packet of an outgoing connection on eth0 goes through=20
the nat POSTROUTING chains and matches this rule, so the SNAT operation=20
is applied. Instead of going through the POSTROUTING chain, the=20
subsequent direct packets (in the same direction) of the connection will=20
automatically be applied the same SNAT operation. The return packets (in=20
the opposite direction) of the connection will automatically be applied=20
the de-SNAT operation instead of going through the nat PREROUTING chain.=20
By the way, the subsequent packets of the connection don't need to go in=20
or out eth0 (funny, huh ?) to be properly NATed.

> And all that I want to do is ingress queuing using IMQ. I want to fwmar=
k
> packets according to their de-SNATed destination adress (and some other
> things also), and then put them into the IMQ ingress queue.
> I could use the packet matching available in the ingress queue itself
> (by ip tool), but I don't know if the packets that go into IMQ are
> de-SNATed or not.
>=20
> So, where the de-SNAT actually takes place?

De-SNAT takes place in the NF_IP_PRE_ROUTING Netfilter hook at the same=20
place as the nat PREROUTING chain, after the mangle PREROUTING chain and=20
before the input routing decision.

For DNAT which occured in the PREROUTING chain, de-DNAT takes place in=20
the NF_IP_POST_ROUTING Netfilter hook, at the same place as the nat=20
POSTROUTING chain, after the mangle POSTROUTING chain.

For DNAT which occured in the OUTPUT chain, I observed that de-DNAT=20
takes place in the NF_IP_LOCAL_IN Netfilter hook, after the mangle and=20
filter INPUT chains.

> BTW is this diagram correct?
> http://www.docum.org/docum.org/kptd/

I think so, at least for the pure Netfilter part which matches my own=20
diagram http://www.plouf.fr.eu.org/bazar/netfilter/schema_netfilter.txt.=20
I don't know about the IMQ and QoS parts.

> I think not, since traversing the magle PREROUTING can't occur
> simulatenously with de-MASQ.

Incoming packets traverse the mangle PREROUTING chain just before being=20
de-MASQ-ed if needed.

> And is this de-MASQUERADE a de-SNAT also?

Yes. Actually MASQUERADE and SNAT are similar, the only difference being=20
in the choice of the new source address.

De-MASQ and de-SNAT both are destination address rewrite operations, so=20
it is consistent that they take place in the same place as the nat=20
PREROUTING chain which performs DNAT. But keep in mind that they take=20
place *instead* of trversing the nat PREROUTING chain, so you will never=20
see packets being de-MASQ-ed or de-SNAT-ed in any nat chain.

