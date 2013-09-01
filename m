From: Eric Leblond <eric@regit.org>
Subject: Re: automatic helper assignment is deprecated and it will be
 removed soon
Date: Sun, 01 Sep 2013 22:28:33 +0200
Message-ID: <1378067313.3513.54.camel@ice-age.regit.org>
References: <CAMD-=V+QAVw23X9eSAuzF4nz0kH0+vw0Om46+ofr0EGMVW6PNA@mail.gmail.com>
	 <1377952582.3513.45.camel@ice-age.regit.org>
	 <CAMD-=V+yrawW6hPSLxp=0j+4=Gt88uo5sEL4gqoRJ8n3dMWWnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-BQyOEL//UuJX6bZvn5GS"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMD-=V+yrawW6hPSLxp=0j+4=Gt88uo5sEL4gqoRJ8n3dMWWnw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Nick Edwards <nick.z.edwards@gmail.com>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>


--=-BQyOEL//UuJX6bZvn5GS
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

Le dimanche 01 septembre 2013 =E0 17:11 +1000, Nick Edwards a =E9crit :
> Hi Eric,
>=20
> Thank you for that, one thing though on PREROUTING, is that just extra
> security, not critical for ftp to work,or not really needed after I
> fix my forwarding rule up.

FORWARD changes are not needed at a functional level. It is a security
improvement.
Using CT target in PREROUTING (raw) to affect helper to flow will be
needed once the automatic helper affectation will be disabled by
default.

> As you can tell I'm far from an expert, but since the CT line wouldnt
> take with IPv6, I am assuming it is not critical to its functioning
> (bless I hit a IPv6 bug)

CT target is working with IPv6. The same change will needs to be made.

BR,


> Thanks
>=20
>=20
>=20
>=20
>=20
>=20
> On 8/31/13, Eric Leblond <eric@regit.org> wrote:
> > Hello,
> >
> > Le samedi 31 ao=FBt 2013 =E0 16:09 +1000, Nick Edwards a =E9crit :
> >> Hi,
> >>  This message is now appearing on some of our servers..
> >> google is full of much info, and confusion.
> >
> > This is linked with the document that can be found here:
> >  https://home.regit.org/netfilter-en/secure-use-of-helpers/
> >
> > Don't hesitate to command this document if you find some part needs
> > explanation.
> >
> > The change in automatic helper assignment is motivated by an attack
> > found on helper and implemented in the tool named opensvp:
> >
> > https://home.regit.org/2012/06/opensvp-a-new-tool-to-analyse-the-securi=
ty-of-firewalls-using-algs/
> >
> >> I understand it to be
> >> iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
> >> becomes
> >> iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
> >>
> >> with new rules to add being
> >> -A FORWARD -m conntrack --ctstate RELATED -m helper --helper ftp -p
> >> tcp --dport 21 -j ACCEPT
> >
> > This change you have just described is a security improvement. By the
> > way, it should not work. The last rule you wrote states that packets
> > RELATED to a connection, going to port 21 and linked with the FTP helpe=
r
> > have to be accepted. This is not what you want as port 21 is the
> > original connection.
> >
> > A correct rule will be something like
> > iptables -A FORWARD -m conntrack --ctstate RELATED -m helper \\
> >        --helper ftp -p tcp \\
> >        --dport 1024: -j ACCEPT
> >
> > You accept all packets RELATED to an ftp connection on port > 1024. If
> > you know where the FTP connection took place, you can add more filter t=
o
> > discriminate the flow.
> >
> >> then some sites talk about
> >>  -A PREROUTING -t raw -p tcp --dport 21 -j CT --helper ftp
> >
> > Here, you say: traffic to port 21 IS FTP. This will mimic the current
> > behavior of helper (automatic assignement) and this only rule (without
> > the previously mentioned change) will allow you to support the future
> > change to non automatic assignment (assuming you only need the ftp
> > helper on your system).
> >
> >>
> >> So, does removal of ESTABLISHED on original rules, now mean we need
> >> one of, of both of, these new rules?
> >>
> >> I tried on our IRC server, but it balked with ip6tables  at xt_CT: No
> >> such helper "irc"
> >> same command with iptables seemed to take..
> >>
> >> What is the correct way to replace this ESTABLISED since nf_conntrack
> >> will soon be removed
> >
> > No removal of nf_conntrack is planned. The only change planned is the
> > removal of automatic assignement ie 21->ftp helper is used.
> >
> >>
> >> Are they even needed anymore?  (I think irc helper is only needed for =
dcc
> >> etc)
> >>  is FTP still  needed for ftp?
> >
> > As mentioned before NO change on helper logic. They are still needed to
> > handle protocol with dynamic connection opening.
> >
> > BR,
> > --
> > Eric
> >


--=-BQyOEL//UuJX6bZvn5GS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iD8DBQBSI6NxnxA7CdMWjzIRArDLAJ4pGmgO8foRoRpZnVxB+btE0k+jlQCgkq9g
yg3T8jy12y6MDNy+ElITRdY=
=ZKId
-----END PGP SIGNATURE-----

--=-BQyOEL//UuJX6bZvn5GS--

