From: Harald Welte <laforge@netfilter.org>
Subject: Re: about the iptables tutorial and the state of documentation
Date: Tue, 15 Jul 2003 18:09:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715160906.GO7198@naboo>
References: <87znjjp8u2.fsf@tapsellferrier.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FxlYARId5dseejUu"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <87znjjp8u2.fsf@tapsellferrier.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Nic <nferrier@tapsellferrier.co.uk>
Cc: djTremors@newjackswing.dyndns.org, netfilter@lists.netfilter.org


--FxlYARId5dseejUu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 13, 2003 at 01:29:57AM +0100, Nic wrote:
> After much searching around for info about the state of netfilter I
> found your reference to the tutorial.
>=20
> Thanks for mailing that to the list, without it I would never have
> found out exactly what the situation is.
>=20
> This is due to the awful state of the netfilter documentation. The
> kernel documentation says that netfilter modules are no longer
> included (it certainly doesn't seem possible to turn them on with
> menuconfig) but the current netfilter documentation makes no mention
> of that at all.

? Where did you read that the netfilter modules are no longer included?

What kernel version are you referring to?
Please include your .config in the next posting, so we can analyze where
your problem is.  It is most likely a usage problem.

And, in general, I don't think that the netfilter/iptables
[user] documentation is in an awful state.  The developer documentation
is out of date, however

> Nic Ferrier
> http://www.tapsellferrier.co.uk

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--FxlYARId5dseejUu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/FCchXaXGVTD0i/8RAiSoAJ9+p83SdA7N2WdF1fW/YA6+giWIJgCfXpAa
1eriPPmKyqquQ0nz4yL7D7o=
=XWlD
-----END PGP SIGNATURE-----

--FxlYARId5dseejUu--

