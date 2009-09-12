From: Eddie <eddies@softhome.net>
Subject: Blocking DHCP with ebtables
Date: Sat, 12 Sep 2009 13:19:54 -0700
Message-ID: <4AAC026A.9000208@softhome.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=_jive-5700-1252786495-0001-2"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_jive-5700-1252786495-0001-2
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

I have a network bridging two offices using OpenVPN. I am running a DHCP =

server on both sides so if the tunnel goes down, both sides will still=20
have internet access. (Both sides run Slack/Shorewall/OpenVPN)

I have the obvious problem with stopping DHCP packets from crossing the=20
bridge. I use the below ebtables example, but something is wrong. Under=20
testing, it appeared to work, but I  under deployment, am seeing windows =

host on the main office side getting dual gateways, and/or the dns=20
server from the remote side. It's really strange stuff.

Here is the ebtables rules I use on the remote side only. I am not sure=20
if I need anything on the main side since I figure if this blocks all=20
dhcp traffic across the bridge, then all should be good.


# Clear ebtables
ebtables -F
ebtables -X

# Drop everything and build up Input and Output to accept IP and ARP
ebtables -P FORWARD DROP
ebtables -P INPUT DROP
ebtables -P OUTPUT DROP
ebtables -A INPUT -p IPv4 -j ACCEPT
ebtables -A INPUT -p ARP -j ACCEPT
ebtables -A INPUT --log-level info --log-ip --log-prefix EBFW
ebtables -A OUTPUT -p IPv4 -j ACCEPT
ebtables -A OUTPUT -p ARP -j ACCEPT
ebtables -A OUTPUT --log-level info --log-ip --log-arp --log-prefix EBFW =

-j DROP

#drop DHCP broadcast
ebtables -A FORWARD -d ff:ff:ff:ff:ff:ff/ff:ff:ff:ff:ff:ff -p IPv4=20
--ip-prot udp --ip-dport 67:68 --log-level info --log-ip --log-prefix=20
EBFWbc -j DROP
ebtables -A FORWARD -p ipv4 --ip-proto tcp --ip-destination-port 67:68=20
--log-level info --log-ip --log-prefix EBFWtcp -j DROP
ebtables -A FORWARD -p ipv4 --ip-proto udp --ip-destination-port 67:68=20
--log-level info --log-ip --log-prefix EBFWudp -j DROP


# Let the rest of the Packets through
ebtables -A FORWARD -p IPv4 -j ACCEPT
ebtables -A FORWARD -p ARP -j ACCEPT


But this is what I see in the logfile on the remote side..

Sep 12 19:05:09 firewall kernel: EBFWbc IN=3Dtap0 OUT=3Deth1 MAC source =3D=
=20
00:10:dc:e3:2e:64 MAC dest =3D ff:ff:ff:ff:ff:ff proto =3D 0x0800 IP=20
SRC=3D192.168.8.22 IP DST=3D255.255.255.255, IP tos=3D0x00, IP proto=3D17=
 SPT=3D68=20
DPT=3D67
Sep 12 19:05:09 firewall dhcpd: DHCPINFORM from 192.168.8.22 via br0
Sep 12 19:05:09 firewall dhcpd: DHCPACK to 192.168.8.22=20
(00:10:dc:e3:2e:64) via br0

Sep 12 19:14:37 firewall kernel: EBFWbc IN=3Dtap0 OUT=3Deth1 MAC source =3D=
=20
00:13:72:2b:37:47 MAC dest =3D ff:ff:ff:ff:ff:ff proto =3D 0x0800 IP=20
SRC=3D192.168.8.24 IP DST=3D255.255.255.255, IP tos=3D0x00, IP proto=3D17=
 SPT=3D68=20
DPT=3D67
Sep 12 19:14:37 firewall dhcpd: DHCPREQUEST for 192.168.8.60 from=20
00:13:72:2b:37:47 (ws02) via br0
Sep 12 19:14:37 firewall dhcpd: DHCPACK on 192.168.8.60 to=20
00:13:72:2b:37:47 (ws02) via br0

ebtables seems to want to block the packets, but dhcpd gets them anyway=20
and responds.  Note that on both sides of the connection have dhcpd=20
running on br0, on with different ranges. (both eth1 and tap0 are=20
bridged to br0)

So why are the packets not blocked from dhcpd? What am I missing?
Thanks for any help.





--=_jive-5700-1252786495-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with CentOS - http://enigmail.mozdev.org

iD8DBQFKrAJwtOewj3nLWsIRAu1PAJ4ue2X/QsQRM1CWJTopUH21CPcWEwCfQ3Qv
WIhcNGiwYyMUF1HHcPtGt0k=
=Cm3e
-----END PGP SIGNATURE-----

--=_jive-5700-1252786495-0001-2--
