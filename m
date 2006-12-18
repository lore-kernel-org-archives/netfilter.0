From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: ipsec on 2.6.16+ question
Date: Mon, 18 Dec 2006 01:39:22 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024EEE8@pxtbenexd01.pxt.primeexalia.com>
References: <BAY103-DAV2730F1927552670E0B615B2C90@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <BAY103-DAV2730F1927552670E0B615B2C90@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"
To: Marco Berizzi <pupilla@hotmail.com>
Cc: netfilter@lists.netfilter.org


Marco,

What you have included below makes sense.  I will take a look at getting
1.3.5 in place.  Not sure how long that will take me though.  The work
around in place is working for me (but I have some 30 entries in there
-- wide wan net of IPSEC firewalls).

I did read someone about using the policy modules BUT I couldn't find
any reference to what version it was in.  Now I know :)

Thanks,=20

Gary Wayne Smith

> >Current working:
> >-A POSTROUTING -s 10.0.16.0/255.255.248.0 -d 10.0.32.0/255.255.255.0
-o
> >eth1 -j ACCEPT
> >-A POSTROUTING -o eth1 -j MASQUERADE
>=20
> I havent't understood your message.
> Since 2.6.16 outgoing ipsec packets are seeing twice:
> clear & encrypted on the outgoing interface (which if
> I correctly understand is eth1 for you).
> You must upgrade to iptables >=3D1.3.5 and take a look
> for the new 'policy' match.
> Something like this should do the trick (linux will
> not snat packets which will be sent through the (any)
> ipsec tunnel(s)):
>=20
> $IPTABLES -t nat -I POSTROUTING -m policy --dir out --pol ipsec -j
> ACCEPT
>=20
>=20


