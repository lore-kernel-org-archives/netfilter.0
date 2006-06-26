From: Alexander Samad <alex@samad.com.au>
Subject: Re: repeated failed logons and ignoring them
Date: Tue, 27 Jun 2006 08:21:08 +1000
Message-ID: <20060626222108.GT6685@hufpuf.lan1.hme1.samad.com.au>
References: <200606261544.09465.tyche@ica.net>
	<002501c69963$2cdd4af0$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/FJxnyttrH06HRq2"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002501c69963$2cdd4af0$0101000a@sterenborg.info>
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
To: netfilter@lists.netfilter.org


--/FJxnyttrH06HRq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2006 at 10:57:45PM +0200, Rob Sterenborg wrote:
> >> What type of logon? SSH, telnet, ...?
> >=20
> > sorry, what comes from typing email when your still asleep.
> > most seem to be hitting my sshd, tho the username/password
> > combo leads me to believe that the person is using a database
> > to try to overload the server.
> >=20
> > killed some pids that where owned by sshd and they kept
> > cropping up faster than i could kill them.
>=20
> You may want to use SSH public/private-key auth, not password auth. It's
> not really hard to implement and you wouldn'd be bothered by
> user/pass-guessing as any attempt to logon that way will just be denied.

Something that was suggested in the mailing list previously

iptables -I INPUT -p tcp --dport 22 -j SSH

iptables -I SSH --protocol tcp --destination-port 22 --match state
--state NEW -m limit --limit 2/hour --limit-burst 3 --jump ACCEPT

iptables -I SSH -j DROP

Then just refine the initial filter in INPUT


Slows them right down!

>=20
>=20
> Gr,
> Rob
>=20
>=20
>=20

--/FJxnyttrH06HRq2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEoF3UkZz88chpJ2MRAtZ/AKCMft6LOqFa/FeJLTyuc3EpaOByawCgkcwQ
qe/NRHwSmHpgNJuKYVevKoA=
=b+oy
-----END PGP SIGNATURE-----

--/FJxnyttrH06HRq2--

