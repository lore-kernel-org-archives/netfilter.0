From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: loop problem
Date: Wed, 21 Apr 2004 15:21:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040421132133.GA20894@zion.homelinux.com>
References: <OFD59B8072.78305988-ON65256E7D.0046DABC@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OFD59B8072.78305988-ON65256E7D.0046DABC@hss.hns.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: aksingh@hss.hns.com
Cc: netfilter@lists.netfilter.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Amit,

On Wed, Apr 21, 2004 at 06:31:51PM +0530, aksingh@hss.hns.com told us:
> Hi Sven
>=20
>   I think you got my question wrong but thank anyways yr answer helped
> anyways ....
> first, i believe a packet that hits IP_PRE_ROUTING can never hit
> IP_LOCAL_OUT, even if it is reinjected ... am i right ?

Hmmm...well I think it shouldn't...I should have been able to think
so far on my own...more coffee please! :))

>=20
> now to your answer , u mean to say i can tag a packet when it passes thru
> one hook so that another hook if it catches it can look at it and handle =
it
> differently .. i just saw struct sk_buff  ... it has an element unsigned
> lonf nfmark ... so you mean to say i can set it to a paricular value, so
> that when someother hook picks it up can identify that someone has already
> looked at it, right ? ... yes surely this can help when we have
> IP_PRE_ROUTING/POST_ROUTING combination or someother possible combination
> like IP_LOCAL_OUT and IP_POST_ROUTING .

Yes that's what I thougt of. The iptables mark match and target also use
this field (nfmark).

>=20
> thanks sven ... btw whats HTH ? :)

Hope that helps :))

> Amit
>=20

Sven

>=20
>=20
>=20

--=20
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GNU/=
Linux
 15:16:10  up 20:05,  1 user,  load average: 0.02, 0.03, 0.00

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAhnVdo4FAdB2PneQRAjQ3AJ9sAAMDS3Up4uUvr8RnYnX/mWUXaACfdVDz
Y/18jGW6J3dfE7WPM5moHnA=
=80/3
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--

