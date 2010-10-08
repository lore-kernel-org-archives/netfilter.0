From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: empty filter on FORWARD chain with rp_filter means safe right?
Date: Fri, 08 Oct 2010 16:16:48 +0200
Message-ID: <4CAF27D0.1070206@plouf.fr.eu.org>
References: <20101008043129.GA2017@omnius.omnisys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20101008043129.GA2017@omnius.omnisys.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Scott Mcdermott a =E9crit :
>=20
> I encountered a system today with two attached
> networks, one public and the other RFC1918.  The box
> had ip_foward=3D1, FORWARD chain empty, policy ACCEPT.
> rp_filter was set on both the interfaces.
>=20
> Now if I were somewhere off the public interface, but
> many hops away, there is no possible way to get packets
> to the RFC1918 side of the box is there?  Because I
> have no way to actually route the packets to the
> gateway with destination addresses on the far side.  So
> actually this box is safe from malicious activity, even
> though there is an ACCEPT policy on FORWARD and it's
> set with routing enabled.  Is this correct?

No, it is wrong.
If all the routers on the path are compromised or misconfigured, they
could forward such packets to the box.
Unlikely ? Yes. Impossible ? No.

Not to mention any IP-IP encapsulation tunnel that would allow the
transport of a private packet over the public internet.

Do not have your security rely on someone else.
