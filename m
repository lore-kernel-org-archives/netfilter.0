From: Harald Welte <laforge@netfilter.org>
Subject: Re: PPTP - more connections from a  NATed LAN to LAN behind PPTP Linux box doesn't work
Date: Tue, 27 Jan 2004 02:54:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040127015414.GQ19250@sunbeam.de.gnumonks.org>
References: <0807917940AEF54F9A0C3096A0ED03AB40EDD0@gatc-ex1.gatc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kJZGYML2m3vFaueA"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <0807917940AEF54F9A0C3096A0ED03AB40EDD0@gatc-ex1.gatc.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Unzeitig Lumir <lumir.unzeitig@gatc.com>
Cc: netfilter@lists.netfilter.org


--kJZGYML2m3vFaueA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2004 at 03:47:25PM +0100, Unzeitig Lumir wrote:
> Hi,
> I applied the PPTP patch and it solved what I needed. (=3Dmore connections
> from NATed LAN behind Linux box to a PPTP server) - it's OK.
> But oposit direction (=3Dmore connections from NATed LAN behind a PPTP
> server to theLAN which is behind PPTP Linux box) works only for 1 PPTP
> client. It stays in verification process and ends by error.

Sorry, I have no idea what you are talking about.  Please describe more
detailed what exactly you want to do.  Please try to use more precise
terms (no idea what 'theLAN' and your 'pptp linux box' should mean).

> Thanks
> Lumir Unzeitig

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--kJZGYML2m3vFaueA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAFcTGXaXGVTD0i/8RAuGnAKCCKOcERAXymM44oCfaIp6IkrW1/wCgnRr9
RDCNDCV8D/Atzzp4TaESBWM=
=uy2q
-----END PGP SIGNATURE-----

--kJZGYML2m3vFaueA--

