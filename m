From: Patrick Selder <pselder@xs4all.nl>
Subject: IPsec forwarding problem
Date: 21 Nov 2003 13:07:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069416428.13950.80.camel@shadow.internal.client.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-fit/nsCxaBUy1Igsgi+y"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-fit/nsCxaBUy1Igsgi+y
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I have a special situation with forwarding ipsec packets to an internal
networkcard.

Let me explain the situation.
The firewall has three networkcards.
eth0 =3D internal lan (192.168.x.x)
eth1 =3D external internet (213.x.x.x)
eth2 =3D internal lan tbv special ipsec box (10.x.x.x external and
192.168.x.x internal)

               /---- eth0 --------------------\
--- eth1 -----/                                \----- 192.168.x.x
              \                                /
               \---- eth2 ----- ipsec box ----/

The black box provided by an external supplier is setup to build a vpn
with them. I cannot change the config. The box is preconfigured. The
subnet that has to be routed to the external supplier is 172.16.2.x

The firewall had a route that this subnet is routed to the ip on the
internal eth0 interface ip.

The irony is that I had this working but wanted to tighten the security
and didn't save the working rule set.

I want that packets that arrive on eth1 from the external supplier to be
forwarded to the eth2 interface. This works already for udp port 500. I
get the following to verify this: "isakmp: phase 2/others R
oakley-quick[E]: [encrypted hash] (DF)"
IPsec packets that come from eth2 are routed to the external eth1
interface. Only they have the 10.x.x.x ip as their source ip and I want
it to be the external ip or else the routing goes wrong.

The firewall itself also runs IPsec for a VPN. So filtering from which
ip that IPsec packets are comming and have to be forwarded is a must.
I'm using only ESP and no AH btw.

I tried several pass-through examples from various sites, but these
don't seems to work.

It comes down to:
- Forward IPsec packets to eth2
- Route packets from eth2 out to eth1 with correct source ip.

Hope someone got an answer...

Patrick
--=20

--=-fit/nsCxaBUy1Igsgi+y
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/vf/s+uGF893IDpARAsYuAJ9/x1AaQ3HmuPPQ2QpEBgq/zl8Y8gCgy4bT
4wN4FBNJmdWLKaRbSZ4X4dA=
=o+7e
-----END PGP SIGNATURE-----

--=-fit/nsCxaBUy1Igsgi+y--


