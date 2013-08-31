From: Eric Leblond <eric@regit.org>
Subject: Re: automatic helper assignment is deprecated and it will be
 removed soon
Date: Sat, 31 Aug 2013 14:36:22 +0200
Message-ID: <1377952582.3513.45.camel@ice-age.regit.org>
References: <CAMD-=V+QAVw23X9eSAuzF4nz0kH0+vw0Om46+ofr0EGMVW6PNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-2W/wVysbRZZ4Ol8S4tyy"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMD-=V+QAVw23X9eSAuzF4nz0kH0+vw0Om46+ofr0EGMVW6PNA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Nick Edwards <nick.z.edwards@gmail.com>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>


--=-2W/wVysbRZZ4Ol8S4tyy
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

Le samedi 31 ao=FBt 2013 =E0 16:09 +1000, Nick Edwards a =E9crit :
> Hi,
>  This message is now appearing on some of our servers..
> google is full of much info, and confusion.

This is linked with the document that can be found here:
 https://home.regit.org/netfilter-en/secure-use-of-helpers/

Don't hesitate to command this document if you find some part needs
explanation.

The change in automatic helper assignment is motivated by an attack
found on helper and implemented in the tool named opensvp:

https://home.regit.org/2012/06/opensvp-a-new-tool-to-analyse-the-security-o=
f-firewalls-using-algs/

> I understand it to be
> iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
> becomes
> iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
>=20
> with new rules to add being
> -A FORWARD -m conntrack --ctstate RELATED -m helper --helper ftp -p
> tcp --dport 21 -j ACCEPT

This change you have just described is a security improvement. By the
way, it should not work. The last rule you wrote states that packets
RELATED to a connection, going to port 21 and linked with the FTP helper
have to be accepted. This is not what you want as port 21 is the
original connection.

A correct rule will be something like
iptables -A FORWARD -m conntrack --ctstate RELATED -m helper \\
       --helper ftp -p tcp \\
       --dport 1024: -j ACCEPT

You accept all packets RELATED to an ftp connection on port > 1024. If
you know where the FTP connection took place, you can add more filter to
discriminate the flow.

> then some sites talk about
>  -A PREROUTING -t raw -p tcp --dport 21 -j CT --helper ftp

Here, you say: traffic to port 21 IS FTP. This will mimic the current
behavior of helper (automatic assignement) and this only rule (without
the previously mentioned change) will allow you to support the future
change to non automatic assignment (assuming you only need the ftp
helper on your system).=20

>=20
> So, does removal of ESTABLISHED on original rules, now mean we need
> one of, of both of, these new rules?
>=20
> I tried on our IRC server, but it balked with ip6tables  at xt_CT: No
> such helper "irc"
> same command with iptables seemed to take..
>=20
> What is the correct way to replace this ESTABLISED since nf_conntrack
> will soon be removed

No removal of nf_conntrack is planned. The only change planned is the
removal of automatic assignement ie 21->ftp helper is used.

>=20
> Are they even needed anymore?  (I think irc helper is only needed for dcc=
 etc)
>  is FTP still  needed for ftp?

As mentioned before NO change on helper logic. They are still needed to
handle protocol with dynamic connection opening.

BR,
--
Eric

--=-2W/wVysbRZZ4Ol8S4tyy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iD8DBQBSIeNGnxA7CdMWjzIRAsBEAJ4iC9wyRHCCNpaMugzd8VLki3tcVACff2e4
OcAF5swykamT4iqScu3VYVc=
=ksGq
-----END PGP SIGNATURE-----

--=-2W/wVysbRZZ4Ol8S4tyy--

