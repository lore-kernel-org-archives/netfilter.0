From: =?iso-8859-1?Q?=22Mario_H=FClsegge=22?= <huelsegge@gmx.de>
Subject: (unknown)
Date: Sun, 16 Sep 2007 01:15:45 +0200
Message-ID: <20070915231545.224150@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

hi,

i am trying to set up routing of all outgoing http-requests on my=20
workstation through my openvpn gateway (tun0). the web told me to do it:

iptables -t mangle -A OUTPUT -p tcp --dport 80 -j MARK --set-mark 4
ip rule add fwmark 4 lookup 3
ip route add default dev tun0 table 3


the problem is that it does not work. tcpdump gives me:

00:28:00.461045 IP (tos 0x0, ttl  64, id 28447, offset 0, flags [DF],=20
proto: UDP (17), length: 71) 192.168.0.125.1049 > vroot.domain: [udp sum=20
ok]  62654+ PTR? 67.11.71.195.in-addr.arpa. (43)
00:28:00.515190 IP (tos 0x0, ttl  56, id 0, offset 0, flags [DF], proto:=20
UDP (17), length: 127) vroot.domain > 192.168.0.125.1049:  62654 NXDomain=20
q: PTR? 67.11.71.195.in-addr.arpa. 0/1/0 ns: 71.195.in-addr.arpa. (99)
00:28:01.459744 arp who-has 195.71.11.67 tell 192.168.0.125
00:28:02.459844 arp who-has 195.71.11.67 tell 192.168.0.125


the arp-requests dont seem to be right, any suggestions?

Mario
--=20
Psssst! Schon vom neuen GMX MultiMessenger geh=F6rt?
Der kanns mit allen: http://www.gmx.net/de/go/multimessenger

