From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: Error when using iptables 1.2.6a (or another version)
Date: 04 Jun 2002 22:41:01 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023223261.8261.2.camel@billy.demon.nl>
References: <B5747F3DB39FD411884B00B0D07808CCB6C1FC@server10>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-oy40eS88QM3DBGlyHhUx"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <B5747F3DB39FD411884B00B0D07808CCB6C1FC@server10>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: "Philippe Dhont   (Sea-ro)" <Philippe.Dhont@searo.be>
Cc: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>


--=-oy40eS88QM3DBGlyHhUx
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

tir, 2002-06-04 kl. 10:42 skrev Philippe Dhont (Sea-ro):=20

> [root@server11 iptables-1.2.6]# ./iptables -L
> /lib/modules/2.4.18-6mdksecure/kernel/net/ipv4/netfilter/ip_tables.o.gz:
> init_module: Device or resource busy
> Hint: insmod errors can be caused by incorrect module parameters, includi=
ng
> invalid IO or IRQ parameters
> modprobe: insmod
> /lib/modules/2.4.18-6mdksecure/kernel/net/ipv4/netfilter/ip_tables.o.gz
> failed
> modprobe: insmod ip_tables failed
> iptables v1.2.6: can't initialize iptables table `filter': iptables who? =
(do
> you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
> [root@server11 iptables-1.2.6]#=20

O.k., I use Red Hat and kernel.org kernels and modules, but it seems
*very* strange to me that Mandrake should use gzipped modules. Maybe it
does, who knows? Because my basic iptables modules are compiled into the
kernel, I couldn't try gzipping iptables modules, but I put my precious
Conexant modem modules on the line for you, gzipped them and tried to
load them.=20

Well, of course I couldn't. So I unzipped them again and hey presto,
good as new.=20

do: 'cd /lib/modules/2.4.18-6mdksecure/kernel/net/ipv4/netfilter'
'mkdir ../netfilter.bkup'=20
'find . | cpio -pumv ../netfilter.bkup'=20
'gunzip *'=20

Then try your iptables load again.=20

If it still doesn't work, change the dir. contents back to what they
were:=20
'gzip *'=20

It still won't work, but you won't be any the worse off.=20

Remove cd /lib/modules/2.4.18-6mdksecure/kernel/net/ipv4/netfilter,
whatever happens.

Tony=20

--=20

Tony Earnshaw

e-post:		tonni@billy.demon.nl
www:		http://www.billy.demon.nl
gpg public key:	http://www.billy.demon.nl/tonni.armor

Telefoon:	(+31) (0)172 530428
Mobiel:		(+31) (0)6 51153356

GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
3BE7B981


--=-oy40eS88QM3DBGlyHhUx
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA8/SXc99dgUTvnuYERAhc+AJ0bMWsPYaxsR8SJ5aLai5A2LbjnVgCdHIc3
xwd5PueoQYC94zcRLxEtzWQ=
=lMpD
-----END PGP SIGNATURE-----

--=-oy40eS88QM3DBGlyHhUx--


