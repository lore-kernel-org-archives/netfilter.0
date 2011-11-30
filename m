From: Eric Leblond <eric@regit.org>
Subject: Re: [nfqueue] verdict NF_ACCEPT doesn't continue
Date: Wed, 30 Nov 2011 09:07:49 +0100
Message-ID: <1322640465.2816.16.camel@ice-age.regit.org>
References: <jb4nnu$s0u$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-Q4gLwLLiaSViWmv5BTZ4"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <jb4nnu$s0u$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org


--=-Q4gLwLLiaSViWmv5BTZ4
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mercredi 30 novembre 2011 =E0 08:58 +0100, U.Mutlu a =E9crit :
> nfq_set_verdict() or nfq_set_verdict2():
>    NF_DROP    discard the packet
>    NF_ACCEPT  the packet passes, continue iterations
>=20
> In my callback I pass NF_ACCEPT to let the packet continue its travel
> through the subsequent rules (normal iptables rules).

When NF_ACCEPT is issued, the packet is accepted for the current table.
It will then only be checked by rules in other tables.

BR,

> but the packet doesn't reach the subsequent rules.
> The "obvious" explanation for that behavour would of course be
> when not NF_ACCEPT but NF_DROP had been passed to the verdict routine.
> But it's not the case. So, then NF_ACCEPT seems to behave anormal here,
> that's mysterious.
>=20
> Here's my script:
>=20
>   ...
>   iptables -A INPUT   -p all  -j NFQUEUE --queue-num 4711
>   iptables -A INPUT   -p all  -j LOG --log-prefix "DEBUG ALL "
>   ...
>=20
> # iptables -L -n
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> ...
> NFQUEUE    all  --  0.0.0.0/0            0.0.0.0/0            NFQUEUE num=
 4711
> LOG        all  --  0.0.0.0/0            0.0.0.0/0            LOG flags 0=
 level 4 prefix "DEBUG ALL "
> ...
>=20
> The logging normally functions well, but when NFQUEUE is active
> then logging of the received packets mysteriously stops.
>=20
>=20
> # uname -a
> Linux s7 3.0.0-1-rt-amd64 #1 SMP PREEMPT RT Sat Aug 27 17:34:31 UTC 2011 =
x86_64 GNU/Linux
>=20
>=20
> int grcCB =3D 0;
> static int cb(struct nfq_q_handle* qh, struct nfgenmsg* nfmsg, struct nfq=
_data* nfa, void* pUserData)
>    { // this callback func is called from nfq_handle_packet()
>=20
>      bool  fDrop =3D false;
>      const u_int32_t id =3D process_pkt(nfa, fDrop);
>      return grcCB =3D nfq_set_verdict(qh, id, fDrop ? NF_DROP : NF_ACCEPT=
, 0, NULL);
>    }
>=20
> ...
> const int rv =3D recv(fd, buf, sizeof(buf), 0);       // is blocking!
> if (rv >=3D 0)
>    {
>      if (nfq_handle_packet(h, buf, rv) =3D=3D 0)
>        {
>          //...
>        }
>      else
>       {
>         printf("ERR: rc of handle_packet is %d\n", grcCB);
>       }
>    }
>=20
> nfq_set_verdict gives 0 and hence the "ERR" line doesn't get executed eve=
r.
>=20
> Is this a bug of the library or do I need to use something different than=
 NF_ACCEPT?
> What about the last 2 params of nfq_set_verdict, could they be the reason=
?
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=-Q4gLwLLiaSViWmv5BTZ4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iD8DBQBO1eRRnxA7CdMWjzIRAgMOAJ4k5wCWBO0PVwAOl2qrlyxI/eoozgCgg4B1
L9Ka6HH0IZrh+UHMlrg2Hz0=
=s5S7
-----END PGP SIGNATURE-----

--=-Q4gLwLLiaSViWmv5BTZ4--

