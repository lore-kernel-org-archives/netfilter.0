From: Alexander Samad <alex@samad.com.au>
Subject: Re: Problem with ipconntrack+snat and changing routes
Date: Fri, 4 Nov 2005 13:38:56 +1100
Message-ID: <20051104023856.GB11296@samad.com.au>
References: <436A926C.8080803@imagestream.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <436A926C.8080803@imagestream.com>
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
To: Joshua Snyder <josh@imagestream.com>
Cc: netfilter@lists.netfilter.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2005 at 05:42:52PM -0500, Joshua Snyder wrote:
> I have ran into this more than once and I just wanted to know if anyone=
=20
> else has ever seen this; I know everything I am talking about it valid=20
> for 2.4 kernels.  I don't think this is different in 2.6 but it might be.
>=20
> What seems to be going on is the following.  Say we have a machine with=
=20
> two connections to the Internet and we are doing Nat on both of the=20
> external interfaces.  Something like...
>=20
>                                          Eth2
>                    Eth0  *-----------*--------> Cable 12.23.32.15
> Internal network --------| Linux box |
>  192.168.0.0/24          *-----------*--------> Dsl 34.36.23.89
>                                          Eth1
>=20
> Then we setup some Source Nat like...
>=20
> # Snat for Cable
> iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to 12.23.32.15
> # Snat for Dsl
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 34.36.23.89
>=20
> This works just fine... now here is where things start breaking.  If you=
=20
> use routing tables to statically put traffic onto one or the other=20
> external links things work as you would expect.  But you try to do route=
=20
> load balancing or you change which link your transmitting packets on you=
=20
> can end-up with very odd results.
>=20
> So, if we do this to load balance traffic...
>=20
> ip route add default scope global \
> 	nexthop via 12.23.32.1 dev eth2 weight 1 \
> 	nexthop via 34.36.23.1 dev eth1 weight 1

Hi

I have this setup and don;t experience the problem you have outline, I
think because you are missing a bit of the puzzle, you also have to
setup ip rules as well in your case something like

ip ru add from 12.23.32.15 lookup 200
ip ru add from 34.36.23.89 lookup 201

and then placing routing info in those route tables for each specific
link for example for the cable

ip route add defalt via 12.23.32.1 dev eth 2 tab 200

The issue is that conntrack should keep a record of the open connection
and will presumably do the SNAT'ing before it hits the SNAT entries in
the nat table as it is an already open connection.

The rules above state that if the packet has a src address of
12.23.32.15 only use the route table 200 which only routes out the cable
modem.

For normal ip asymetrical routing would not be a problem, but most ISP
block these packets, so in your example below the packet is still going
out but with the cable modem address but out the adsl network and being
blocked by the adsl ISP.


Alex

>=20
> Now we are doing route based load balancing.  And everything will work=20
> fine until the route cache for a tracked connection expires.  For=20
> instance if you ssh into a machine but you go idle for an hour or so...=
=20
> Then what happens is the following, the Linux box will do a new route=20
> lookup if the new route lookup matches what you had before everything=20
> will still work fine.  But if the machine picks the other interface as=20
> the new route, packets will get sent out on the wrong interface still=20
> snated with the ip address of the other interface.
>=20
> For example what you see is this... In the example above if you had a=20
> connection that was originally using eth2 so it was getting nated to=20
> 12.23.32.15.  But if later on the route changes so your now going out=20
> eth1 you will still be transmitting packets with the Ip address of=20
> 12.23.32.15 on your DSL link which has an ip address of 34.36.23.89.=20
> Most of the time this traffic will be dropped by your Isp.
>=20
> Now, I understand that you can't just start sending packets for this=20
> connection with a new ip address.  But it doesn't sound like we should=20
> be sending these packets down the wrong interface.  I am not sure what=20
> the best thing to do in this case is... The above example is just one of=
=20
> a few ways you can see this problem(manually changing routing and=20
> Ospf/Bgp for example).  The worst case is if you have a routing change=20
> but your conntrack doesn't expire and routing doesn't change again after=
=20
> the first time... the only way to get stuff to work again is to unload=20
> ip_conntrack from the kernel.  I have ran into these issues a few times=
=20
> now and I was just wondering if anyone else has seen this or how SNAT=20
> should handle these cases.
>=20
> 			Josh
>=20
>=20

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDasnAkZz88chpJ2MRAg83AKCNsE/z/2n3C9YmK5tjIl25HuZVYwCg335Y
fBPx3fsDw3vPG4Cmkip8ql0=
=fXE8
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--

