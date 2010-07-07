From: "John Meissen" <john@meissen.org>
Subject: Re: Changing default route causes packet drop
Date: Wed, 07 Jul 2010 09:35:48 -0700
Message-ID: <20100707163548.E8F1C34502@john>
References: <4C348DE5.9000101@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: (Your message of Wed, 07 Jul 2010 16:23:33 +0200.)
             <4C348DE5.9000101@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> Hello,
>=20
> John Meissen a =E9crit :
> >=20
> > I had a traditional setup with two ethernet interfaces on my Linux =
box=20
> > (WAN=3Deth0/LAN=3Deth1), and NATing the traffic that was forwarded =
between them.
> >=20
> > I added another interface (eth2), and simply want to change the def=
ault
> > routing to go through it. I'm leaving various services listening on=
 all
> > interfaces.
> >=20
> > If I change the default route to use eth2, I can route from the int=
ernal
> > network to the outside just fine, and I can connect from the intern=
al net
> > to services on the system fine. But incoming connections on the ori=
ginal
> > WAN (eth0) don't complete. They hang at SYN_RECV, as if I had a DRO=
P rule.
>=20
> 1) Check that source validation by reverse path is disabled for eth0
> (sysctl net.ipv4.conf.{all,eth0}.rp_filter=3D0).
>=20
> 2) If you don't setup some routing policy (such as source address bas=
ed
> routing), packets sent in reply to packets received on eth0 will now =
be
> sent through eth2 by default because of the new default route, but st=
ill
> with the source address of eth0. Such traffic may be considered as
> spoofing and discarded by the ISP eth2 is connected to.

Yes, I should learn to not post to mailing lists at 3AM, that a good ni=
ght's
sleep is generally better for solving problems. :-P

I realized I was thinking of the problem in terms of interfaces, not ro=
uting.
Once I slept on it I realized the problem was 2), and that I couldn't r=
eally
do what I was proposing. Relocating the new connection and making a min=
or
change to the DHCP server to specify the new default route for the rest=
 of
the network solved the problem.

Thanks.

john-


