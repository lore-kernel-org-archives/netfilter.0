From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: Counter Strike FOWARDING?
Date: Sat, 8 Mar 2003 23:31:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030308223139.GA9646@ynfonatic.de>
References: <20030308203434.17890.qmail@web40209.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030308203434.17890.qmail@web40209.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 08, 2003 at 12:34:34PM -0800, SBlaze wrote:
> iptables -t nat -A PREROUTING -p TCP --dport 27015 -j DNAT --to-destinati=
on
> 192.168.1.25:27015

That rule is ok, but you should include a rule in the FORWARD chain which
actually allows the rule. Portforwarding is ok, as long as you don't forbid=
 it
later:

iptables -A FORWARD -p tcp --dport 27015 -d 192.168.1.25 -j ACCEPT

Don't know if the Counterstrike-port is correct though... But i guess you k=
now
what you're doing.

Alex.



--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj5qb0oACgkQEMMZKORQoYIn5QCdGoTiCwD4uLoZge137q6Gqt6M
B/IAn312xzdYM7CACRZAZhvyHmvJwCEZ
=AJS8
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

