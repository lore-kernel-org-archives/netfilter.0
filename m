From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: hostname forwarding
Date: 12 Dec 2002 09:13:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039677214.4098.24.camel@rayw.knowledgefactory.co.za>
References: <Pine.LNX.4.33.0212111606240.17876-100000@www.csbenter.at>
	 <1039671369.4125.12.camel@rayw.knowledgefactory.co.za>
	 <3DF837BA.5000908@libero.it>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-G3WD9mL4tdca8WG+4lAP"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF837BA.5000908@libero.it>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Blizzards <blizzards@libero.it>
Cc: Patrick Maartense <patrick@patrick.at>, bernard <bernard@gers.net>, Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-G3WD9mL4tdca8WG+4lAP
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

OK, that makes sense...

On Thu, 2002-12-12 at 09:16, Blizzards wrote:
> The host A and Host B share the same ip address.
> In this case -s is no useful because resolving host a and host b return=20
> the same address, and the 1st match win.
> You can use APACHE name virtual host to handle this correctly.
>=20
> G.
>=20
> >>
> >>   =20
> >>
> >Ummm, what is the -s parameter for then?
> >iptables -t nat -A PREROUTING -p tcp -s <hostname A> --dport 80 -j
> >REDIRECT --to-destination 192.168.1.1:80
> >iptables -t nat -A PREROUTING -p tcp -s <hostname B> --dport 80 -j
> >REDIRECT --to-destination 192.168.1.2:80
> >
> >Or am I missing something?
> >
> >Ray
> > =20
> >
--=20
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(  Raymond Leach                       )
 ) Knowledge Factory                  (
(                                      )
 ) Tel: +27 11 445 8100               (
(  Fax: +27 11 445 8101                )
 )                                    (
(  http://www.knowledgefactory.co.za/  )
 ) http://www.saptg.co.za/            (
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   o                                o
    o                              o
        .--.                  .--.
       | o_o|                |o_o |
       | \_:|                |:_/ |
      / /   \\              //   \ \
     ( |     |)            (|     | )
     /`\_   _/'\          /'\_   _/`\
     \___)=3D(___/          \___)=3D(___/

--=-G3WD9mL4tdca8WG+4lAP
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9+Dceh1fuR/Bv+ygRAnPGAKCTdUIIkzPMJrIjiYJWtyrD5xkFDwCfVNVu
3cM9QXxo1YhRtXq/9HHmaBg=
=Tj22
-----END PGP SIGNATURE-----

--=-G3WD9mL4tdca8WG+4lAP--


