From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: where is libipt_match.so?
Date: 29 May 2003 07:31:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054186276.13296.186.camel@raylinux.internal>
References: <20030529034344.GF33081@justpickone.org>
	 <09B04A55822EFF4DA48D2E0BB2941D4A0D6D40@wardrive.citadelcomputer.com.au>
	 <20030529035602.GG33081@justpickone.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-U/OoFHaRnajTWCOwI5nP"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030529035602.GG33081@justpickone.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter Users' List <netfilter@lists.netfilter.org>


--=-U/OoFHaRnajTWCOwI5nP
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-05-29 at 05:56, David T-G wrote:
> George, et al --
>=20
> ...and then George Vieira said...
> %=20
> % Have you searched for the file?
>=20
> I hadn't yet, but I did, and it truly isn't on the system.
>=20
> What is it?  From where does (er, should) it come?
>=20
It's a netfilter module, and it comes from the iptables distribution
(also in the 2.4 kernel distro). You get it by compiling and installing
the iptables distro, or selecting match support in the netfilter kernel
config section and compiling the kernel.

>=20
> %=20
> % # Unix compatible search. ;)
> % find / -name libipt_match.so -exec ls -l {} \;
>=20
> The only kind -- although I wouldn't bother with the extra overhead of
> the exec ;-)
>=20
>=20
>=20
> %=20
> % if it's in a different location just symbolic link it to where ever it'=
s
> % looking for it.. ;) cheap way out..
>=20
> If only it were that simple!
>=20
>=20
> %=20
> % Thanks,
>=20
> Thanks, anyway.
>=20
>=20
> % ____________________________________________
> % George Vieira
> % Systems Manager
> % georgev@citadelcomputer.com.au
> %=20
> % Citadel Computer Systems Pty Ltd
> % http://www.citadelcomputer.com.au
>=20
>=20
> HAND
>=20
> :-D
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-U/OoFHaRnajTWCOwI5nP
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+1Zskh1fuR/Bv+ygRAgE6AJ0ftVLKGcDvU7FBZPnJBvs6XpQwMACcCGJ8
NBRuqKLwTZEaSFu7EOb4fYY=
=VuNp
-----END PGP SIGNATURE-----

--=-U/OoFHaRnajTWCOwI5nP--


