From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: block kazaa
Date: 26 Mar 2003 17:14:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048691675.1427.50.camel@raylinux.internal>
References: <5.2.0.9.0.20030325212147.00ba2e88@mail.clara.net>
	 <1048656618.6605.13.camel@raylinux.internal>
	 <20030326150659.GA29683@placemark.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Bt4yWym/r+Mm1GhiRK+9"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030326150659.GA29683@placemark.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Kelly Setzer <Kelly.Setzer@placemark.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-Bt4yWym/r+Mm1GhiRK+9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Some ftp servers out there do not support or have fallback to passive
ftp.


On Wed, 2003-03-26 at 17:06, Kelly Setzer wrote:
> On Wed, Mar 26, 2003 at 07:30:19AM +0200, Raymond Leach wrote:
> > On Tue, 2003-03-25 at 23:27, paulc@ibiblio.org wrote:
> > > The way I block Kazaa (and the other file sharing applications) is a=20
> > > blanket ban on all ports by default. I then open the ports as I think=
 is=20
> > > appropriate at the firewall. These only include the port 23 for anyon=
e=20
> > > wishing to use telnet. All web and ftp style ports on 80, 21 and the =
like=20
> > > are handled by a web-proxy to prevent using them for other purposes. =
All=20
> > > incoming connects (and lots of ICMP messages) are dropped by the fire=
wall also.
> > >=20
> > How do you get passive ftp to work and not allow file sharing networks?
>=20
> Do you mean active ftp?  Passive ftp uses outbound connections for
> both control (20) and data (21).  Active ftp uses an inbound
> connection on port 21.  Force your users to use passive ftp only.
> Most clients default to that anyway.
>=20
> Kelly
>=20
> --
> Kelly Setzer, System Administrator/Architect - Placemark Investments
> 14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
> kelly.setzer@placemark.com  http://www.placemark.com
> (972)404-8100x41 (work)       (214) 287-3464 (cell)
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
(  http://www.mapnet.co.za/            )
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


--=-Bt4yWym/r+Mm1GhiRK+9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+gcPbh1fuR/Bv+ygRAhy0AKCoBPuMzoHiEfyw96R0R8V6qETgXgCdE2XU
QOxJ2SzFwr7ruTxo3MrF38s=
=SuHE
-----END PGP SIGNATURE-----

--=-Bt4yWym/r+Mm1GhiRK+9--


