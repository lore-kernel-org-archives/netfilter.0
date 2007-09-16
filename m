From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port-based routing with OpenVPN
Date: Sun, 16 Sep 2007 13:05:08 +0200
Message-ID: <46ED0DE4.1040300@plouf.fr.eu.org>
References: <20070915231545.224150@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070915231545.224150@gmx.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <http://lists.netfilter.org/pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Mario H=FClsegge a =E9crit :
>=20
> i am trying to set up routing of all outgoing http-requests on my=20
> workstation through my openvpn gateway (tun0). the web told me to do it=
:
>=20
> iptables -t mangle -A OUTPUT -p tcp --dport 80 -j MARK --set-mark 4
> ip rule add fwmark 4 lookup 3
> ip route add default dev tun0 table 3

Looks fine.

> the problem is that it does not work. tcpdump gives me:
>=20
> 00:28:00.461045 IP (tos 0x0, ttl  64, id 28447, offset 0, flags [DF],=20
> proto: UDP (17), length: 71) 192.168.0.125.1049 > vroot.domain: [udp su=
m=20
> ok]  62654+ PTR? 67.11.71.195.in-addr.arpa. (43)
> 00:28:00.515190 IP (tos 0x0, ttl  56, id 0, offset 0, flags [DF], proto=
:=20
> UDP (17), length: 127) vroot.domain > 192.168.0.125.1049:  62654 NXDoma=
in=20
> q: PTR? 67.11.71.195.in-addr.arpa. 0/1/0 ns: 71.195.in-addr.arpa. (99)
> 00:28:01.459744 arp who-has 195.71.11.67 tell 192.168.0.125
> 00:28:02.459844 arp who-has 195.71.11.67 tell 192.168.0.125

Was this trace captured on interface tun0 ?
Please use option -n so addresses and port numbers are not converted=20
into confusing names.
What is the address of vroot ? Is it the other end of the VPN ?
Is the OpenVPN link configured in TUN (IP) or TAP (ethernet) mode ? The=20
interface name tun0 suggests TUN mode, but the ARP requests suggest TAP=20
mode. If it is TAP mode, you must specify the gateway address in the ip=20
route statement just as you would do with a gateway on an ethernet link.

