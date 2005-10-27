From: Oskar Andreasson <oan@frozentux.net>
Subject: Re: question
Date: Thu, 27 Oct 2005 12:04:50 +0200
Message-ID: <1130407490.8832.10.camel@laptop3>
References: <200510270955.20466.marcin.giedz@eulerhermes.pl>
	<200510271039.16458.marcin.giedz@eulerhermes.pl>
	<4360993B.5060500@my-mail.ch>
	<200510271140.34417.marcin.giedz@eulerhermes.pl>
Reply-To: oan@frozentux.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-sKKvN7eSLnxAiWvkDTfG"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510271140.34417.marcin.giedz@eulerhermes.pl>
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


--=-sKKvN7eSLnxAiWvkDTfG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Marcin,=20

iptables and netfilter will not do the job, unless you are willing to
sacrifice stability and security. The problem is that the strings that
netfilter will see are broken down into smaller pieces. So the string
"iptables and netfilter" might actually be transmitted as "iptables and"
and then "netfilter" in a separate packet. On top of this, people might
try to intentionally break your filters by fragmenting the above string
into "i", "p", "t", ... etc packets.=20

The good thing to do in this case, is to wait until the TCP stream has
reached the application layer and has been reassembled properly. Hence,
you will want to either write your own proxy, or to use someone elses
proxy.=20

If you want to use it, I just uploaded a tunnel/proxy program to
http://www.frozentux.net/stunnel.tgz. This is an unfinished program I
started on a couple of years ago. It is written in C. It is horribly
coded and pretty much sucks, but it has no memory leaks and might serve
as a starting point.

Have a nice day;).


On Thu, 2005-10-27 at 11:40 +0200, Marcin Giedz wrote:
> Dnia czwartek, 27 pa=C5=BAdziernika 2005 11:09, Ruprecht Helms napisa=C5=
=82:
> > Marcin Giedz wrote:
> > > I don't get it :(
> > > How with tcpdump as tcpdump is only dump traffic tool - as I know it
> > > can't change anything or I'm wrong?
> >
> > You are right. As I know it only dump.
> > What you need is a hexeditor or you are looking for a tool that do
> > hexediting in the fly.
>=20
> Absolutely!=20
>=20
> >
> > But that is offtopic in this list.
>=20
> But I really don't know where to start? Perhaps some did it earlier.
>=20
> Marcin
>=20
> >
> > Regards,
> > Ruprecht
>=20

--=-sKKvN7eSLnxAiWvkDTfG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBDYKZCGadwPDPpB60RAjHjAJ0aXCiY21jjjVHWq1vO4yb+XtoO8QCfS2uV
o2WlMUNHUl2o7rcaZyhaJ/8=
=wdr7
-----END PGP SIGNATURE-----

--=-sKKvN7eSLnxAiWvkDTfG--

