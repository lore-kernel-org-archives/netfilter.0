From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: Re: RELATED ICMP packets of type 3
Date: Fri, 11 Feb 2005 18:44:16 +0300
Message-ID: <200502111844.16095.e-boogie@yandex.ru>
References: <200502111757.16352.e-boogie@yandex.ru>
	<1108135654.5565.62.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1108135654.5565.62.camel@anduril.intranet.cartel-securite.net>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Friday 11 February 2005 18:27, Cedric Blancher wrote:
> Le vendredi 11 f=E9vrier 2005 =E0 17:57 +0300, Mikhail Zotov a =E9crit :
> > As far as I understand, it is safe to ACCEPT incoming
> > packets of this sort.
>=20
> As far as they're RELATED, you can assume theses packets to be
> legitimate ones. So, yes it is safe to accept them. It is also necessary
> to accept them if you want your IP stack to detect errors and be
> functionnal. As an example, if you drop Fragmentation Needed packets
> (type 3, code 4), you'll break PMTU Discovery...
>=20
> > Is it safe to allow _outgoing_ packets of this kind?
>=20
> For the same reason, yes, and for the sake of the Internet, do it.

Thanks a lot for your comprehensive answer!
Thus, do I understand it correctly that I should and can safely=20
accept _all_ RELATED ICMP messages, both incoming and outgoing?

> I'm personnaly sick of theses dummy firewalls/admin who can't get ICMP
> filtered correctly and break things, so you have to find workarounds all
> the time.

I get your point.  Unfortunately, I have failed to find a clear explanation
of proper dealing with ICMP packets.  This mailing list was my last hope. :=
=2D)

Regards,
Mikhail

