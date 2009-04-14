From: Linus =?iso-8859-1?Q?L=FCssing?= <linus.luessing@web.de>
Subject: How to block DHCPv4/v6, ARP, RADVD with ebtables/iptables on
	bridge?
Date: Tue, 14 Apr 2009 22:50:07 +0200
Message-ID: <20090414205007.GA5663@Linus-Debian>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm having the following setup here on every router with OpenWRT.

- A bridge br-mesh over the interfaces bat0, eth0.4 and ath0. bat0
  is the virtual mesh-interface which connects every router with
another using the routing daemon/protocol batman-adv, which means,
that virtually every router's bat0 is directly connected to the
others. eth0.4 is a vlan over two LAN-Ports on every router, ath0
is a wlan-interface in ap-mode.

- Every router is running radvd and a DHCPv4-daemon.

My goal now is, to have local IPv4-addresses on every router,
therefore I want to block all ARP-packages and DHCPv4-traffic over
the bat0 interface. As every router is announcing the same IPv6
unique local prefix, I also want to get rid of the
radvd-announcements over bat0 to save traffic created by
multicasts/broadcasts. Also the announcing of "evil" IPv6 default
gateways shall be reduced this way. So finally I would also like
to block DHCPv6-servers over bat0.

So far I've found out the following rules for ebtables to block
DHCPv4+ARP (would be nice, if someone could confirm that they
would work the way I want to).

----------------
#Block DHCPv4 over the Mesh-network
ebtables -A INPUT --in-interface bat0 --protocol IPv4
--ip-protocol udp --ip-source-port 68 -j DROP
ebtables -A INPUT --in-interface bat0 --protocol IPv4
--ip-protocol udp --ip-destination-port 67 -j DROP
ebtables -A FORWARD --in-interface bat0 --protocol IPv4
--ip-protocol udp --ip-destination-port 67 -j DROP
ebtables -A FORWARD --in-interface ath0 --out-interface bat0
--protocol IPv4 --ip-protocol udp --ip-source-port 68 -j DROP
ebtables -A FORWARD --in-interface eth0.4 --out-interface bat0
--protocol IPv4 --ip-protocol udp --ip-source-port 68 -j DROP

#Block ARP over the Mesh-network
ebtables -A INPUT --in-interface bat0 --protocol ARP -j DROP
ebtables -A FORWARD --in-interface bat0 --protocol ARP -j DROP
ebtables -A FORWARD --in-interface ath0 --out-interface bat0
--protocol ARP -j DROP
ebtables -A FORWARD --in-interface eth0.4 --out-interface bat0
--protocol ARP -j DROP
----------------

So now I'm having more trouble to find the right rules to block
DHCPv6 and radvd over bat0. Thanks for the help in advance.

PS: I'm aware of the fact, that people can make a manuel
arp-entries and that IPv4-traffic is (therefore) not blocked
entirely. But this is not a problem, in fact it's intended like
this.


--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQIcBAEBAgAGBQJJ5Pb/AAoJEBKw7u43QNpft9MQAILhxp6YSENBZd6nZTnKRi0Y
QdiplPzU+F8QgCsVhUJBkHZu0ZaLJb0UsOvr2ZoHm2rhNQWNcCPIVR7dluV3wiQs
l+EJ1vJrpaBh9nzAPEbmiYVi0d1ZduM8SlCmiqnNjLCNyEnudO5wz5l8zLhfynyz
vWFk46wmQhsS0N7qm+Hw6G5HmyCohFDWzgqez5Y72IuqWop3tWEUrGuzVvXeFNy9
iY3xdHEAv20S8zCNMUuxcWm6ipzeE+bcQUXLqPO2YPPIDRYUw5xO/JG8OWlDbPYZ
fifAMk8ZvpAv8cT4ZFflRglzf7Uw2FZsWK1trJSMdr5BWGPCzFfpbBh4Um2PRpIJ
N8EbdaLzvLZnaOeBLGF5nPf6q87bmC2yKwJ3X3oRkEs//bBYhBl8i3cc4SCiDXWm
2woxzS2+Tl5lnXI2NmCP9JtwZCgtsp322llAQWrGl6na5Fic0oXc+JOH7MjVEmQW
cQnnwhLyC5Qr7Y+3ZaA72K5a2sNlyzql3OHCZrFo7nq31oPr0nnEt80l32rrneCS
5/HRKRtZd6Vl+CjY/YP0zN4N4QhOShoVNvFRtWe3HMBjGFoWqenibauoMPrTeLGQ
MumE5pSHsnsRS0KaABB3DWikQPeoJnzb0nddK7NQUnQJkTTNq8MXqO0xOJi0BkIv
LLkFw9Xy50+0M4EUHfDr
=xxxc
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
