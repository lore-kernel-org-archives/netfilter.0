From: Athan <netfilter@miggy.org>
Subject: Re: DNAT/MASQ Precedence
Date: Fri, 31 Jan 2003 11:19:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030131111949.GV11221@miggy.org>
References: <200301301931.41645.katriel@traum.org.il> <200301310958.38656.katriel@traum.org.il> <20030131101420.GU11221@miggy.org> <200301311314.06777.katriel@traum.org.il>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wc6dtGz1CZgs+5WP"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200301311314.06777.katriel@traum.org.il>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Katriel Traum <katriel@traum.org.il>
Cc: Athan <netfilter@miggy.org>, netfilter@lists.netfilter.org


--wc6dtGz1CZgs+5WP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2003 at 01:14:06PM +0000, Katriel Traum wrote:
> Okay, sounds good, so say I want to save me a 2000 SNAT ports (I don't th=
ink=20
> I'll have 2000 sockets open at the same time)
> here's the ruleset I should use:
>=20
> iptables -A PREROUTING -i $INET_IF -p tcp --dport ! 60000:62000 -j DNAT \
> - --to-destination $DMZ_IP
> iptables -A PREROUTING -i $INET_IF -p udp --dport ! 60000:62000 -j DNAT \
> - --to-destination $DMZ_IP
>=20
> iptables -A POSTROUTING -o $INET_IF -i $LAN_IF -j SNAT --to-source \
>  $INET_IP:60000-62000

   Looks good at first glance here.

> as for ICMP, I didn't quite understand you. can you elaborate?

  For TCP to operate correctly you *NEED* some ICMP working.  ICMP isn't
just for ping!  There are things like network, host and port
unreachable.  There's also things like Path MTU discovery which involves
an ICMP message being sent back if a packet is too big for part of the
route and has the Do not Fragment (DF) flag set.
  Basically not allowing ICMP in a blind fashion is NOT the way to do
things.  You probably just need to make sure you have the proper FORWARD
rules (filter chain, it's the default so no -t) to allow both
ESTABLISHED and RELATED.  You can find these in any mention of SNAT in
docs/howtos.

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--wc6dtGz1CZgs+5WP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj46W9UACgkQzbc+I5XfxKeWZgCeO8gZS61aHvVlUtrhHv6QzEzB
mGIAn1eAOA/cIwK65sA49vz7Xjh207D2
=utMd
-----END PGP SIGNATURE-----

--wc6dtGz1CZgs+5WP--

