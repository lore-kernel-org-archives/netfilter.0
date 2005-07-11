From: Harald Welte <laforge@netfilter.org>
Subject: Re: dhcrelay still responds dropped inbound offer packets from
	iptables
Date: Mon, 11 Jul 2005 09:32:47 +0200
Message-ID: <20050711073247.GD15121@sunbeam.de.gnumonks.org>
References: <673fb82305070814186036ce2f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <673fb82305070814186036ce2f@mail.gmail.com>
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
To: Willy Chang <changwilly@gmail.com>
Cc: netfilter@lists.netfilter.org


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2005 at 05:18:33PM -0400, Willy Chang wrote:
> Folks,
>=20
>      I am running a dhrelay service and using iptables to be a
> firewall to block packets from dhcp server on the inbound side, eth0,
> of my Liunx. The reason to do this is to avoid generating duplicated
> packets from my machine to dhcp client on the same subnet.
>      For some reasons, I am unable to block these packets. I have a
> simple rule setting below to simply block all incoming UDP packets
> where it should block dhcp package as well.

iptables works in the IP stack.  Applications using PACKET sockets don't
use the IP stack and therefore are not affected by iptables.

My guess is that dhrelay uses PACKET sockets.

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC0iCfXaXGVTD0i/8RAiQOAKCVYf1UbmgNPMBCmLlFXZPnOAkN8QCdFStx
7CdO2nLPfXSmBku23HpGGps=
=N93M
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--

