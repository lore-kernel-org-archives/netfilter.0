From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: opening a port..
Date: 08 Jan 2003 15:54:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042034080.26554.86.camel@rayw.knowledgefactory.co.za>
References: <1042027958.606.7.camel@nirvana>
	 <1042030413.590.13.camel@nirvana>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-TOEPcKoh/4nwGtBIEDW0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042030413.590.13.camel@nirvana>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: mdew <mdew@mdew.dyndns.org>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-TOEPcKoh/4nwGtBIEDW0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-01-08 at 14:53, mdew wrote:
> On Thu, 2003-01-09 at 01:12, mdew wrote:
> >=20
> > Hi,
> > Just *testing* this out..
> >=20
> > iptables -A INPUT -i eth0 -p tcp --dport 4662 -j ACCEPT
> > iptables -A INPUT -i eth0 -p udp --dport 4662 -j ACCEPT
> > iptables -A INPUT -i eth1 -p udp --dport 4662 -j ACCEPT
> > iptables -A INPUT -i eth1 -p tcp --dport 4662 -j ACCEPT
> > iptables -A INPUT -i eth1 -p tcp --sport 4662 -j ACCEPT
> > iptables -A INPUT -i eth1 -p udp --sport 4662 -j ACCEPT
> > iptables -A INPUT -i eth0 -p udp --sport 4662 -j ACCEPT
> > iptables -A INPUT -i eth0 -p tcp --sport 4662 -j ACCEPT
> >=20
> > iptables -A FORWARD -o eth0 -p tcp --dport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth1 -p tcp --dport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth1 -p udp --dport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth0 -p udp --dport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth0 -p udp --sport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth1 -p udp --sport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth1 -p tcp --sport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth0 -p tcp --sport 4662 -j ACCEPT
> >=20
> > yet, when i try to telnet to it,
> >=20
> > mdew:~# telnet 127.0.0.1 4662
> > Trying 127.0.0.1...
> > telnet: Unable to connect to remote host: Connection refused
> >=20
> > Yeah I know I have lots of unnessary rules, but im only testing 'em...i=
t
> > just seems a little strange that i cant see 4662 (Edonkey port) on the
> > router.
> >=20
> > -mdew
>=20
> ok, from another machine->router. (same problem)
>=20
> telnet 10.0.0.6 4662
> Trying 10.0.0.6...
> telnet: Unable to connect to remote host: Connection refused
>=20
Connection refused means the router is not listening on that port ...

>=20
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

--=-TOEPcKoh/4nwGtBIEDW0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+HC2gh1fuR/Bv+ygRAiCJAJwMOzqqkSAxBCqmKWXEGDt9RIJNSwCfdVLY
RvCYjFWoATOj5gPxr7T6/jg=
=y6Cg
-----END PGP SIGNATURE-----

--=-TOEPcKoh/4nwGtBIEDW0--


