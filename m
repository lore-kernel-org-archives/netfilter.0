From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: IPSec rules
Date: Wed, 28 Mar 2001 08:57:17 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c0b7a8$259feb00$1001a8c0@s3ac>
References: <NDBBKABJBJCIJNAELLKEMEALIKAA.jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <NDBBKABJBJCIJNAELLKEMEALIKAA.jimm@simutronics.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: jimm@simutronics.com, netfilter@lists.netfilter.org

ce of IPSec traffic. eth1 =3D untrusted side eth0 =3D trusted side
>=20
> INPUT:
> $IPTABLES -A INPUT -i eth1 -p 50 -j ACCEPT
> $IPTABLES -A INPUT -i eth1 -p 51 -j ACCEPT
> $IPTABLES -A INPUT -i eth1 -p UDP --dport 500 -j ACCEPT
>=20
> FORWARD:
> $IPTABLES -A FORWARD -i eth0 -o ipsec+ -j ACCEPT
> $IPTABLES -A FORWARD -i ipsec+ -o eth0 -j ACCEPT


>=20
> OUTPUT:
> $IPTABLES -A OUTPUT -p 50 -j ACCEPT
> $IPTABLES -A OUTPUT -p 51 -j ACCEPT
> $IPTABLES -A INPUT -p udp -m udp --dport 500 -j ACCEPT

Looks good that=92s pretty much what I have. 'cept I actually specify ah
and eps for my protocol. Don=92t forget not to masquarade outgoing
packates through your vpn. Since I have a net to net connection that is
fairly definate I only allow connections from my trusted hosts.


