From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: hostname forwarding
Date: 12 Dec 2002 07:36:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039671369.4125.12.camel@rayw.knowledgefactory.co.za>
References: <Pine.LNX.4.33.0212111606240.17876-100000@www.csbenter.at>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-aHYyzQbX48qLjKl+yRY2"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0212111606240.17876-100000@www.csbenter.at>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Patrick Maartense <patrick@patrick.at>
Cc: bernard <bernard@gers.net>, Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-aHYyzQbX48qLjKl+yRY2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2002-12-11 at 17:06, Patrick Maartense wrote:
> this is not possible using ipotables
>=20
Ummm, what is the -s parameter for then?
iptables -t nat -A PREROUTING -p tcp -s <hostname A> --dport 80 -j
REDIRECT --to-destination 192.168.1.1:80
iptables -t nat -A PREROUTING -p tcp -s <hostname B> --dport 80 -j
REDIRECT --to-destination 192.168.1.2:80

Or am I missing something?

Ray
> Apache however can very well handle this ..
>=20
>=20
> On Wed, 11 Dec 2002, bernard wrote:
>=20
> > I'm using iptables to redirect external requests depending on their=20
> > port/protocol like this :
> >=20
> > 	hostname A:80 -> public ip -> iptables -> 192.168.1.1:80
> > 	hostname B:80 -> public ip -> iptables -> 192.168.1.1:80
> >=20
> > It works pretty well, thanks to iptables :-)
> >=20
> > Now I want to redirect on a hostname basis on different private ip's=20
> > like this :
> >=20
> > 	hostname A:80 -> public ip -> iptables -> 192.168.1.1:80
> > 	hostname B:80 -> public ip -> iptables -> 192.168.1.2:80
> >=20
> > Does anyone know a solution ?
> >=20
> > Thanks for your help.
> >=20
> > Bernard
> >=20
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

--=-aHYyzQbX48qLjKl+yRY2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9+CBJh1fuR/Bv+ygRAqg3AJsHV20whXMMp2ZTGU9yj2qv6gVbIACfWhRJ
DofJTC9JynNR1QDvPvmBI1Q=
=Lgoh
-----END PGP SIGNATURE-----

--=-aHYyzQbX48qLjKl+yRY2--


