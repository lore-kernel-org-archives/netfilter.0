From: Martin Tomasek <mtd@mk.cvut.cz>
Subject: Re: advanced ip accounting
Date: Fri, 5 Jul 2002 13:46:00 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020705114600.GA4851@mt.mk.cvut.cz>
References: <20020705074508.GB2006@mt.mk.cvut.cz> <02070513000901.14428@Lms>
Reply-To: mtd@mk.cvut.cz
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <02070513000901.14428@Lms>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Jan Humme <jan.humme@xs4all.nl>
Cc: netfilter@lists.samba.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> How about using the "IP accounting" facility of iptables? Try:
>=20
> #iptables -A FORWARD -s 1.2.0.0/16
>=20
> i.e. without the -j option, to create a counter, and use
>=20
> #iptables -L -v
>=20
> to read out the results.

Thanks, but you are writing about something different.

Counters are good, but I must
be able to see for all ips byte counts on any port or protocol, which
is specified _after_ byte counts are recorded. I must store it into
database and select specific port, ip and/or protocol by database query.

So I'm asking about accounting _target_, which will allow me to collect
all the data without sending one packet to userspace immediately after
rule matches (as -j ULOG does). pcap is unusable for me too.

I heard, that something like this exists (or existed ;-), but couldn't
find anything about it.

--=20
Martin Tomasek, mtd@email.cz
BOFH excuse #30:
positron router malfunction

--DocE+STaALJfprDB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9JYb4zWKqGie3rqoRArZaAJ9A2j0T/UbH+1msyDIIhkqXw4AumgCeNGvh
99SAHrvVljWAL0DqvgJOs74=
=qp3s
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--

