From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: iptables compile trouble
Date: 06 Jun 2002 00:42:41 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023316963.4298.139.camel@billy.demon.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-VGG77zbqjPsYjYohrCxv"
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
To: Leif Kremkow <kremkow@polytomy.org>
Cc: netfilter@lists.samba.org


--=-VGG77zbqjPsYjYohrCxv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

ons, 2002-06-05 kl. 22:03 skrev Leif Kremkow:

> I would not like to call what I have a distro... It's based on a SuSE 7.0
> install, where I replaced nearly everything I use (kernel and it's
> dependencies, make, X, SSL, etc.). I don't use any of the distro specific
> stuff, such as YaST.

O.k. That's the same as me. I'm Red Hat 7.2, but there isn't much left
of the important networking stuff.

I don't have any trouble with the iptables compilation, as don't most
people on this list.

At this point, I have to confess to having misunderstood your original
posting. In fact, you've done a kernel compile with patched Netfilter
code, and have a new kernel with its own associated and your iptables
modules. The latter should now be in

/lib/modules/2.4.18//kernel/net/ipv4/netfilter .

Are they? Can you modprobe/insmod and rmmod them?

If so, your problem's nothing to do with the kernel, rather with the
userspace utilities.

If so, leave the kernel as it is, or recompile it without IPV6, which
you've said you don't need. Obviously you need the necessary iptables
patch-o-matic patches.

The following is an orrible workaround and shouldn't be necessary. It
works for me, but might not for you. All the ipv6 stuff comes at the end
of the make.

vi the iptables userspace top Makefile in your 1.2.6a compile directory
(the others don't need it). Instead of making DO_IP6=3D0, comment it out:
#DO_IP6=3D0 and 'make clean', 'make'. If you want to see afterwards what
it's done, do:

'make > /tmpdir 2>&1' and 'more'/'less' the resulting logfile
afterwards. For me it compiles cleanly cuts out all the ipv6 utilities.
For you it should do the same.

I'm tired and I'm going to bed. Night comes early in Holland :-)

Best,

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



--=-VGG77zbqjPsYjYohrCxv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA8/pPg99dgUTvnuYERAh7LAJ4jF/t8EpKE2P4PjgZMqJsG9MD5YgCeMIb6
1cQxcx3i6YYKDV8tYo45y0k=
=k0g+
-----END PGP SIGNATURE-----

--=-VGG77zbqjPsYjYohrCxv--


