From: "Cassani Alexio" <alexio.cassani@bhuman.it>
Subject: VPN Server behind a iptables FW (PPTP)
Date: Wed, 12 Mar 2003 16:06:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DBF92B7FA3E6C94A99B4AE5938A62B7E4023BC@excw2k01.bhlan.bhuman.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,
I've set up a linux box with iptables 1.2.7a + pptp patch.
Then I've configured a VPN server win2k-based and if I try to connect to
it using a client of my LAN I have no problem, obviously the problems
are present when the vpn client is outside my network.
The architecture is here reported:

 VPN	     IPTables			 VPN
Server ---  Server --- Internet --- Client

VPN Server Internal IP:192.168.0.1
VPN Server public IP (hosted by the firewall) is a global address.
So IPTables server performs NAT.


Actions performed:

- from VPN client (a win2k box) I can telnet my vpn server at the 1723
port
- from VPN client I've configured a VPN connection to my VPN server and
the connection stops with the following error "721 remote computer is
not responding" after hanging for a few seconds on the window "Verifying
Username and Password"

My opinion is that GRE packet are not routed by the linux box, so
authentication fails.

The iptables script used to set up the fw includes the following lines
regarding GRE protocol:

$IPTABLES -t nat -A PREROUTING -p GRE -i $INET_IFACE -j DNAT
--to-destination $LAN_VPNSERVER_IP
$IPTABLES -A FORWARD -p 47 -i $INET_IFACE -o $LAN_IFACE -d
$LAN_VPNSERVER_IP -j allowed
$IPTABLES -A FORWARD -p 47 -s 0/0 -d $LAN_VPNSERVER_IP -j ACCEPT

The ones regarding PPTP are (restricted to the vpn client's ip):

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -s $VPNCLIENT_IP -d
$VPNSERVER_IP --dport 1723 \
-j DNAT --to-destination $LAN_VPNSERVER_IP:1723
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $LAN_IFACE -d
$LAN_VPNSERVER_IP \
--dport 1723 -j allowed
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $LAN_IFACE -d
$LAN_VPNSERVER_IP \
-j icmp_packets

Any suggestions?
TIA
Alexio

