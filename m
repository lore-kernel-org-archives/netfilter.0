From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: How to change a packet's arriving interface? -j ROUTE?
Date: 10 Dec 2002 07:23:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039497787.1713.34.camel@rayw.knowledgefactory.co.za>
References: <3DF0D338.C2F4E50@Gallantry.com>
	 <1039411928.1714.3.camel@rayw.knowledgefactory.co.za>
	 <3DF54425.6CDB2FF4@Gallantry.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-4KObRIX4kaI+uD1i2pFG"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF54425.6CDB2FF4@Gallantry.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jason Liao <maillist@Gallantry.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-4KObRIX4kaI+uD1i2pFG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2002-12-10 at 03:32, Jason Liao wrote:
> Hi Ray,
>=20
> Thank you for your reply, but maybe I was not clear in the original
> post:  The destination of the incoming traffic is the firewall machine
> itself, just the destination IP address is of the DMZ interface. =20
Does that mean that the traffic is :-
a) coming in via the DMZ with a destination of the DMZ interface=20
	or=20
b) that the traffic is coming in via another interface (e.g. the
internal interface) with a destination of the DMZ interface.

In the case of a) there is :- INPUT, (maybe PREROUTING).
In the case of b) there is :- (maybe PREROUTING), INPUT, FORWARD, (maybe
POSTROUTING).
> For
> this reason, the FORWARD rule won't be checked because it is basically
> INPUT traffic.  Another issue is that the traffic is IPSec so that any
> change to the source address (SNAT) will break the IPSec authentication.
>=20
Then this basically leaves you with either tunneling (isn't that what
IPSec is?) or pure routing (FORWARDing).

> Thanks again for your suggestions.
>=20
> Best regards,
>=20
> Jason Liao
>=20
> Raymond Leach wrote:
> >=20
> > Hi
> >=20
> > Use SNAT on the POSTROUTING chain in the NAT table.
> >=20
> > iptables -t nat -A POSTROUTING -d $NET_DMZ -j SNAT --to-source
> > $IP_DMZ_IFACE
> >=20
> > also you would need a FORWARD rule to route the initial traffic:
> > iptables -A FORWARD -d $NET_DMZ -j ACCEPT
> >=20
> > These are the least restrictive examples of possible rules. The above
> > assumes you have public ips in your DMZ.
> >=20
> > Ray
> >=20
> > On Fri, 2002-12-06 at 18:41, Jason Liao wrote:
> > > Hi,
> > >
> > > I have a firewall running iptables with 3 interfaces: LAN, WAN and DM=
Z.
> > > The LAN IP address is 10.0.0.1/24, WAN 66.134.34.157/28, and DMZ
> > > 66.134.34.249/28.  The WAN interface connects to the Internet and the
> > > DMZ interface connects to a stub network.
> > >
> > > When someone sends a packet to the IP address of the DMZ interface fr=
om
> > > the Internet, the packet x.x.x.x->66.134.34.249 arrives at the WAN
> > > interface.  I want to know if there is a way using iptables (maybe wi=
th
> > > other tools such as iproute2) to make this packet to appear as if it
> > > arrives at the DMZ interface.  The packet itself should not be
> > > modified.  I need this to work because I am running an IPSec VPN with
> > > FreeS/WAN on the DMZ interface.  When the ESP packets arrives on the =
WAN
> > > interface, they cannot be properly processed by IPSec because the ips=
ec0
> > > interface is tied to the DMZ interface directly.
> > >
> > > I looked at the mangle table but could not figure out if it is the ri=
ght
> > > direction.  I read about the ROUTE target but do not know if this tar=
get
> > > is for diverting packets to be sent OUT on another interface, or can =
it
> > > be used to change a packet's arriving interface.
> > >
> > > Thanks in advance.
> > >
> > > Jason Liao
> > --

--=-4KObRIX4kaI+uD1i2pFG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA99Xo6h1fuR/Bv+ygRAkQxAJ49Vjxv7bWTHQA9I448HFfGKrIYCACbB7GK
6X1wm/sSGmteiU4C0dJ3ZHA=
=Mty5
-----END PGP SIGNATURE-----

--=-4KObRIX4kaI+uD1i2pFG--


