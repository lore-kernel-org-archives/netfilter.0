From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: RE: new iptables user - default options
Date: Tue, 28 Oct 2003 15:09:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067346561.25414.137.camel@raylinux.internal>
References: <FDB52A0429DFD31196FB0008C7D972D50EA578CB@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zC4bG9KgiitbZgOwpeji"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA578CB@OST_EXCH_USR5>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-zC4bG9KgiitbZgOwpeji
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-10-28 at 14:54, Knight, Steve wrote:
> Thanks Robert - I appreciate your response.
>=20
> I have to say I'd agree - it seems to be more of a belt and braces approa=
ch
> to use your suggestion, and more in the spirit of what we were told in
> checkpoint kindergarten ["deny everything unless explicitly asked" - also
> sounds a bit like being married].
>=20
> Are the rules in each chain processed top down?
>=20
Yes, and possibly why the default for deadbat is to create a user chain
- user chains are called from the default chains (or other user chains),
then the rules are checked, when a match is found or the end of the user
chain is reached, execution/parsing continues from where the user chain
was called. This is one method of setting up logging rules, and also
makes debugging a work-in-progress firewall setup easier.

> steve
>=20
>=20
>=20
>=20
>=20
>=20
> -----Original Message-----
> From: Robert P. J. Day [mailto:rpjday@mindspring.com]=20
> Sent: 28 October 2003 12.34
> To: Knight, Steve
> Cc: netfilter@lists.netfilter.org
> Subject: Re: new iptables user - default options
>=20
>=20
> On Tue, 28 Oct 2003, Knight, Steve wrote:
>=20
> > Hi there
> >=20
> > Rh9 has installed all the default filter policies as "accept" and then
> > forwards all packets from INPUT and FORWARD to a Lokkit chain.
> >=20
> > Is this normal?  It seems to me [as a iptables n00b, although I am
> > checkpoint certified] to be ok, as eventually the traffic is hitting th=
e
> > detailed lokkit chain, but is this the default install options that
> everyone
> > gets?
>=20
> it seems that it's just a philosophical difference.  you can set the
> DENY policy, then explicitly accept only what you want, or as RH did,
> accept everything only to pass it all to a user-defined chain that
> effectively does the same thing.
>=20
> personally, i'd rather see a DENY policy so that, if i somehow messed
> up some of my rules, i'm more likely to be *more* restrictive than
> less restrictive.  but RH's approach seems no worse, just different.
>=20
> rday
>=20
>=20
>=20
> .
>=20
>=20
> -----------------------------------------------------------------------
> Information in this email may be privileged, confidential and is=20
> intended exclusively for the addressee.  The views expressed may
> not be official policy, but the personal views of the originator.
> If you have received it in error, please notify the sender by return
> e-mail and delete it from your system.  You should not reproduce,=20
> distribute, store, retransmit, use or disclose its contents to anyone.
> =20
> Please note we reserve the right to monitor all e-mail
> communication through our internal and external networks.
> -----------------------------------------------------------------------
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-zC4bG9KgiitbZgOwpeji
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/nmqBh1fuR/Bv+ygRAkmoAJsHLaORxlIfuAV6HMPz5PCR0Gm//QCfeFIc
jmpZ8BFE0ZqVZDH/ajtOri0=
=X33x
-----END PGP SIGNATURE-----

--=-zC4bG9KgiitbZgOwpeji--


