From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: VPN Server behind a iptables FW (PPTP)
Date: 12 Mar 2003 17:25:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047482749.11446.57.camel@raylinux.internal>
References: <DBF92B7FA3E6C94A99B4AE5938A62B7E4023BC@excw2k01.bhlan.bhuman.it>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-GQNatVAa9s0yvbmH6SUA"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DBF92B7FA3E6C94A99B4AE5938A62B7E4023BC@excw2k01.bhlan.bhuman.it>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-GQNatVAa9s0yvbmH6SUA
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-03-12 at 17:06, Cassani Alexio wrote:
> Hi all,
> I've set up a linux box with iptables 1.2.7a + pptp patch.
> Then I've configured a VPN server win2k-based and if I try to connect to
> it using a client of my LAN I have no problem, obviously the problems
> are present when the vpn client is outside my network.
> The architecture is here reported:
>=20
>  VPN	     IPTables			 VPN
> Server ---  Server --- Internet --- Client
>=20
> VPN Server Internal IP:192.168.0.1
> VPN Server public IP (hosted by the firewall) is a global address.
> So IPTables server performs NAT.
How are you doinf NAT? Does the public ip get bound to an interface on
the iptables server, e.g. eth0:1?

I had to add INPUT rules like this:
$IPTABLES -A INPUT -i $IFACE_INET -p tcp --dport 1723 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -i $IFACE_INET -p 47 -d $IP_INET_WEB8 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
>=20
>=20
> Actions performed:
>=20
> - from VPN client (a win2k box) I can telnet my vpn server at the 1723
> port
> - from VPN client I've configured a VPN connection to my VPN server and
> the connection stops with the following error "721 remote computer is
> not responding" after hanging for a few seconds on the window "Verifying
> Username and Password"
>=20
> My opinion is that GRE packet are not routed by the linux box, so
> authentication fails.
We are using standard pptp for the tunnel ...

>=20
> The iptables script used to set up the fw includes the following lines
> regarding GRE protocol:
>=20
> $IPTABLES -t nat -A PREROUTING -p GRE -i $INET_IFACE -j DNAT
> --to-destination $LAN_VPNSERVER_IP
> $IPTABLES -A FORWARD -p 47 -i $INET_IFACE -o $LAN_IFACE -d
> $LAN_VPNSERVER_IP -j allowed
> $IPTABLES -A FORWARD -p 47 -s 0/0 -d $LAN_VPNSERVER_IP -j ACCEPT
>=20
My PREROUTING and FORWARD rules:

$IPTABLES -t nat -A PREROUTING -i $IFACE_INET -p tcp --dport 1723 -d
$IP_INET_WEB8 -j DNAT --to $IP_INT_WEB8
$IPTABLES -t nat -A PREROUTING -i $IFACE_INET -p 47 -d $IP_INET_WEB8 -j
DNAT --to $IP_INT_WEB8

$IPTABLES -A FORWARD -i $IFACE_INT -p tcp --sport 1723 --dport 1024: -s
$IP_INT_WEB8 -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $IFACE_INT -p 47 -s $IP_INT_WEB8 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $IFACE_INET -p tcp --dport 1723 -d $IP_INT_WEB8
-m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $IFACE_INET -p 47 -d $IP_INT_WEB8 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT

then there's also POSTROUTING from the VPN server:

$IPTABLES -t nat -A POSTROUTING -o $IFACE_INET -p tcp --sport 1723 -s
$IP_INT_WEB8 -d ! $NET_INT -j SNAT --to $IP_INET_WEB8

And that works for me ...


> The ones regarding PPTP are (restricted to the vpn client's ip):
>=20
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -s $VPNCLIENT_IP -d
> $VPNSERVER_IP --dport 1723 \
> -j DNAT --to-destination $LAN_VPNSERVER_IP:1723
> $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $LAN_IFACE -d
> $LAN_VPNSERVER_IP \
> --dport 1723 -j allowed
> $IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $LAN_IFACE -d
> $LAN_VPNSERVER_IP \
> -j icmp_packets
>=20
> Any suggestions?
> TIA
> Alexio
--=20
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(  Raymond Leach                       )
 ) Knowledge Factory                  (
(                                      )
 ) Tel: +27 11 445 8100               (
(  Fax: +27 11 445 8101                )
 )                                    (
(  http://www.knowledgefactory.co.za/  )
 ) http://www.saptg.co.za/            (
(  http://www.mapnet.co.za/            )
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   o                                o
    o                              o
        .--.                  .--.
       | o_o|                |o_o |
       | \_:|                |:_/ |
      / /   \\              //   \ \
     ( |     |)            (|     | )
     /`\_   _/'\          /'\_   _/`\
     \___)=3D(___/          \___)=3D(___/


--=-GQNatVAa9s0yvbmH6SUA
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+b1F9h1fuR/Bv+ygRAn4hAJwO67T3ImJM4oNPJLGzOC2I6RsxDACgj96f
RpnHIZJoiU3/CSGsBE19a08=
=KpJj
-----END PGP SIGNATURE-----

--=-GQNatVAa9s0yvbmH6SUA--


