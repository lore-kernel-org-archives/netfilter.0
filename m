From: Joshua N Pritikin <jpritikin@pobox.com>
Subject: Re: FAQ 3.13, but on the same box
Date: Tue, 20 Jul 2004 19:12:19 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040720134219.GK676@always.joy.eth.net>
References: <20040718173200.GC718@always.joy.eth.net> <200407190951.37947.Antony@Soft-Solutions.co.uk> <20040719094454.GB1735@always.joy.eth.net> <200407191056.54823.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4wkndigzIeYF6Hbg"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407191056.54823.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--4wkndigzIeYF6Hbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2004 at 10:56:54AM +0100, Antony Stone wrote:
> On Monday 19 July 2004 10:44 am, Joshua N Pritikin wrote:
> > I am trying to do Squid + Netfilter + BROWSER on the same machine.
>=20
> Oh, right - I hadn't appreciated that part before.   I thought you just m=
eant=20
> transparent proxying to a proxy on the gateway instead of to a proxy=20
> somewhere else.
>=20
> In that case you either need to DNAT your OUTPUT packets, as per your pre=
vious=20
> posting,

This solution seems to work (below).  I wonder if this should be added
to the various FAQs?  ;-)

#!/bin/sh

iptables -t nat -F  # clear table

# normal transparent proxy
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j REDIRECT --to-po=
rt 8080

# handle connections on the same box (192.168.0.2 is a loopback instance)
gid=3D`id -g proxy`
iptables -t nat -A OUTPUT -p tcp --dport 80 -m owner --gid-owner $gid -j AC=
CEPT
iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT --to-destination 192.16=
8.0.2:8080

--=20
A new cognitive theory of emotion, http://openheartlogic.org

--4wkndigzIeYF6Hbg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA/SE7qcqnlKSmC70RAo5nAJ4koMVAdWYsta28pnkf2UW1CGgGwgCg2FS+
GXkUKqDcmYOhU9elChBGM5U=
=z8R2
-----END PGP SIGNATURE-----

--4wkndigzIeYF6Hbg--

