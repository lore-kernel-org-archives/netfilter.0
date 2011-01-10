From: Eric Leblond <eric@regit.org>
Subject: Re: nfq_bind_pf() simultaneously in 2 separate programs?
Date: Mon, 10 Jan 2011 23:24:49 +0100
Message-ID: <1294698289.29036.8.camel@ice-age>
References: <AANLkTikumMyi8wSQt1ipz10w0TDyjqo6g8Wet-QJ63Pq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-xaAFxgxLZn/HbFtTufqR"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikumMyi8wSQt1ipz10w0TDyjqo6g8Wet-QJ63Pq@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Ajay Lele <ajay.lele@gmail.com>
Cc: netfilter@vger.kernel.org


--=-xaAFxgxLZn/HbFtTufqR
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

Le lundi 10 janvier 2011 =E0 12:31 -0800, Ajay Lele a =E9crit :
> Hi All
>=20
> I am using netfilter_queue library (version 1.0.0, nfnetlink version
> 1.0.0) to queue certain packets to user-space and it works great
>=20
> Now I want to run 2 instances on this program simultaneously with each
> program receiving and processing packets received on a different
> queue. The 1st instance of program runs fine, but call to
> nfq_unbind_pf()/nfq_bind_pf() for AF_INET fail in the 2nd instance
>=20
> Is it not possible to use netfilter_queue APIs simultaneously in 2
> programs when each one of them is listening to a separate queue? Any
> other approach which can be used to get this to work? - I don't want
> to merge the processing of packets on the 2 queues into a single
> program

nfq_bind_pf() call is linking the kernel nf_queue capability with the
nfnetlink_queue module for a given protocol. This has only to be done
once on a system (as nfnetlink_queue is the only userspace queuing
module for now).

Thus your program can simply ignore the return on nfq_[un]bind_pf()
function.

BR,

>=20
> Thanks in advance
>=20
> Regards
> Ajay
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Eric Leblond <eric@regit.org>

--=-xaAFxgxLZn/HbFtTufqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iD8DBQBNK4ctnxA7CdMWjzIRAtrgAJ98lIbZPu08gkmjPEZkAL8jLXd6owCfdUUa
Qhua5v/UNiS8wwy0aek4tn0=
=moV/
-----END PGP SIGNATURE-----

--=-xaAFxgxLZn/HbFtTufqR--

