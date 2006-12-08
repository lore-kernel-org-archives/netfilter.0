From: Jorge Augusto Senger <jorge@br10.com.br>
Subject: Re: IPTables not starting with Fedora 6
Date: Fri, 08 Dec 2006 08:19:14 -0200
Message-ID: <45793C22.8050008@br10.com.br>
References: <4578B713.8020406@wispertel.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig8E3ACE19ABD59013A3395173"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4578B713.8020406@wispertel.net>
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig8E3ACE19ABD59013A3395173
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

< setenforce 0 > ?

P. Harlow escreveu:
> This might be better posted to an SELinux list however I thought I'd
> start here.
>=20
> I have a fresh install of Fedora Core 6. All works well with IPTables
> however when I try to get it started at boot I get the following SELinu=
x
> error:
>=20
> type=3DAVC msg=3Daudit(1165530432.263:80): avc: denied { read } for pid=
=3D2995
> comm=3D"iptables-restor" name=3D"iptables" dev=3Ddm-0 ino=3D11599885
> scontext=3Duser_u:system_r:iptables_t:s0
> tcontext=3Duser_u:object_r:etc_runtime_t:s0 tclass=3Dfile
> type=3DSYSCALL msg=3Daudit(1165530432.263:80): arch=3D40000003 syscall=3D=
5
> success=3Dno exit=3D-13 a0=3Dbffb4f67 a1=3D0 a2=3D1b6 a3=3D927e008 item=
s=3D0 ppid=3D2986
> pid=3D2995 auid=3D501 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D=
0 sgid=3D0
> fsgid=3D0 tty=3D(none) comm=3D"iptables-restor" exe=3D"/sbin/iptables-r=
estore"
> subj=3Duser_u:system_r:iptables_t:s0 key=3D(null)
>=20
> No matter what I do the machine refuses to read that file. Even if I
> re-create it manually. Has anyone run into this where iptables-restore
> is not allowed to read this file?
>=20
>=20

--=20
Atenciosamente,

Jorge Augusto Senger
BR10 Ltda - Ger=EAncia de TI
jorge@br10.com.br
42 32252888 / 84015330


--------------enig8E3ACE19ABD59013A3395173
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFeTwliOnIWGbribERAopAAKDlM0fC2mTaDuvnF9aT5bnPQAvpAACgxe3j
bCrU8Lk8I4Lbra7lhk7OtYA=
=ObcF
-----END PGP SIGNATURE-----

--------------enig8E3ACE19ABD59013A3395173--

