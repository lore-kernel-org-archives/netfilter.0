From: Athan <netfilter@miggy.org>
Subject: Re: UDP and ICMP traceroute
Date: Thu, 13 Mar 2003 00:16:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030313001636.GN1025@miggy.org>
References: <3E6FB954.8080708@qwest.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mejza3ZMMA5Za1mX"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E6FB954.8080708@qwest.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sapient2003 <sapient@qwest.net>
Cc: netfilter@lists.netfilter.org


--mejza3ZMMA5Za1mX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2003 at 05:48:52PM -0500, Sapient2003 wrote:
> I am trying to have iptables pick out traceroute packets. Windows uses=20
> ICMP for it's traceroute, so I use this:
>=20
> iptables -t filter -A INPUT -p icmp -s 0/0 -d 10.0.0.1 --icmp-type=20
> time-exceeded -j QUEUE
>=20
> Linux, however, uses both ICMP and UDP... How can I tell iptables to=20
> look for UDP traceroute packets?

  You can't, without hacking the traceroute client to only use a very
specific range of ports.  We did this at one place I used to work when
we had a non-stateful firewall.

  I guess the other possibility is to hack the traceroute client to put
an actual, unique (enough), payload in the outgoing UDP packet, and then
have an ipt kernel module looking for that.

  If you must tie down outgoing UDP such that you can't just use the
statefulness of iptables/netfilter then I'd suggest trying to find a
linux traceroute that does things the same way as the Windows one.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--mejza3ZMMA5Za1mX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj5vzeQACgkQzbc+I5XfxKcfdACeIBVz5udFmRvoLpN/1N/DkVpR
EFQAn30KBbr79p2ot2n+ibAijZldv2Dv
=YNrF
-----END PGP SIGNATURE-----

--mejza3ZMMA5Za1mX--

