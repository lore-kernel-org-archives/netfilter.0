From: "Ferry van Steen" <ferry.van.steen@InfoPart.nl>
Subject: RE: Forwarding intranet ip's
Date: Mon, 21 Oct 2002 12:08:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D502122A1694B04EAE0F53D53CC2F764017581@exch2k-01.infopart.nl>
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
To: Gary Hodder <vk2kcf@miacomputers.com>
Cc: netfilter@lists.netfilter.org

> Hi Ferry,
>=20
> Trying to route clients 192.168.150 net to the router box on=20
> 192.168.151 net. The forward chain has iptables -t filter -A=20
> FORWARD -s 192.168.150.0/255.255.255.0 -j ACCEPT Tried=20
> iptables -t filter -A FORWARD -i eth0 -s=20
> 192.168.150.0/255.255.255.0 -o eth1 -j ACCEPT A client=20
> machine on 192.168.150 net can ping the 192.168.151.3=20
> interface but go no further. 150 net go through a 10/100 nway=20
> switch. 151 net goes through a dechub 900 with 900dm hub modules.

Oh I forgot. I only see one line....
-t filter is default btw so I'll omit

iptables -A FORWARD -s 192.168.150.0/255.255.255.0 -i eth0 -d
192.168.151.0/255.255.255.0 -o eth1 -j ACCEPT
iptables -A FORWARD -s 192.168.151.0/255.255.255.0 -i eth1 -d
192.168.150.0/255.255.255.0 -o eth0 -j ACCEPT

Remember that traffic is always two ways. For traffic to exist not only
should 150.x be allowed to send to 151.x, 151.x should also know how to
and be allowed to send to 150.x

In short

The 192.168.150.x network should have routes to the 192.168.151.x
network and have firewall access
The 192.168.151.x network should have routes to the 192.168.150.x
network and have firewall access
The linux server should have both routes (it has by default since it has
network cards/interfaces in those segments) and have ip_forwarding
enabled (you did this) and shouldn't block the traffic by any means
(iptables comes to mind as does rp_filter, but rp_filter should be safe
in this case)

Regards

