From: Sasa Stupar <sasa@stupar.homelinux.net>
Subject: RE: Redirection question
Date: Tue, 21 Dec 2004 08:52:16 +0100
Message-ID: <1103615536.3607.6.camel@localhost.localdomain>
References: <186AC876521E0F46BDE77079A6567FD05B0058@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-bx7EEJNCW6Zaoc1WfTGK"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <186AC876521E0F46BDE77079A6567FD05B0058@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Netfilter-List <netfilter@lists.netfilter.org>


--=-bx7EEJNCW6Zaoc1WfTGK
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

I did that because of one reason - viruses/worms sending from infected
computer by using mail server settings in the clients Outlook. But
clients also have some other accounts and not only local so I get
complains from my ISP and other that I am sending spam vith viruses.
This way I redirect all smtp traffic to my server which requires client
authentication. And if some worms/viruses have their own smtp server
they are also redirected to my internal mail server which will block
anauthorized relay attempt.

Sasa

V pon, 20.12.2004 ob 23:47 je Hudson Delbert J Contr 61 CS/SCBN
napisal(a):
> i guess i need to ask what role you play in the lan admin?
>=20
> i think it might be easier to modify mx type pointer mechanisms on the cl=
ients
> instead of having the fw do all this wasteful redirs. they are wasteful
> because you now where you want the mail traffic to go - this isnt clever.
> its a way to perform this task but its not very elegant and doesnt scale =
for
> manintenance.
>=20
> out...
>=20
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Sasa Stupar
> Sent: Monday, December 20, 2004 1:33 PM
> To: Netfilter ML
> Subject: Re: Redirection question
>=20
>=20
> Sasa Stupar a =E9crit :
>=20
> > Sasa Stupar a =E9crit :
> >=20
> >> Hi!
> >>
> >> I have installed mail server on my lan. Now I would like to redirect=20
> >> all lan users to use that mail server as smtp (similar as transparent=20
> >> proxy with squid). How do I do that smtp redirection?
> >> I was thinking something like:
> >> -------------
> >> iptables -t nat -A PREROUTING -i eth0 -s ! smtp-box -p tcp --dport 25=20
> >> -j DNAT --to smtp-box:25
> >> iptables -t nat -A POSTROUTING -o eth0 -s local-network -d smtp-box -j=
=20
> >> SNAT --to iptables-box
> >> iptables -A FORWARD -s local-network -d smtp-box -i eth0 -o eth0 -p=20
> >> tcp --dport 25 -j ACCEPT
> >> --------------
> >> Is this correct?
> >>
> >> Regards,
> >> Sasa
> >>
> >=20
> > I forgot some more infos:
> > running on FC3 with sendmail. This is also a router with 2 NIC
> > installed: one for internet and one for LAN.
> >=20
> > Sasa
>=20
> Solved. It is working as I have mentioned above.
>=20
> Sasa
>=20
>=20

--=-bx7EEJNCW6Zaoc1WfTGK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: To je digitalno podpisani del =?iso-8859-2?Q?sporo=E8ila?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBx9YvZfogXwY+ISIRAuCLAKC6lrLkioXpLkI9S/MirrgZZg4lVQCgl1H/
widf0uDiS+QX/4f3kgnwW/Q=
=g+7l
-----END PGP SIGNATURE-----

--=-bx7EEJNCW6Zaoc1WfTGK--


