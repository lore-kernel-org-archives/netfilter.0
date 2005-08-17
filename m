From: Alexander Samad <alex@samad.com.au>
Subject: Re: Multirouting 2 ISP with public addresses
Date: Wed, 17 Aug 2005 13:19:45 +1000
Message-ID: <20050817031945.GK20254@samad.com.au>
References: <eb5ae9cc05081611187210c11b@mail.gmail.com>
	<eb5ae9cc0508161122447fc95c@mail.gmail.com>
	<65aa6af905081613295e39edf3@mail.gmail.com>
	<430269CD.6080700@andycable.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NqNl6FRZtoRUn5bW"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <430269CD.6080700@andycable.com>
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
To: Wayne Alday <waynea@andycable.com>
Cc: netfilter@lists.netfilter.org


--NqNl6FRZtoRUn5bW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2005 at 05:33:49PM -0500, Wayne Alday wrote:
> List :
>=20
> I have a similar setup to this gentleman:
>=20
> eth0 connected with the LAN
> eth1 connected with the internet across ISP1
> eth2 connected with the internet acorss ISP2
>=20
> Although I can find a thousand examples on how to do this with NAT,=20
> there doesnt seem to be anyone wanting to do it with real IP addresses,=
=20
> or not that I have found in 3 days of searching.
>=20
> I read the following link :
>=20
> http://lartc.org/howto/lartc.rpdb.multiple-links.html
>=20
> Seems to be just what I need, except I do not wish to load balance or=20
> have servers avaiable everywhere, or have redundancy, but just for the=20
> box to do what i guess would be called source routing. My delimma is=20
> that living in a remote town bandwidth costs are moderate to high. I=20
> have a 6 meg bonded T-1 setup on a cisco 3640 router that we outgrew=20
> quickly. A DS-3 connection where I live would of cost nearly 15K / month=
=20
> because we live near no POP.So we put some fiber up, and needless to say=
=20
> we have 10 / mbit with the capability to turn it up as needed at a much=
=20
> cheaper cost. The problem is we are having to eat the monthly charges=20
> for our current bandwith and would like to utilize it for CPE. Im pretty=
=20
> sure with the research I have done that this is possible to put on our=20
> current linux router, but  I must be  missing a key somewhere, and I=20
> would like a fresh look on the problem.
>=20
> Here is what I wish to do.
>=20
> eth1 is connected to my 6mbit line thru the FE0/0 port on the=20
> router.(192.168.200.2)
> eth2 is connected to the fiber transceiver to 10 mbit (192.168.252.2)
> eth0 is connected to my lan. (12.150.243.129)
>=20
> I have route statements in the 3640 that route ALL traffic for the=20
> public addresses thru a private subnet
> ip route 12.37.169.0 255.255.255.0 192.168.200.2
> ip route 12.150.225.0 255.255.255.0 192.168.200.2
> ip route 12.150.243.128 255.255.255.224 192.168.200.2
> ip route 12.150.243.160 255.255.255.240 192.168.200.2
> ip route 12.150.243.176 255.255.255.240 192.168.200.2
> ip route 12.150.243.192 255.255.255.192 192.168.200.2
> ip route 12.175.45.0 255.255.255.128 192.168.200.2
>=20
> The linux box in turn hands it off to various other parts and routers
>=20
> What I would like to do is throw the following 4 Class C addresses onto=
=20
> eth2 and have them route according to what network.
> 70.158.60.0
> 70.158.61.0
> 70.158.62.0
> 70.158.63.0

let me have a shot

# setup the rules
ip ru add from 192.168.252.2 pref 200 table fibre
ip ru add from 192.168.200.2 pref 201 table router

# setup default route for each interface
ip ro add table fibre default via 192.168.252.1 dev eth2 src 192.168.252.2
ip ro add table router default via 192.168.200.1 dev eth1 src 192.168.200.2


# You still need to setup the normal table (main)


# setup routing back for each interface
ip ro add table fibre 12.150.243.0/24 dev eth0 scope local
ip ro add table router 12.150.243.0/24 dev eth0 scope local

# setup cross routing just in case
ip ro add table fibre 192.168.200.0/24 dev eth1 src 192.168.252.2
ip ro add table router 192.168.252.0/24 dev eth2 src 192.168.200.2


# no setup natting
iptables -t nat -I POSTROUTING -o eth1  -j SNAT --to-source 192.168.200.2
iptables -t nat -I POSTROUTING -o eth2  -j SNAT --to-source 192.168.252.2
iptables -t nat -I POSTROUTING -i eth0 -d 70.158.63.0/24 -j SNAT --to-sourc=
e 192.168.252.2
iptables -t nat -I POSTROUTING -i eth0 -d 70.158.62.0/24 -j SNAT --to-sourc=
e 192.168.252.2
iptables -t nat -I POSTROUTING -i eth0 -d 70.158.61.0/24 -j SNAT --to-sourc=
e 192.168.252.2
iptables -t nat -I POSTROUTING -i eth0 -d 70.158.60.0/24 -j SNAT --to-sourc=
e 192.168.252.2

iptables -I FORWARD -i eth0 -j ACCEPT


That should do it


might have missed something, but this is about the guts of mine

> For instance if I assign a CPE an Ip address in the 12.150 range, i wish=
=20
> for all that traffic to route out eth1 to the wireline
> If I assign a CPE IP in the 70.158 ranges, I would like it to route out e=
th2
>=20
> The router on the other side of the fiber net has the exact same routes=
=20
> for the 70.158 ranges as the ones on my wireline with the exception
> they are routing to 192.168.252.2 instead of 192.168.200.2
>=20
> Ive seen suggestions on marking packets, setting up 2 routing tables,=20
> and others, but i have had limited success on getting this going.
>=20
> Could anyone provide some thoughts or input or an example? It would be=20
> greatly appreciated. If I havent been descriptive enough, will provide=20
> more details
>=20
> Thanks in advance
>=20
> --Wayne
>=20
>=20

--NqNl6FRZtoRUn5bW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDAqzQkZz88chpJ2MRAhqeAJsEsC3qpt3FQqLMieQzw0S8vwc0pQCcCtOF
sjFinl+c/ih/cWXte6wS7bk=
=Baj9
-----END PGP SIGNATURE-----

--NqNl6FRZtoRUn5bW--

