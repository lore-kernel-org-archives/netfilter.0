From: Christian Fassina Costa <atros@atros.org>
Subject: nat throught different gateways
Date: Mon, 25 Oct 2004 23:27:48 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098757668.4899.17.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-5rDf2BRLLljq17/0K4I0"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--=-5rDf2BRLLljq17/0K4I0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi ppl,

I have the following scenario:

A internal network 10.1.0.0/24
A gateway with 3 interfaces
eth0 adsl provided ip address
eth1 10.1.0.1 (internal network)
ppp0 192.168.0.234 (vpn to a foreign computer)
The host in the other end is doing NAT with iptables for all addresses.

What I'd like to do:

Since I have several computer in my LAN I'd like one of them to use ppp0
as output interface. I added a route to my internal network in the other
end of my vpn (route add -net 10.1.0.0/24 gw 192.168.0.234).=20
If I add a static route, for instance: route add -host www.google.com gw
192.168.0.1, it works fine.

I tried adding an iptables rule as it follows:
iptables -t nat -A POSTROUTING -s 10.1.0.0/24 -o ppp0 -j MASQUERADE

I can successfully ping 192.168.0.1 but I figured out that the NAT is
not working as I expected (traffic going out via ppp0).

I even tried setting up an alias for my eth1 with a different network
10.2.0.1

then I set up my computer with the address 10.1.0.2 with default gw
10.2.0.1.

If I use the following rule:

iptables -t nat -A POSTROUTING -s 0/0 -o eth0 -j MASQUERADE

it works fine for me and the other computers in the 10.1.0.0 network.

Then I tried
iptables -t nat -A POSTROUTING -s 10.1.0.0/24 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.2.0.0/24 -o ppp0 -j MASQUERADE


I worked fine for the 10.1.0.0 network but no for the 10.2.0.0 network.

Does anyone know how to solve this issue? I also read some ip route
documentation but did not find anything suitable to solve this problem.


Regards,

Christian


--=-5rDf2BRLLljq17/0K4I0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBfbYjIjrDWFm+WG8RAmFyAKC7WXohe08c0In0YYB00X9WIS3L2QCbBgkE
rYRh05rVN+BCTbyYSKsAMnU=
=bDyc
-----END PGP SIGNATURE-----

--=-5rDf2BRLLljq17/0K4I0--


