From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: vpn between networks with private ip network segment conflicts
Date: 27 May 2003 18:30:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054053025.13730.95.camel@raylinux.internal>
References: <1054051400.1836.56.camel@lo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZKwW7WoSEwRIkdGGNa7D"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054051400.1836.56.camel@lo>
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


--=-ZKwW7WoSEwRIkdGGNa7D
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-05-27 at 18:03, Drew Einhorn wrote:
> My LAN uses network segments 192.168.0.0/24, 192.168.1.0/24, etc.
> So does the remote network I need to vpn to (probably using some flavor
> of pptp).
>=20
> Is there an odd nat variant that will solve this problem.
> Probably need to do some kind of dns transformation on each side.
>=20
> Is there any easy solution.  Perhaps it would be easier (but not easy)
> to get the network segments renumbered on one end or the other.

Oooo ... I would go with the second option. Get one end renumbered.



--=-ZKwW7WoSEwRIkdGGNa7D
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+05Khh1fuR/Bv+ygRAmHEAJ9afrPV2/EV1S1NDAydZBHEN2peQACdH565
EwLCL4+xmrbMLItn80xb0zs=
=xN+p
-----END PGP SIGNATURE-----

--=-ZKwW7WoSEwRIkdGGNa7D--


