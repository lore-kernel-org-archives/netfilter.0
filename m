From: Nuno Miguel Pais Fernandes <npf@eurotux.com>
Subject: Re: per-connection byte counts
Date: 19 Jan 2004 14:27:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074522469.27665.7.camel@xeon.office.eurotux.com>
References: <20040118140903.GA3351@glympton.airtime.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-eTjuYFzQUlfQS4oWEZRf"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040118140903.GA3351@glympton.airtime.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Adam Rice <adamrice@ntlworld.com>
Cc: netfilter@lists.netfilter.org


--=-eTjuYFzQUlfQS4oWEZRf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Try http://luxik.cdi.cz/~devik/connbytes/

It works very well....

Ahh, connection counter restarts at zero after 4GB of data (32bits).


Nuno Fernandes


On Sun, 2004-01-18 at 14:09, Adam Rice wrote:
> I'd like to be able to get per-connection byte-counts from the kernel, so=
 I
> can create a sort of top program showing what processes and users are
> currently using the network and how much. Since I want this to be somethi=
ng I
> can keep running all the time, I don't want to do it by snooping the
> interface. Is there some way to do this with netfilter? Sadly
> /proc/net/ip_conntrack doesn't appear to provide this information.
>=20
> Thanks,
>   Adam
--=20
Nuno Miguel Pais Fernandes <npf@eurotux.com>

--=-eTjuYFzQUlfQS4oWEZRf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAC+llbJtoPy2XRQkRApTHAJ9OSCNIG2IYWMpDHaNnd0Gh0x6bEACbBLLt
UxKvGSAf19l6rAvCjwLQGbk=
=XB/b
-----END PGP SIGNATURE-----

--=-eTjuYFzQUlfQS4oWEZRf--


