From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: pop3 and dns
Date: Tue, 04 May 2004 11:40:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083663647.1481.59.camel@raylinux.internal>
References: <F22386C3FEB012449238672E38ED61E706C2D5@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZCCL9TJNWzB0kosmFkHu"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E706C2D5@overlord.overturemedia.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


--=-ZCCL9TJNWzB0kosmFkHu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-05-04 at 11:40, Fritz Mesedilla wrote:
> Greetings!
> I have been looking for the answer to this through google...
>=20
> How do I allow POP3 through my iptables rules?
>=20
> I have done this...
> $IPTABLES -A FORWARD -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A FORWARD -p udp --dport 53 -j ACCEPT
>=20
> $IPTABLES -A FORWARD -p tcp --dport 110 -j ACCEPT
>=20
> I included the dns forward rule to allow the internal clients to be able =
to resolve pop3 domain names.=20
>=20
> The problems:
> 1) They still can't resolve domain names.
> 2) POP3 can't seem to pass through going outside from the internal client=
s.
>=20
> Please advise me to what I still need to add. Thanks.
>=20

=46rom what you show above, it's difficult to say. Are you using nat and
private ips on the inside? Are you just forwarding all traffic via your
iptables router and all your clients have public ips? Are you using
private ips on the inside and doing nat at the router?


> Cheers,
>=20
> fritz <www.mesedilla.com>
> ---
> + Basta Ikaw Lord
>=20
>=20
>=20
> ----------------------------------------------------------------------
> This email and any files transmitted with it are confidential and
> intended solely for the use of the individual or entity to whom they
> are addressed. If you have received this email in error please notify
> the sender immediately by e-mail and delete this e-mail from your
> system. Please note that any views or opinions presented in this
> email are solely those of the author and do not necessarily represent
> those of the company. Finally, the recipient should check this email
> and any attachments for the presence of viruses. The company accepts
> no liability for any damage caused by any virus transmitted by this
> email.=20
>=20
> Overture Media, Inc.
> Direct Line: (632) 635-4785
> Trunkline:   (632) 631-8971 Local 146
> Fax: (632) 637-2206
> Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave., =
Quezon City 1100
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-ZCCL9TJNWzB0kosmFkHu
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAl2Ufh1fuR/Bv+ygRAtfoAJwOFxvYOzNXblOlu68ekA4jrqwZawCfZdix
fRs34KIUZiG1LCHARIKviww=
=PUV9
-----END PGP SIGNATURE-----

--=-ZCCL9TJNWzB0kosmFkHu--


