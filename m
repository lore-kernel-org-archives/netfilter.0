From: "David C. Hart" <DCH@TQMcube.com>
Subject: Re: Kernel, IPTables or Router Anomaly? Maybe me?
Date: Fri, 31 Oct 2003 16:03:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067634225.1432.15.camel@main.tqmcube.com>
References: <1067611776.1427.47.camel@main.tqmcube.com>
	 <20031031191842.GA30613@cannon.eng.us.uu.net>
	 <1067630965.1432.59.camel@main.tqmcube.com>
	 <20031031204949.GB30613@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-w1vNBu+UgOPPU0qKcjSK"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031031204949.GB30613@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: iptables mailing list <netfilter@lists.netfilter.org>


--=-w1vNBu+UgOPPU0qKcjSK
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-10-31 at 15:49, Ramin Dousti wrote:
> OK, first of all don't use ifconfig and the family. Use iproute2.
> By doing:
>=20
> ip addr add 192.168.0.31/24 dev eth0
> ip addr add 192.168.0.5/24 dev eth0
> ip addr add 192.168.0.32/24 dev eth1
>=20
Interesting. Thanks. Meanwhile, I had to shut IPTables down. Something
was causing a problem with the Redhat list server (hormel) and only
hormel.

Somehow - despite no mangle rules - packets from this server were being
rejected - not seen as targeting port 25. As soon as I killed IPTables,
the problem went away. I have more reading to do. A LOT more reading to
do.

For now, we have non-forwarded traffic rejected at the router and I'm
using SNMPDTRAPD to log what's going on.

--=-w1vNBu+UgOPPU0qKcjSK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/os4wol4OE0cpGaIRArOmAKCHlB+9pd+ZZD21aKBqPgs9p4HbFwCcDmfH
NZpJJI7lPklrH2IrMqldZgs=
=IOdf
-----END PGP SIGNATURE-----

--=-w1vNBu+UgOPPU0qKcjSK--


