From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: vpn between networks with private ip network segment conflicts
Date: 28 May 2003 08:37:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054103867.13296.103.camel@raylinux.internal>
References: <1054051400.1836.56.camel@lo>
	 <1054053025.13730.95.camel@raylinux.internal> <1054056892.1837.85.camel@lo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-BI7tTJ2o6uc8xlS8kWpJ"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054056892.1837.85.camel@lo>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Drew Einhorn <drew.einhorn@starband.net>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-BI7tTJ2o6uc8xlS8kWpJ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-05-27 at 19:34, Drew Einhorn wrote:
> Oooo ... I was afraid that was going to be the answer.
>=20
> I'll wait a bit and see if someone has a better idea before starting
> in on renumbering a network.
>=20
> On Tue, 2003-05-27 at 10:30, Ray Leach wrote:
> > On Tue, 2003-05-27 at 18:03, Drew Einhorn wrote:
> > > My LAN uses network segments 192.168.0.0/24, 192.168.1.0/24, etc.
> > > So does the remote network I need to vpn to (probably using some flav=
or
> > > of pptp).
> > >=20
> > > Is there an odd nat variant that will solve this problem.
> > > Probably need to do some kind of dns transformation on each side.
> > >=20
> > > Is there any easy solution.  Perhaps it would be easier (but not easy=
)
> > > to get the network segments renumbered on one end or the other.
> >=20
> > Oooo ... I would go with the second option. Get one end renumbered.

Yes.

I had another thought (those are rare for me)

What if you created a network between the two networks. Like this:

Net1 <-> VPN (CIPE) <-> New NET <-> VPN (CIPE) <-> Net2

Then your routing would be to the new network.

Maybe use some kind of NAT rules to map the new net back to the dest
net. For example:

Net1.host1 (192.168.0.1) wants to connect to net2.host1 (192.168.0.1)
He actually connects to 10.0.0.1 and the VPN/Router1 does a SNAT to its
IP.
VPN/Router2 does a DNAT for the traffic from 10.0.0.1 back to
192.168.0.1

VPN/Router1 has to have a route for 10.0.0.1 pointing to VPN/Router2

Do the same on the other side.

I was thinking of something along the lines of the P-O-M 1:1 NAT patch.

Does this make sense, and might it work?

Ray


--=-BI7tTJ2o6uc8xlS8kWpJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+1Fk7h1fuR/Bv+ygRAu3sAJ9/gRIlVFKDXVVW3TqrMQqSPdRJoACfS0XC
OohoN92SkZAupI2N33vVmj4=
=7OZk
-----END PGP SIGNATURE-----

--=-BI7tTJ2o6uc8xlS8kWpJ--


