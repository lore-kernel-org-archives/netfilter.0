From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: RE: Iptables and various domains
Date: 12 Dec 2002 10:52:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039683170.4085.41.camel@rayw.knowledgefactory.co.za>
References: <NEBBKLENIBMGHGCLGBPIIEBLCDAA.security@e-gim.es>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-DOysrUHB3TfWUDUe0aCZ"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEBBKLENIBMGHGCLGBPIIEBLCDAA.security@e-gim.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: E-GIM Security <security@e-gim.es>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-DOysrUHB3TfWUDUe0aCZ
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 2002-12-12 at 11:34, E-GIM Security wrote:
> Thanks Raymond:
>=20
> My domains are virtually hosted. Problems is the next: We have various ap=
ps
> in IIS-Windows and ASP technologic. Future developments we need will be
> hosted on Linux with Apache+Tomcat. But, we only use one IP number. Do yo=
u
> know another solution?
>=20
I don't understand the question. You cannot host two physically seperate
machines with one ip (AFAIK). iptables does not have the capability to
look inside http headers (maybe with an iptbles module ...)

Ray

> Thanks a lot
>=20
> > -----Mensaje original-----
> > De: Raymond Leach [mailto:raymondl@knowledgefactory.co.za]
> > Enviado el: jueves, 12 de diciembre de 2002 8:15
> > Para: E-GIM Security
> > CC: Netfilter Mailing List
> > Asunto: Re: Iptables and various domains
> >
> >
> > Hi
> >
> > Yes and maybe no. If your domains are virtually hosted (they resolve to
> > the same ip numbers) then no. iptables cannot redirect traffic in this
> > case - it uses ip numbers. You would need to use something like Apache
> > virtual hosting and possibly redirect pages to accomplish your goal in
> > this case.
> >
> > If your domains resolve to different ip numbers, then iptables can be
> > your solution:
> >
> > iptables -t nat -A PREROUTING -d www.dom1.com -p tcp --dport 80 -j
> > REDIRECT --to-destination webserver-1:80
> > iptables -t nat -A PREROUTING -d www.dom2.com -p tcp --dport 80 -j
> > REDIRECT --to-destination webserver-1:80
> > iptables -t nat -A PREROUTING -d www.dom3.com -p tcp --dport 80 -j
> > REDIRECT --to-destination webserver-2:80
> > iptables -t nat -A PREROUTING -d www.dom4.com -p tcp --dport 80 -j
> > REDIRECT --to-destination webserver-2:80
> >
> > Remember, to use iptables like above, www.dom1.com, www.dom2.com,
> > www.dom3.com, www.dom4.com must resolve to different ip numbers.
> >
> > Ray
> >
> >
> > On Thu, 2002-12-12 at 10:58, E-GIM Security wrote:
> > > 	Hi,
> > >
> > > 	Can Iptables route by domains? For example, I have a
> > webserver and my
> > > firewall with iptables route all request on port 80 throw IP
> > webserver. I
> > > need add another webserver, and various domains (www.dom1.com,
> www.dom2.com)
> > will be redirect to webserver-1 and other domains (www.dom3.com,
> > www.dom4.com) will be redirect to webserver-2. Can IPTables help me? Wh=
ich
> > is the solution)
> >
> > 	Thanks and sorry ... my english is very poor.
> >
> > Jos=E9 Antonio Garc=EDa Garc=EDa
> > Technical Internet Solutions
> >
> > E-GIM 	+34 952700010
> > http://www.e-gim.es
> >
> --
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> (  Raymond Leach                       )
>  ) Knowledge Factory                  (
> (                                      )
>  ) Tel: +27 11 445 8100               (
> (  Fax: +27 11 445 8101                )
>  )                                    (
> (  http://www.knowledgefactory.co.za/  )
>  ) http://www.saptg.co.za/            (
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    o                                o
>     o                              o
>         .--.                  .--.
>        | o_o|                |o_o |
>        | \_:|                |:_/ |
>       / /   \\              //   \ \
>      ( |     |)            (|     | )
>      /`\_   _/'\          /'\_   _/`\
>      \___)=3D(___/          \___)=3D(___/
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

--=-DOysrUHB3TfWUDUe0aCZ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9+E5ih1fuR/Bv+ygRAhEBAJ0fbxEXYbiluM0alVeGWSB6u0ffqgCeMNdc
P0wEqHTsnRDUsJ/wZPLhZvs=
=+bOb
-----END PGP SIGNATURE-----

--=-DOysrUHB3TfWUDUe0aCZ--


