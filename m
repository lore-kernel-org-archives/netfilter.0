From: Carlos Pastorino <carlos.pastorino@gmail.com>
Subject: Conntrack and DNS
Date: Mon, 9 Jan 2006 17:11:39 -0200
Message-ID: <cc4fcc140601091111k57bdf291le27ae00681f2bbb7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi everyone,

I have the following rules in my firewall:

$IPTABLES -A FORWARD -p ALL -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -p UDP -i $DMZ_IFACE -o $INET_IFACE -s
$MYMAILSERVER -d $DNS01 --dport domain -j ACCEPT
$IPTABLES -A FORWARD -p UDP -i $DMZ_IFACE -o $INET_IFACE -s
$MYMAILSERVER -d $DNS02 --dport domain -j ACCEPT

But some response DNS packets are being dropped. Here's an example:

TCPDUMP on my mail server:

16:26:27.433734 IP (tos 0x0, ttl  64, id 47192, offset 0, flags [DF],
proto 17, length: 55) MYMAILSERVER.49372 > DNS01.domain: [udp sum ok]=20
9962+ AAAA? ibest.com. (27)
16:26:27.549682 IP (tos 0x0, ttl 250, id 35994, offset 0, flags [DF],
proto 17, length: 55) DNS01.domain > MYMAILSERVER.49372: [udp sum ok]=20
9962 ServFail q: AAAA? ibest.com. 0/0/0 (27)
16:26:27.549801 IP (tos 0x0, ttl  64, id 47308, offset 0, flags [DF],
proto 17, length: 55) MYMAILSERVER.49372 > DNS02.domain: [udp sum ok]=20
34474+ A? ibest.com. (27)

/VAR/LOG/MESSAGES on my firewall:

Jan  9 16:26:57 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3DDNS02 DST=3DMYMAILSERVER LEN=3D55 TOS=3D0x00 PREC=3D0x00 TTL=3D250 ID=
=3D13214
DF PROTO=3DUDP SPT=3D53 DPT=3D49372 LEN=3D35

As you can see, MYMAILSERVER asks DNS01, and DNS01 responds with
ServFail. So, MYMAILSERVER in turn asks to DNS02, and the response is
blocked by the firewall.

Why?

Thanks,

Carlos Pastorino

