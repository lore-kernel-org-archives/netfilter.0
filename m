From: Alexis <alexis@attla.net.ar>
Subject: Re: Windows Broadcast
Date: Mon, 01 Mar 2004 11:26:53 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078151213.1702.56.camel@pepelui.baicom>
References: <200403011612.26193.eric@regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403011612.26193.eric@regit.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="macroman"
To: Eric Leblond <eric@regit.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

i think that a good aproach could be to use an internal dns in order to
resolve the name and then you could use netbios over tcp to get routed
to the other lan.


A broadcast will not pass the router.

On Mon, 2004-03-01 at 11:12, Eric Leblond wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> >As a broadcast packet is a packet internal to a network, it don't have
> >to go through a router, so it will go on INPUT chain.
>=20
> If I have two networks with windows machines without wins server, what I =
can=20
> do with iptables to permit broadcats packets for netbios name resolve.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (FreeBSD)
>=20
> iQEVAwUBQENEx+Xb9tKkwh23AQJ86QgAlQ8OV0J3nhKeC+O8fMArDmnR4qAlCoPa
> ZkQ4d4Ly0uyUcBFu+4ZjqHW4SijXgzFhQcD2gdTdWF9fqo9udS+pa5iPR9p8bkgR
> fhpWXQU5N+H7RO0IxV6GhPt84v8+J8BHwS1MgdslVXGdFgkPSjZlQ7QSEHcgYJHQ
> 2UMNuDtBJaHJncXO17zE7++MQnUfExak3PwaTkIYk0sSkKL+nqA2W+8qDYN/5K1A
> VumPUgKRuuX2OQJeD8XGlqy8ltLG99ztSPgyCVhJjUGf8Vmqe9q6lle65tPuWPtK
> aULvEVguHQstJ9WIjV9VBtPXj6vV+ScG7pniq/NRyS4d4vpOMsYAtA=3D=3D
> =3DrHkP
> -----END PGP SIGNATURE-----
--=20
Tus problemas no se pueden resolver en el mismo
nivel mental que ten=C3=ADas cuando los creaste.=20
		Albert Einstein


