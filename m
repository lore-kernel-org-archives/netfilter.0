From: "David C. Hart" <dch@TQMcube.com>
Subject: Re: ICMP Rule Problem
Date: Mon, 02 Feb 2004 12:16:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075742174.3721.28.camel@dchws.TQMcube.com>
References: <1075741362.3714.25.camel@dchws.TQMcube.com>
	 <200402021211.06028.Alistair Tonner <>>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-xj0TRTZjukeNwUR5dIe0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402021211.06028.Alistair Tonner <>>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Iptables Mailing List <netfilter@lists.netfilter.org>


--=-xj0TRTZjukeNwUR5dIe0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-02-02 at 12:11, an unknown sender wrote:
> On February 2, 2004 12:02 pm, David C. Hart wrote:
> > -A INPUT -p icmp -m icmp --icmp-type 0 -j REJECT --reject-with
> > icmp-net-prohibited
> >
> > It doesn't seem to work.
> 	Please see Maicej's reply to a similar thread ...=20
> 	you need kernel > 2.4.21 and iptables > 1.2.8
> =09
Kernel =3D 2.4.24 IPTables =3D 1.2.9
                               ---------
            Quality Management - A Commitment to Excellence

--=-xj0TRTZjukeNwUR5dIe0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAHoXdol4OE0cpGaIRAoIUAKCnK/gcrwmlU4bfw/og+umHn4LA0wCfRB0g
tpwQeZ9wGLYAFiqjQFphB4M=
=FvyX
-----END PGP SIGNATURE-----

--=-xj0TRTZjukeNwUR5dIe0--


