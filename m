From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: iptables compile trouble
Date: 05 Jun 2002 21:26:20 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023305181.4298.12.camel@billy.demon.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-In3RDtzG2aDhGJiwKcUr"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: "L.Kremkow" <kremkow@polytomy.org>
Cc: netfilter@lists.samba.org


--=-In3RDtzG2aDhGJiwKcUr
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

ons, 2002-06-05 kl. 20:29 skrev L.Kremkow:

> At this point I'm stuck. Any help would be appreciated.

Linux, you say. What distro?

Are you trying to compile a distro-specific kernel, or kernel.org kernel
code?

If it's a distro kernel, has it put the source code where it's supposed
to be?

How did you configure the kernel:
- 'make config',
- 'make menuconfig'
- 'make xconfig'?

Does it comprise Netfilter support and have you included this?

Have you run 'make pending-patches', or something else?

Did you do that before compiling your kernel?

What version of gcc are you using?

Why would you think everyone on this list is clairvoyant?

Tony

--=20

Tony Earnshaw

e-post:		tonni@billy.demon.nl
www:		http://www.billy.demon.nl
gpg public key:	http://www.billy.demon.nl/tonni.armor

Telefoon:	(+31) (0)172 530428
Mobiel:		(+31) (0)6 51153356

GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
3BE7B981



--=-In3RDtzG2aDhGJiwKcUr
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA8/mXb99dgUTvnuYERAnNfAJ9J4iS9ROvqPBhBycJ9bMdg8yx2EACfZ3Y+
ZO4A7pHPFdZJmQ+BaanpjVM=
=sMNs
-----END PGP SIGNATURE-----

--=-In3RDtzG2aDhGJiwKcUr--


