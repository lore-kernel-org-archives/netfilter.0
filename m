From: Harald Welte <laforge@netfilter.org>
Subject: Re: hashlimit
Date: Wed, 3 Nov 2004 15:26:04 +0100
Message-ID: <20041103142604.GR1950@sunbeam.de.gnumonks.org>
References: <OF37D8E04E.19320E82-ONC1256F41.004D3DD1-C1256F41.004DB276@linvision.intern>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f6M9UaX53EEZorp0"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OF37D8E04E.19320E82-ONC1256F41.004D3DD1-C1256F41.004DB276@linvision.intern>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Gerben Roest <g.roest@linvision.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--f6M9UaX53EEZorp0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 03, 2004 at 03:08:39PM +0100, Gerben Roest wrote:
> Dear Harald,
>=20
> thanks for your work on the hashlimit match for iptables. Can you tell me=
=20
> if there will be a "srclimit"-type parameter for hashlimit?
> I want to be able to limit the amount of new connections per time-frame,=
=20
> per source host (which i don't have to name explicitly). Will that be=20
> possible in the future?

hashlimit already has support for this (mode srcip). This is what makes the
difference between the old 'dstlimit' and the new 'hashlimit' match.

To quote from the help message:

hashlimit v1.3.0 options:
--hashlimit <avg>               max average match rate
                                [Packets per second unless followed by=20
                                /sec /minute /hour /day postfixes]
--hashlimit-mode <mode>         mode is a comma-separated list of
                                        dstip,srcip,dstport,srcport
--hashlimit-name <name>         name for /proc/net/ipt_hashlimit/
[--hashlimit-burst <num>]       number to match in a burst, default 5
[--hashlimit-htable-size <num>] number of hashtable buckets
[--hashlimit-htable-max <num>]  number of hashtable entries
[--hashlimit-htable-gcinterval] interval between garbage collection runs
[--hashlimit-htable-expire]     after which time are idle entries expired?


> thanks,
> best regards,
> Gerben Roest.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--f6M9UaX53EEZorp0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBiOp8XaXGVTD0i/8RAjQXAJ4jc0JhpFAtLME4Bi8hseznujSM0gCfVII3
bumTtljCMct7UVoa9O0GdLc=
=RXjO
-----END PGP SIGNATURE-----

--f6M9UaX53EEZorp0--

