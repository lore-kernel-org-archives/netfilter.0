From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: netfilter forwarding to FTP gateway
Date: Tue, 1 Jun 2004 15:25:23 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E322@alderaan.smgtec.com>
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
To: mclinden@informed.net, netfilter@lists.netfilter.org


Nice description, but one piece of info's required.

If you want transparent control of services, you MUST have control of
all gateways. If 172.16.16.0/22 has anotehr gateway besides the firewall
your talking about, you need to perform the following:

# 172.16.16.0/22 router (GATEWAY2)
ip route add 172.16.11.237/32 via ${GATEWAY1_NET16} dev ${IF_NET16}
iptables -t nat -A PREROUTING -p tcp -s 172.16.0.0/16 --dport 21 -j DNAT
--to 172.16.11.237:2370
iptables -t nat -A POSTROUTING -d 172.16.11.237 -p tcp --dport 2370 -j
SNAT --to ${GATEWAY2_NET16}

# 172.16.8.0/22 router (GATEWAY1)
# Theoretically these rules don't need to exist since hosts on the
subnet should never be required to hit the firewall first.
iptables -t nat -A PREROUTING -p tcp -s 172.16.0.0/16 --dport 21 -j DNAT
--to 172.16.11.237:2370
iptables -t nat -A POSTROUTING -d 172.16.11.237 -p tcp --dport 2370 -j
SNAT --to ${GATEWAY1_NET16}

If you don't have access to GATEWAY2, you're hooped. You need channel
control to get it working.

If there isn't gateway2, then just use the rules from GATEWAY1. The SNAT
rule is just a sanity check to make sure the routes are sane. If there
aren't any other routers in the network, they probably aren't needed.



> I also configure point to point routes to the specific FTP sites using
> 172.16.11.237 as the gateway, which appears to work ok for systems on
> the same subnet (172.16.8.0/22). But Microsoft's desktop OSs do not
> let you specify gateways outside the subnet of the client, therefore,
> clients on the 172.16.16.0/22 subnet cannot use the transparent FTP
> proxy.=20
>=20
> My thought was to put another Linux box with a single interface on the
> 172.16.16 subnet, use it as the gateway to the downstream clients, and
> have it forward all packets for port 21 to the machine on the other
> subnet. But I'm a bit confused on how to do this.
>=20
> Suggestions or references to tutorials/faqs/etc would be appreciated.
>=20
> Thanks in advance
>=20
> Sean McLinden
> Allegheny County Health Department

