From: "David C. Hart" <DCH@TQMcube.com>
Subject: Re: Kernel, IPTables or Router Anomaly? Maybe me?
Date: Fri, 31 Oct 2003 15:09:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067630965.1432.59.camel@main.tqmcube.com>
References: <1067611776.1427.47.camel@main.tqmcube.com>
	 <20031031191842.GA30613@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-yMqj2cZjLAcKI68O7/yb"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031031191842.GA30613@cannon.eng.us.uu.net>
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


--=-yMqj2cZjLAcKI68O7/yb
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-10-31 at 14:18, Ramin Dousti wrote:
> You have three interfaces on the same 192.168.0.0/24. Why?
>=20
Postfix needs two. While I could create a virtual IP, NIC cards are
cheap enough.

eth0: SMTP Postfix
eth1: HTTP, FTP, etc and Postfix redirects for regex header and body
checks.
eth0:1 A virtual IP used exclusively to direct port scans and other
miscreant traffic to.

--=-yMqj2cZjLAcKI68O7/yb
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/osF1ol4OE0cpGaIRAkcPAJ4htZql49Muok3DU9rGdJlkuaNh8gCfQsKU
AzVFQCyymiv7e4BLYeGHRvo=
=iDrd
-----END PGP SIGNATURE-----

--=-yMqj2cZjLAcKI68O7/yb--


