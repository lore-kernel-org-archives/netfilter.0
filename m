From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Iptables and various domains
Date: 12 Dec 2002 10:14:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039680872.4125.30.camel@rayw.knowledgefactory.co.za>
References: <NEBBKLENIBMGHGCLGBPIKEBKCDAA.security@e-gim.es>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-neZcmn+qFyimZOzj4Ty9"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEBBKLENIBMGHGCLGBPIKEBKCDAA.security@e-gim.es>
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


--=-neZcmn+qFyimZOzj4Ty9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi

Yes and maybe no. If your domains are virtually hosted (they resolve to
the same ip numbers) then no. iptables cannot redirect traffic in this
case - it uses ip numbers. You would need to use something like Apache
virtual hosting and possibly redirect pages to accomplish your goal in
this case.

If your domains resolve to different ip numbers, then iptables can be
your solution:

iptables -t nat -A PREROUTING -d www.dom1.com -p tcp --dport 80 -j
REDIRECT --to-destination webserver-1:80
iptables -t nat -A PREROUTING -d www.dom2.com -p tcp --dport 80 -j
REDIRECT --to-destination webserver-1:80
iptables -t nat -A PREROUTING -d www.dom3.com -p tcp --dport 80 -j
REDIRECT --to-destination webserver-2:80
iptables -t nat -A PREROUTING -d www.dom4.com -p tcp --dport 80 -j
REDIRECT --to-destination webserver-2:80

Remember, to use iptables like above, www.dom1.com, www.dom2.com,
www.dom3.com, www.dom4.com must resolve to different ip numbers.

Ray


On Thu, 2002-12-12 at 10:58, E-GIM Security wrote:
> 	Hi,
>=20
> 	Can Iptables route by domains? For example, I have a webserver and my
> firewall with iptables route all request on port 80 throw IP webserver. I
> need add another webserver, and various domains (www.dom1.com, www.dom2.c=
om)
> will be redirect to webserver-1 and other domains (www.dom3.com,
> www.dom4.com) will be redirect to webserver-2. Can IPTables help me? Whic=
h
> is the solution)
>=20
> 	Thanks and sorry ... my english is very poor.
>=20
> Jos=E9 Antonio Garc=EDa Garc=EDa
> Technical Internet Solutions
>=20
> E-GIM 	+34 952700010
> http://www.e-gim.es
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

--=-neZcmn+qFyimZOzj4Ty9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9+EVoh1fuR/Bv+ygRAgy+AJ9wz2Cp1cTDyRs9wQ6/L5MXAEhEAgCeMqs4
iUl6Sc0UnGk1tLZuNysf2/E=
=kKUA
-----END PGP SIGNATURE-----

--=-neZcmn+qFyimZOzj4Ty9--


