From: Oskar Andreasson <oan@frozentux.net>
Subject: Re: question
Date: Thu, 27 Oct 2005 12:37:39 +0200
Message-ID: <1130409459.8832.15.camel@laptop3>
References: <200510270955.20466.marcin.giedz@eulerhermes.pl>
	<200510271140.34417.marcin.giedz@eulerhermes.pl>
	<1130407490.8832.10.camel@laptop3>
	<200510271225.50084.marcin.giedz@eulerhermes.pl>
Reply-To: oan@frozentux.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-PYIb63wQYb++o214s/hL"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510271225.50084.marcin.giedz@eulerhermes.pl>
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
To: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Cc: netfilter@lists.netfilter.org


--=-PYIb63wQYb++o214s/hL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2005-10-27 at 12:25 +0200, Marcin Giedz wrote:
> Dnia czwartek, 27 pa=C5=BAdziernika 2005 12:04, Oskar Andreasson napisa=
=C5=82:
> > Hi Marcin,
> >
> > iptables and netfilter will not do the job, unless you are willing to
> > sacrifice stability and security. The problem is that the strings that
> > netfilter will see are broken down into smaller pieces. So the string
> > "iptables and netfilter" might actually be transmitted as "iptables and=
"
> > and then "netfilter" in a separate packet. On top of this, people might
> > try to intentionally break your filters by fragmenting the above string
> > into "i", "p", "t", ... etc packets.
> >
> > The good thing to do in this case, is to wait until the TCP stream has
> > reached the application layer and has been reassembled properly. Hence,
> > you will want to either write your own proxy, or to use someone elses
> > proxy.
> >
> > If you want to use it, I just uploaded a tunnel/proxy program to
> > http://www.frozentux.net/stunnel.tgz. This is an unfinished program I
> > started on a couple of years ago. It is written in C. It is horribly
> > coded and pretty much sucks, but it has no memory leaks and might serve
> > as a starting point.
>=20
> Great!!! Really thanks but I just can't reach your program - above addres=
s=20
> doesn't work :( Could you please do something or send the program on my=20
> private mail.
>=20

Sorry about that, I got an urgent task on my desk and forgot to upload
the file:). It's uploaded now. Do note that this is just a very ugly
framework really, you need to do all the parsing etc on your own, and I
have a bad habit of not commenting work in progress projects... =3D)

> Thanks once again,
> Marcin
>=20
> >
> > Have a nice day;).
> >
> > On Thu, 2005-10-27 at 11:40 +0200, Marcin Giedz wrote:
> > > Dnia czwartek, 27 pa=C5=BAdziernika 2005 11:09, Ruprecht Helms napisa=
=C5=82:
> > > > Marcin Giedz wrote:
> > > > > I don't get it :(
> > > > > How with tcpdump as tcpdump is only dump traffic tool - as I know=
 it
> > > > > can't change anything or I'm wrong?
> > > >
> > > > You are right. As I know it only dump.
> > > > What you need is a hexeditor or you are looking for a tool that do
> > > > hexediting in the fly.
> > >
> > > Absolutely!
> > >
> > > > But that is offtopic in this list.
> > >
> > > But I really don't know where to start? Perhaps some did it earlier.
> > >
> > > Marcin
> > >
> > > > Regards,
> > > > Ruprecht

--=-PYIb63wQYb++o214s/hL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBDYK3yGadwPDPpB60RAphjAJ4h6jlvDyXm2Xv9wcA/Msx7o+fPVQCgqnAL
9+jiLdWRtuElhLSAyOn+YSY=
=cp+0
-----END PGP SIGNATURE-----

--=-PYIb63wQYb++o214s/hL--

