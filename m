From: "Alexander W. Janssen" <alexander.janssen@gmx.de>
Subject: Re: iptables UDP problem
Date: Sun, 2 Feb 2003 16:57:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030202165755.C1937@ynfonatic.de>
References: <20030202001150.26421.qmail@web41303.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030202001150.26421.qmail@web41303.mail.yahoo.com>
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


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 01, 2003 at 04:11:50PM -0800, k n wrote:
> Hi,
>=20
> I'm using iptables on RedHat 8 with the rules listed
> below. When scanned from outside the TCP port appear
> as filtered; however, the UDP port is still open.
>=20
> $ip0  is my external IP address.
>=20
> Am I doing something wrong?

that the TCP-port shows up as filtered is normal since you just DROP the
SYN-packets. If you wouldn't have a firewall and there would not be daemon
running the machine would send a tcp-reset packet and send it back to nmap.
This is interpreted as "connection refused", meaning that there is not a
server running on the tcp-port.

That UDP stuff surprises me a bit; if you send a packet to a UDP port and no
server is running the machine would generate an ICMP port-unreachable messa=
ge
which should have been interpreted by nmap. But since you drop all packets =
to
53/udp a ICMP-message was never generated and nmap couldn't have received o=
ne.

I just tested on my machine (locally with loopback and nmap 2.54BETA22):

Nonfiltered udp-ports show up as "closed"
DROPed udp-ports show up as "open"

Maybe nmap interprets it like that "as long as i don't get any errors i thr=
eat
it like it would be open." And this sort of correct as well, since you don't
have a "real connection" like in TCP - the application has to do everything=
 on
it's own. So that UDP-stuff doesn't surprise me anymore ;-)

Don't DROP. Send real tcp-resets for unwanted TCP-connections and send real
ICMP port-unreachable messages for unwanted UDP-connections and everything
else. Just my 2c.

HTH, Alex.

--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj49QAEACgkQEMMZKORQoYL+LwCeIiH8+Ct7NL/R0BOSZGHkI5gg
HuIAn1xRDO8Yb4/+b9oVWeioccRBM0t9
=Z93X
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--

