From: Athan <netfilter@miggy.org>
Subject: Re: Masquerade and NAT
Date: Thu, 13 Mar 2003 21:49:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030313214936.GB19656@miggy.org>
References: <ABEKJILKOKKGGDJKHKDFEEDGCAAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <ABEKJILKOKKGGDJKHKDFEEDGCAAA.patrick@vikus.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Patrick Ahler <patrick@vikus.com>
Cc: netfilter EMAIL <netfilter@lists.netfilter.org>


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2003 at 04:20:47PM -0500, Patrick Ahler wrote:
> Hi,
> I am hoping to be able to run IP Masquerade and NAT on the same
> firewall/router. ie 192.168.1.1-61 use NAT to translate their internal IP=
's
> to external IP's (a.b.c.1-61), and have a variety of internal hosts on the
> same subnet(as the other machines using NAT) using IP masquerading to pass
> through the firewall.. ie 192.168.1.62-140 use IPMASQUERADE to translate
> their internal ip's to a.b.c.62
>=20
> Is this possible? If so how? I've found that in order to use IP MASQUERADE
> you have to specify a subnet of internal ip's that will use IP MASQUERADE,
> but what if I only want to select specific internal ip's that will use it?
> Help? Thanks!

   Um, why do MASQ at all ?  It's only really of use when your external
IP is dynamic.  If you've a static IP to use for the purpose just use
SNAT.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj5w/PAACgkQzbc+I5XfxKfm3wCfctkYAHWcdidLQ2YSowTUtbZr
lC8AoIxvg7+3H6TUa07Q0KCONumXUfWr
=hMc4
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--

