From: Athan <netfilter@miggy.org>
Subject: Re: Rule matchup in iptables
Date: Thu, 6 Mar 2003 13:34:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030306133433.GE1025@miggy.org>
References: <20030306124758.GB23703@talika.eii.us.es>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030306124758.GB23703@talika.eii.us.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Javier Miguel =?unknown-8bit?Q?Rodr=EDguez?= <javier@talika.eii.us.es>
Cc: netfilter@lists.netfilter.org


--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2003 at 01:47:58PM +0100, Javier Miguel Rodr?guez wrote:
> VoIP) , so this is my question: Is there any way to know when a packet ma=
tches a rule?=20
> -j LOG is not feasible (thousands of packets per second). I want somethin=
g like this:=20
>=20
> Last two hours:
>=20
> Rule 1: 15000 hits, 150 megabytes
> Rule 2: 3500 hits, 34 megabytes
> Rule 3: 9675 hits, 2 megabytes
> ad infinitum...

   iptables -nvL

The -v is the important bit here, you get 'packets' and 'bytes' counters
per rule then.  Adding -x will give exact byte numbers, rather than
summarising to K/M/G as the number grows.
  You can use -Z on a table to zero the counters when needed.

> 	Other question? How can I test iptables rules? In ipchains I
> could try them, but with iptables do I have to generate fake traffic?

  The only mention I can find of such in the man page is:

BUGS
       Check is not implemented (yet).

So I guess not.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj5nTmkACgkQzbc+I5XfxKf6HgCcCavHFxThZEkYITHIDYCHwC2O
GWsAnjxBIdgG7ycbHmbQn9NoQCR8gKre
=69/y
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--

