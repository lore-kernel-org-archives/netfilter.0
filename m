From: Henry Ritzlmayr <h.ritzlmayr@gmx.at>
Subject: Re: Redirecting incoming traffic to 127.0.0.1
Date: 21 Mar 2003 18:05:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048266341.1492.153.camel@localhost.localdomain>
References: <1048257065.1493.137.camel@localhost.localdomain>
	 <200303211651.16884.mike@spidernet.co.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303211651.16884.mike@spidernet.co.ro>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Negrea Mihai <mike@spidernet.co.ro>, Netfilter Mailing List <netfilter@lists.netfilter.org>

I am not sure if I understood your approach - but I tried it and it
doesn=B4t do the trick.=20
What I need is whenever a packet arrives on an external interface it
should be redirected to 127.0.0.1 (localhost). This is needed because a
service is listening only on localhost (not ment to be used on the
network).=20

Henry

Am Fre, 2003-03-21 um 15.51 schrieb Negrea Mihai:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Maybe the packets reach your service listening on the localhost but they =

> cannot get to the client because it has the source 127.0.0.1
>=20
> Try SNAT-ing those packets:
> iptables -t nat -A POSTROUTING -p tcp -s 127.0.0.1 -j SNAT --to 172.16.17=
2.12
>=20
> hope I understood the problem
>=20
> All the best,
>=20
> - --=20
> Negrea Mihai
> http://www.negrea.net
>=20
> On Friday 21 March 2003 16:31, Henry Ritzlmayr wrote:
> > I have a service running on a box wich is only able to bind to 127.0.0.1
> > (hardcoded and I can=B4t get the source to change it). Since I want to =
use
> > it from any other box the only way to solve that I think is to nat
> > incoming packets to 127.0.0.1.
> >
> > IPTABLES -t nat -A PREROUTING -p tcp -d 172.16.172.12 -j DNAT
> > --to-destination 127.0.0.1
> >
> > and many others wich I tried don=B4t work.
> >
> > If I understood REDIRECT correctly it only changes to the local IP where
> > the packet came in (in my situation 172.16.172.12) wich also not solves
> > the problem.
> >
> > any ideas?
> >
> > Henry
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.0.7 (GNU/Linux)
>=20
> iD8DBQE+eybk8hhhNOp8KlQRAiRpAJ9h3NJ7OLgMhBnPG+ToZ9dAweXAOwCg3R/4
> WtZ8kbHYrihBupFC91nPUeg=3D
> =3DPFnF
> -----END PGP SIGNATURE-----
>=20


