From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: Error when using iptables 1.2.6a (or another version)
Date: 05 Jun 2002 08:25:50 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023258350.2834.8.camel@billy.demon.nl>
References: <B5747F3DB39FD411884B00B0D07808CCB6C1FC@server10>
	<1023223261.8261.2.camel@billy.demon.nl> 
	<20020604212807.GA30300@valjean.si.ocslink.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-aqvnJ2uUWuofzLLn0mDy"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020604212807.GA30300@valjean.si.ocslink.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org
Cc: James Sneeringer <james+netfilter@vincentsystems.com>, "Philippe Dhont  (Sea-ro)" <Philippe.Dhont@searo.be>


--=-aqvnJ2uUWuofzLLn0mDy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

tir, 2002-06-04 kl. 23:28 skrev James Sneeringer:

> There is a compile-time option to modutils (modprobe, insmod, et al) that
> permits gzipped kernel modules.

> I know Slackware 7.1 and 8.0 enable this feature.

Ah. Well then, Philippe's possibly suffering from the well-known
ipchains syndrome. lsmod would show this.

The solution is remove the ipchains modules (if they're not compiled
into a monolithic kernel) and substitute iptables.

Under Red Hat, up to v7.2, anyway, it was standard to start up ipchains
instead of iptables after a fresh install. All the iptables stuff had to
be done by hand, i.e. stopping automatic loading and enabling automatic
loading of iptables.

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



--=-aqvnJ2uUWuofzLLn0mDy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA8/a7u99dgUTvnuYERAvhpAJ0dgXqPDxckaidjbfgN3gQlwr0nVgCfdc44
u0hesKgzv+DRzCzIiee9gJM=
=4FY6
-----END PGP SIGNATURE-----

--=-aqvnJ2uUWuofzLLn0mDy--


