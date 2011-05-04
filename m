From: Eric Leblond <eric@regit.org>
Subject: Re: Only the "first" netfilter_queue process receives the packets?
Date: Thu, 05 May 2011 01:27:25 +0200
Message-ID: <1304551649.15943.8.camel@ice-age.regit.org>
References: <D5367974-2E4B-49C5-A4DF-738F0A05673E@nrl.navy.mil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-1vQaV6JduQNBIWS3z8FF"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D5367974-2E4B-49C5-A4DF-738F0A05673E@nrl.navy.mil>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: brian.adamson@nrl.navy.mil
Cc: netfilter@vger.kernel.org


--=-1vQaV6JduQNBIWS3z8FF
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mercredi 04 mai 2011 =E0 16:13 -0400, brian.adamson@nrl.navy.mil a
=E9crit :
> Hello,
>=20
> I have created an app that is now using netfilter_queue to get packets fr=
om iptables (the app used ipqueue previously).
>=20
> The first instance of the app installs an OUTPUT chain rule like:
>=20
> target		prot	opt	source			destination
> NFQUEUE	all	--	anywhere	BASE-ADDRESS.MCAST.NET/4 NFQUEUE num 1
>=20
> and it receives the packets fine and sets an NF_ACCEPT verdict and the pa=
ckets go merrily along their way ...
>=20
> BUT, when I launch a second instance of the app which installs the same r=
ule but with a _different_ --queue-num,:
>=20
> arget		prot	opt	source			destination
> NFQUEUE	all	--	anywhere	BASE-ADDRESS.MCAST.NET/4 NFQUEUE num 2
>=20
> The second instance doesn't see any packets _until_ the first instance of=
 the app exits.
>=20
> However, if I set up each app to filter for a different set of destinatio=
n addresses, then each instance does receive its exclusive matching packet =
sets.
>=20
> Is this just a limitation of how iptables works or is there something add=
itional I need to do so that two different process can each get the same pa=
ckets?

This is the way it should work: when a verdict is issued by userspace
the packet is accepted or dropped and leave the current chain (INPUT in
your case).

If you want to chain the packet, you've got to explicitely tell
Netfilter during the verdict.
to be precise: the verdict is a 32bit integer. The first 16 bit are used
for the verdict and the 16 remaining to indicate on which queue number
to reroute the packet.

If you want to route from 1 to 2 you have to do:
	next_queue =3D 2 << 16;
	verdict =3D ((uint32_t) NF_QUEUE) | nfq_config.next_queue;
	ret =3D nfq_set_verdict2(t->qh, p->nfq_v.id, verdict ...

This system is implemented in the IDS/IPS suricata. You can have a look
at the source-nfq.c file. The variable to look for is next_queue:
https://redmine.openinfosecfoundation.org/projects/suricata/repository/entr=
y/src/source-nfq.c?rev=3Dmaster#L215

BR,
--
Eric Leblond <eric@regit.org>


--=-1vQaV6JduQNBIWS3z8FF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iD8DBQBNweDdnxA7CdMWjzIRAl3mAJ4o43i0PXrGMdRA/US9TZUOXMAgcwCfYpC2
uLXiObIuTG90q4ccmvoH6FU=
=KLkg
-----END PGP SIGNATURE-----

--=-1vQaV6JduQNBIWS3z8FF--

