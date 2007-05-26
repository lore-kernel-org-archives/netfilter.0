From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT rule requires extra firewall pinhole
Date: Sat, 26 May 2007 16:52:31 +0200
Message-ID: <465849AF.7080207@plouf.fr.eu.org>
References: <200705251717.27252.jweber@amsuper.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200705251717.27252.jweber@amsuper.com>
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

Jeff Weber a =E9crit :
> I've setup DNAT on gateway such that external clients connecting to TCP=
 port=20
> $SCADA_PORT on the gateway are actually connected to the node $MCB_IP o=
n a=20
> private network.  Here's my rule:
>=20
>  $IPTABLES -t nat -A PREROUTING -p tcp -d $DAS_SCADA_IP --dport $SCADA_=
PORT \
>         -i $DAS_SCADA_IF -j DNAT --to $MCB_IP:$SCADA_PORT
>=20
> I've added a firewall rule to block external requests to forward throug=
h the=20
> gateway:
>=20
> $IPTABLES -A FORWARD -p tcp -i $DAS_SCADA_IF --syn -j DROP
>=20
> The trouble is, I just found out that the above firewall rule is not=20
> compatible with my DNAT rule.

Indeed. The TCP SYN packet arrives on $DAS_SCADA_IF, so it matches the ru=
le.

> That is, DNAT rewrites the destination IP [as=20
> it should] to the $MCB_IP, then forwards the packet, which then encount=
ers=20
> the new firewall rule, and is dropped.

Actually DNAT only rewrites the destination and does nothing more. It is=20
the routing decision which forwards the packet.

> So I preceeded the above firewall rule with another rule:
> $IPTABLES -A FORWARD -p tcp -i $DAS_SCADA_IF -s $SCADANET -d $MCB_IP \
>     --dport $SCADA_PORT -j ACCEPT
>=20
> which enables the DNAT to work again.  However, a side effect is that n=
ow=20
> external nodes on $SCADANET can forward port=3D$SCADA_PORT to IP=3D$MCB=
_IP=20
> directly through the firewall.

Yes, this is a known side effect. Like you I used to worry about it but=20
not any more now, considering that accesses via either the internal and=20
external addresses have exactly the same effects. Besides, one has to=20
know about the internal address in order to use it, so why hide it ?

> Granted this is a small pinhole, but I'd like=20
> to plug it if possible.  I would think that it should be possible to pr=
event=20
> all external nodes from forwarding through the firewall, and to prevent=
=20
> external hosts from directly "seeing" an internal node on the private n=
et.

I can think of the following options :

- Drop packets which match "-d $MCB_IP" in the mangle/PREROUTING chain.=20
The mangle table is not the preffered way for filtering (you cannot use=20
REJECT there) but it works. Do not use the nat table for filtering.

- MARK packets which match "-p tcp -d $DAS_SCADA_IP --dport $SCADA_PORT"=20
in the mangle/PREROUTING, then DNAT the marked packet in the=20
nat/PREROUTING chain and ACCEPT them in the filter/FORWARD table before=20
the DROP rule. Or MARK the packets which do not match, don't DNAT them=20
and DROP/REJECT them.

- In the filter/FORWARD chain, ACCEPT only packets matching
"-m conntrack --ctstate DNAT --ctorigdst $DAS_SCADA_IP", that is with=20
the external original destination address.

