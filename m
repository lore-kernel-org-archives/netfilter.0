From: "David C. Hart" <DCH@TQMcube.com>
Subject: Re: IP Spoofing
Date: Wed, 05 Nov 2003 15:57:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068065872.1494.40.camel@main.tqmcube.com>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br>
	 <200311051951.hA5Jpdr13332@agate.rockstone.co.uk>
	 <1068062902.1494.25.camel@main.tqmcube.com>
	 <3FA95D0C.5080306@Loudoun-Fairfax.com>
Reply-To: IPTables Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-9PEJ+PBwByWyw1jEVqPw"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FA95D0C.5080306@Loudoun-Fairfax.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: Iptables Mailing List <netfilter@lists.netfilter.org>


--=-9PEJ+PBwByWyw1jEVqPw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-11-05 at 15:26, Jeffrey Laramie wrote:
> >
> In this setup the packets from the LAN have to enter from eth0 as Antony=20
> indicates. Eth1 would have to be the external interface. Keep in mind=20
> that these rules only affect traffic to and from the firewall host=20
> itself. Traffic between the LAN and the internet is handled on the=20
> FORWARD chain.
>=20
I just did a slap-the-head-"duh". We're not configured that way. Our
server, which also runs IPTables is fed from the router as a DMZ. The
clients are connected to the same router, a couple by a hub to the
uplink. Hmm.


--=-9PEJ+PBwByWyw1jEVqPw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/qWRQol4OE0cpGaIRAoxnAJ9nF/WYgXgHX5cLP8TFifJc67IGrACffmZb
TVPK4HCuWzJ8corss6oST8w=
=W8JQ
-----END PGP SIGNATURE-----

--=-9PEJ+PBwByWyw1jEVqPw--


