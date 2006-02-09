From: Greg Cope <gregcope@gmail.com>
Subject: Why is can't my clients use DNS?
Date: Thu, 9 Feb 2006 10:18:01 +0000
Message-ID: <c0e9781f0602090218y2d8cc31dy@mail.gmail.com>
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

Hi All,

I have a simple firewall/router.

Behind are a few servers.

I need to be able to;

- Let clients use external dns (does not work)
- ssh onto firewall (works)
- NAT packets onto webservers behind firewall (works)

This is a simple problem, but I can't seem to crack it - please can
someone point out my stupidity;

Some of the rules I have;

${IPTABLES} -A INPUT -p udp -s ${EXT_DNS_IP} --source-port 53 -d
${DMZ_IP_RANGE} -j ACCEPT
${IPTABLES} -A INPUT -p udp -s ${EXT_DNS_IP2} --source-port 53 -d
${DMZ_IP_RANGE} -j ACCEPT
${IPTABLES} -A FORWARD -p udp -s ${EXT_DNS_IP} -d ${DMZ_IP_RANGE}
--sport 53 -j ACCEPT


What am I missing?

snipped output of  iptables -nvL -t filter

Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source             =20
destination
  119  8981 ACCEPT     all  --  eth1   *       0.0.0.0/0          =20
0.0.0.0/0           state RELATED,ESTABLISHED
    6   680 ACCEPT     all  --  eth0   *       0.0.0.0/0          =20
0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0          =20
0.0.0.0/0
    0     0 icmp_packets  icmp --  eth1   *       0.0.0.0/0          =20
0.0.0.0/0
    0     0 DROP       all  --  eth1   *       192.168.0.0/16     =20
0.0.0.0/0
    0     0 DROP       all  --  eth1   *       127.0.0.0/8        =20
0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           tcp dpt:80 flags:0x16/0x02
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           tcp dpt:22 flags:0x16/0x02
    0     0 ACCEPT     udp  --  *      *       195.40.1.36        =20
192.168.0.0/16      udp spt:53
    0     0 ACCEPT     udp  --  *      *       195.184.228.6      =20
192.168.0.0/16      udp spt:53
    0     0 DROP       udp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0
    1    40 DROP       tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           tcp flags:0x16/0x02
    0     0 LOG        all  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           LOG flags 0 level 7 prefix `INPUT DENY: '

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source             =20
destination
    8   536 ACCEPT     all  --  eth0   eth1    0.0.0.0/0          =20
0.0.0.0/0
    0     0 ACCEPT     all  --  eth1   eth0    0.0.0.0/0          =20
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
192.168.0.0/16      tcp dpt:22 flags:0x16/0x02
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
192.168.0.0/16      tcp dpt:80 flags:0x16/0x02
    0     0 ACCEPT     udp  --  *      *       195.40.1.36        =20
192.168.0.0/16      udp spt:53
    0     0 LOG        all  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           LOG flags 0 level 7 prefix `FORWARD DENY: '

