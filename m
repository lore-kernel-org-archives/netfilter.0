From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: Help!! Is this true??
Date: 10 Jun 2002 11:02:19 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023699740.9979.19.camel@billy.demon.nl>
References: <3D043D33.41AED997@isp-systems.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-SfGHvvHMYCweA7CmAzwA"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D043D33.41AED997@isp-systems.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: OTR Comm <otrcomm@isp-systems.com>
Cc: iptables <netfilter@lists.samba.org>


--=-SfGHvvHMYCweA7CmAzwA
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

man, 2002-06-10 kl. 07:46 skrev OTR Comm:

> Is it true that iptables does not support virtual interfaces for virtual
> domains?

> That is, I have many virtual domains setup on virtual interfaces to eth0
> (e.g. eth0:1 xyz.xyz.xyz.xyz) currently running on a system with
> ipchains.  I am thinking about converting to a new kernel with iptables,
> but I can not get iptables to work with the virtual interfaces on eth0.=20
> I setup a test server to verify that iptables would work, but I can not
> access any of my test domains (i.e., web sites through Apache) when I
> have the IP for the domain tied to a virtual interface.  If I shutdown
> my iptables firewall, I can access the web sites fine.

> What's up here, anybody got any ideas and solutions?

Instead of using aliases, if you have iproute2 installed and can use the
'ip' utility, give your eth0 (and perhaps other devices) actual
addresses.

The ip command is poorly - or rather too comprehensively - documented
and 'ip help' needs some fathoming, but here's a useful reference:

http://leaf.sourceforge.net/devel/ericw/ip-syntax.php

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



--=-SfGHvvHMYCweA7CmAzwA
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9BGsb99dgUTvnuYERAr8hAJ9bSJlJ3b1b2DFLKCt8URLphl/ctACfQQ6b
EAUtAeNK93Jv/6Hmrxz3P40=
=hGwl
-----END PGP SIGNATURE-----

--=-SfGHvvHMYCweA7CmAzwA--


