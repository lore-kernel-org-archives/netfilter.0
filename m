From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Changing default route causes packet drop
Date: Wed, 07 Jul 2010 16:23:33 +0200
Message-ID: <4C348DE5.9000101@plouf.fr.eu.org>
References: <20100705090326.BF7B134502@john>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100705090326.BF7B134502@john>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Meissen <john@meissen.org>
Cc: netfilter@vger.kernel.org

Hello,

John Meissen a =E9crit :
>=20
> I had a traditional setup with two ethernet interfaces on my Linux bo=
x=20
> (WAN=3Deth0/LAN=3Deth1), and NATing the traffic that was forwarded be=
tween them.
>=20
> I added another interface (eth2), and simply want to change the defau=
lt
> routing to go through it. I'm leaving various services listening on a=
ll
> interfaces.
>=20
> If I change the default route to use eth2, I can route from the inter=
nal
> network to the outside just fine, and I can connect from the internal=
 net
> to services on the system fine. But incoming connections on the origi=
nal
> WAN (eth0) don't complete. They hang at SYN_RECV, as if I had a DROP =
rule.

1) Check that source validation by reverse path is disabled for eth0
(sysctl net.ipv4.conf.{all,eth0}.rp_filter=3D0).

2) If you don't setup some routing policy (such as source address based
routing), packets sent in reply to packets received on eth0 will now be
sent through eth2 by default because of the new default route, but stil=
l
with the source address of eth0. Such traffic may be considered as
spoofing and discarded by the ISP eth2 is connected to.
