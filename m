From: John Leach <john@ecsc.co.uk>
Subject: Re: mark connections based a quote
Date: 15 Nov 2002 12:43:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037364188.1417.28.camel@dwight>
References: <NGBBLBOMOLDNJFMPIGKLGEBACFAA.csucsu@dunasor.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-/Ub5Ap6Thd3AGnaQVvu9"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBLBOMOLDNJFMPIGKLGEBACFAA.csucsu@dunasor.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Gabor Csuri <csucsu@dunasor.hu>
Cc: netfilter@lists.netfilter.org


--=-/Ub5Ap6Thd3AGnaQVvu9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Gabor,

This is probably best achieved with some of Linux's advancing routing
and queuing features rather than with Netfilter.

You should be able to setup a simple token bucket queue to allow full
traffic speeds for a burst of 2MB and then lower the rate to whatever
you like.

see the Advanced routing HOWTO at
http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/index.html

specifically the Queuing disciplines section
http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.qdisc.html

It's all rather impressive.

John.

On Thu, 2002-11-14 at 22:01, Gabor Csuri wrote:
> Hi All,
>=20
>  I need to restrict some connections into a bandwidth on my local network=
.
> The long downloads (and uploads) are very bad for our 800k/128k bandwidth=
.
> I thougth I would restrict the long downloads into a lower bandwidth, but=
 I
> don't know how can I mark the long downloads.
> Can I mark the packets which are a part of a long connection maybe like
> this:
> iptables -m cquote --cquote 2000000 -j MARK --set-mark 1
> means it marks packet within a connection which are over 2MB.
>=20
> How can I do this?
>=20
> Thanks in advice, Gabor Csuri.
>=20
>=20
>=20


--=-/Ub5Ap6Thd3AGnaQVvu9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA91Ovbmwa1wibwMEcRArvsAKDfTf95RIpjGBBDoSGCd0QCe/63OwCeIH6P
JxX2b9bpZHThRQsUih27ggE=
=Zri6
-----END PGP SIGNATURE-----

--=-/Ub5Ap6Thd3AGnaQVvu9--


