From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: whether there are any packets in the ip_queue
Date: Tue, 20 Apr 2004 10:46:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040420084626.GB25017@zion.homelinux.com>
References: <004a01c4266c$b2d7d830$68892090@grouse>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <004a01c4266c$b2d7d830$68892090@grouse>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: netfilter@lists.netfilter.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2004 at 01:16:17AM +0100, Jee J.Z. told us:
> Hi all,
>=20
> I am using libipq for userspace programming on netfilter. I am having
> problems to determine whether there are any packets in the ip_queue befor=
e I
> call the function ipq_read(). I just don't wish to call ipq_read() when
> there is no packet in the ip_queue, because I need my program to do other
> things rather than waiting for a packet arriving (after calling ipq_read(=
),
> the program will stop and wait for some time or until a packet coming from
> the kernel). Are there anybody on the list who has any idea about this?

Why don't you just call ipq_read with a negative timeout value?? When
there's no packet available it will return immediately with a return
code of 0. (see "man ipq_read")


HTH

Sven

>=20
> BTW, may I ask whether this is the proper list to ask about netfilter/lib=
ipq
> programming, since it seems few people on the list talking about this kind
> of questions?
>=20

--=20
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GNU/=
Linux
 10:44:31  up 2 days, 17:42,  1 user,  load average: 0.00, 0.01, 0.00

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAhONio4FAdB2PneQRAtyOAJ47UBhUNR4evM9OIvw0kCsN9LX6WACeNHFb
e4vHdqnE1dPpBgIZDkOPHKM=
=KTEI
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--

