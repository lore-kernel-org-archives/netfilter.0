From: Harald Welte <laforge@netfilter.org>
Subject: Re: [Fwd: PPTP in 2.4.20]
Date: Mon, 22 Dec 2003 11:49:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031222104912.GH5058@obroa-skai.de.gnumonks.org>
References: <1072058922.1641.29.camel@hermes>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gm5TwAJMO0F2iVRz"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1072058922.1641.29.camel@hermes>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Gary Thomas <gary@chez-thomas.org>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--gm5TwAJMO0F2iVRz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2003 at 07:08:43PM -0700, Gary Thomas wrote:
> Harald,
>=20
> I'm in a bit of a pickle here & need to get this working.  The=20
> mailing list has not come up with any ideas, so if you have any,=20
> I'd sure appreciate them.

Sorry, we've never ever had a single report about this error message.

It basically means that somebody else has already registered for the
SO_GET_ORIGDST socket option.  I have no idea who else could be the
culprit.  Maybe you have loaded (or statically linked into the kernel)
one of the backwards compatibility modules for ipchains or ipfwadm?

Also, please make sure that the kernel and the modules are out of the
same build, otherwise you might experience all kinds of inconsistencies

> Thanks.

> --=20
> Gary Thomas <gary@chez-thomas.org>

Content-Description: Forwarded message - PPTP in 2.4.20
> Subject: PPTP in 2.4.20
> From: Gary Thomas <gary@chez-thomas.org>
> To: netfilter@lists.netfilter.org
> Organization:=20
> X-Spam-Score: -8.1 (--------)
> List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
> Date: 20 Dec 2003 08:32:45 -0700
> X-Spam-Status: No, hits=3D-6.2 required=3D5.0
> 	tests=3DAWL,BAYES_01,KNOWN_MAILING_LIST,USER_AGENT_XIMIAN version=3D2.55
> X-Spam-Level:=20
> X-Spam-Checker-Version: SpamAssassin 2.55 (1.174.2.19-2003-05-19-exp)
>=20
> I've tried to build kernel 2.4.20, using the patches applied
> via patch-o-matic (thanks, Harald!)  However, I can't get the
> PPTP modules to load.  In particular, when I try to load
> 'ip_conntrack', I get these messages:
>=20
> [root@hermes gthomas]# insmod ip_conntrack
> Using /lib/modules/2.4.20-TEST/kernel/net/ipv4/netfilter/ip_conntrack.o
> /lib/modules/2.4.20-TEST/kernel/net/ipv4/netfilter/ip_conntrack.o: init_m=
odule: Device or resource busy
> [root@hermes gthomas]# tail /var/log/messages
> Dec 20 07:34:31 hermes kernel: ip_conntrack version 2.1 (4094 buckets, 32=
752 max) - 312 bytes per conntrack
> Dec 20 07:34:31 hermes kernel: Unable to register netfilter socket option
>=20
> Of course, without this module loaded, I can't load any of the=20
> other [important for PPTP] ones.
>=20
> Any help or ideas greatly appreciated.
>=20
> --=20
> Gary Thomas <gary@chez-thomas.org>
>=20


--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--gm5TwAJMO0F2iVRz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/5swoXaXGVTD0i/8RAq8NAKCJFQhQikFo43vdMkGlikG2tAWBMgCgkK62
GJsw3TkxRvNYY3HiOApllc4=
=3Qn/
-----END PGP SIGNATURE-----

--gm5TwAJMO0F2iVRz--

