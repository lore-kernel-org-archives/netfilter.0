From: Nuno Miguel Pais Fernandes <npf@eurotux.com>
Subject: Re: ip_conntrack_max table full
Date: 02 May 2003 12:48:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051876098.29424.17.camel@xeon.office.eurotux.com>
References: <20030428130014.M2389@pine.njnu.edu.cn>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-6nx3vyHwGjrcaQlvMYLQ"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030428130014.M2389@pine.njnu.edu.cn>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: gfzhang <gfzhang@njnu.edu.cn>
Cc: netfilter@lists.netfilter.org


--=-6nx3vyHwGjrcaQlvMYLQ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello

Try ip_conntrack-timeouts at
http://www.netfilter.org/documentation/pomlist/pom-extra.html

I've never tried, but it may help you.

Nuno Fernandes

On Mon, 2003-04-28 at 14:00, gfzhang wrote:
> i'm using iptables as NAT svr to my UNIV. my system is:
>    2*xeron 2.4GHZ
>    2GB   mem
>=20
> after some time about a day I found that there is logging=20
> messege on my screen like this :
>     Ip_conntrack table full drop pack
>    tones of such messages and all of the LAN user can't get
> access to internet.
>=20
> cat  /proc/sys/net/ipv4/ip_conntrack_max=20
>  65536
>=20
> when I cat /proc/net/ip_conntrack I found=20
> a lot of dead transformed items the TIMEOUT is about 5days
> obviously nobody is using my box but such items will last=20
> for a long time before I reboot my box!
> how can i flush them?
>=20
> in ip_conntrack_proto.c=20
> I found the default timeout is 5DAYS
>=20
> I don't think it's necessary for me to maintain a tranform=20
> for so long .
>    maybe I should change the default TIMEOUT TO 1DAY
>    anybody can help me to deal with it?
>=20
>    thanks in advance.
>=20
>=20
>=20
--=20
Nuno Miguel Pais Fernandes <npf@eurotux.com>

--=-6nx3vyHwGjrcaQlvMYLQ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+slsCbJtoPy2XRQkRAlHDAJwM2jC+IG5M7jm7ZAdylw5XApiNkgCfRgId
8GBksHvxopv7rdrfAtED5qM=
=iGWI
-----END PGP SIGNATURE-----

--=-6nx3vyHwGjrcaQlvMYLQ--


