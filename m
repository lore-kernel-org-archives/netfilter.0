From: "John L. Magee" <jlmagee@mageenet.net>
Subject: RE: Active FTP hangs with SNAT
Date: Wed, 26 Dec 2007 20:35:25 -0500
Message-ID: <91CBD7F22CBCE7458D3E7A71C81B07C8485837@mnetmx1.adamapps.host>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Thanks for the feedback.

I've made a bit of progress and now have the following situation:

- From outside network, Windows command line FTP works and IE6/7 work
when the
	"Use Passive FTP..." box is NOT checked. IE6/7 hangs when that
box IS checked.

- From inside (Win2K VM), FTP only works when the "Use Passive FTP..."
box IS checked.

Configuration information, including Routing, follows. Everything else
in this configuration seems to work fine.

Hopefully the diagram will not be mangled again.

    Gateway to Outside Network
       172.18.148.214/29
               |
               |
               |
 *-------------|---------------------------------*
 |             |                                 |
 | *-----------------------*   *---------------* |
 | |   172.18.148.209/29   |   |               | |
 | |                       |   |               | |
 | |                       |   |               | |
 | |                       |   |               | |
 | |                       |   |               | |
 | |      172.23.127.253/17|---|172.23.20.5/17 | |
 | |                       |   |               | |
 | |                       |   |               | |
 | |                       |   |               | |
 | |    CentOS 5.1 VM      |   | Win2K VM      | |
 | |                       |   |               | |
 | *-----------------------*   *---------------* |
 |                                               |
 |                                               |
 |                                               |
 |           Xensource Express 4.0.1             |
 |                                               |
 |                                               |
 *-----------------------------------------------*

iptables --flush FORWARD
iptables --flush INPUT
iptables --flush OUTPUT
iptables --table nat --flush
iptables --table filter --flush
iptables --table mangle --flush
iptables --delete-chain
iptables --policy FORWARD     ACCEPT
iptables --policy INPUT       ACCEPT
iptables --policy OUTPUT      ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -s 172.23.0.0/17 -j SNAT
--to-source 172.18.148.209
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 172.18.148.225 --dport
80  -j DNAT --to-destination 172.23.20.5:80
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 172.18.148.225 --dport
443  -j DNAT --to-destination 172.23.20.5:443
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 172.18.148.225 --dport
3389  -j DNAT --to-destination 172.23.20.5:3389
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 172.18.148.225 --dport
53  -j DNAT --to-destination 172.23.20.5:53
iptables -t nat -A PREROUTING -i eth0 -p udp -d 172.18.148.225 --dport
53  -j DNAT --to-destination 172.23.20.5:53
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 172.18.148.225 --dport
21  -j DNAT --to-destination 172.23.20.5:21
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 172.18.148.225 --dport
20  -j DNAT --to-destination 172.23.20.5:20
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 172.18.148.225 --dport
1024:65535 -j DNAT --to-destination 172.23.20.5
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 172.23.127.253 --dport
22 -j DNAT --to-destination 172.23.127.253
iptables -t nat -A PREROUTING -i eth0 -d 172.18.148.224/27  -j DROP
iptables -t nat -A PREROUTING -i eth0 -d 172.23.0.0/17  -j DROP
iptables -t filter -A FORWARD  -o eth0 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD  -i eth0 -m state --state
ESTABLISHED,RELATED -j ACCEPT

/proc/sys/net/ipv4/ip_forward
1
# Kernel sysctl configuration file for Red Hat Linux
#
# For binary values, 0 is disabled, 1 is enabled.  See sysctl(8) and
# sysctl.conf(5) for more details.

# Controls IP packet forwarding
net.ipv4.ip_forward = 1

# Controls source route verification
net.ipv4.conf.default.rp_filter = 1

# Do not accept source routing
net.ipv4.conf.default.accept_source_route = 0

# Controls the System Request debugging functionality of the kernel
kernel.sysrq = 0

# Controls whether core dumps will append the PID to the core filename
# Useful for debugging multi-threaded applications
kernel.core_uses_pid = 1

# Controls the use of TCP syncookies
net.ipv4.tcp_syncookies = 1

# Controls the maximum size of a message, in bytes
kernel.msgmnb = 65536

# Controls the default maxmimum size of a mesage queue
kernel.msgmax = 65536

# Controls the maximum shared segment size, in bytes
kernel.shmmax = 4294967295

# Controls the maximum number of shared memory segments, in pages
kernel.shmall = 268435456
Module                  Size  Used by
tun                    14657  1
nfsd                  201457  17
exportfs                9665  1 nfsd
lockd                  59209  2 nfsd
nfs_acl                 7617  1 nfsd
autofs4                24389  2
hidp                   23105  2
l2cap                  29633  5 hidp
bluetooth              53925  2 hidp,l2cap
sunrpc                144253  12 nfsd,lockd,nfs_acl
xennet                 28617  0 [permanent]
ip_conntrack_netbios_ns     6977  0
ip_nat_irc              6721  0
ip_nat_ftp              7361  0
ip_conntrack_irc       10801  1 ip_nat_irc
ip_conntrack_ftp       11697  1 ip_nat_ftp
xt_state                6209  2
iptable_filter          7105  1
iptable_nat            11205  1
ip_nat                 21101  3 ip_nat_irc,ip_nat_ftp,iptable_nat
ip_conntrack           53025  8
ip_conntrack_netbios_ns,ip_nat_irc,ip_nat_ftp,ip_conntrack_irc,ip_conntr
ack_ftp,xt_state,iptable_nat,ip_nat
nfnetlink              10713  2 ip_nat,ip_conntrack
iptable_mangle          6849  0
ip_tables              17029  3
iptable_filter,iptable_nat,iptable_mangle
ip6t_REJECT             9409  1
xt_tcpudp               7105  15
ip6table_filter         6849  1
ip6_tables             18181  1 ip6table_filter
x_tables               17349  6
xt_state,iptable_nat,ip_tables,ip6t_REJECT,xt_tcpudp,ip6_tables
ipv6                  251521  19 ip6t_REJECT
dm_multipath           21577  0
parport_pc             29157  0
lp                     15849  0
parport                37641  2 parport_pc,lp
pcspkr                  7105  0
dm_snapshot            20709  0
dm_zero                 6209  0
dm_mirror              28869  0
dm_mod                 58201  9
dm_multipath,dm_snapshot,dm_zero,dm_mirror
xenblk                 19473  3
ext3                  123336  2
jbd                    56553  1 ext3
ehci_hcd               33357  0
ohci_hcd               23645  0
uhci_hcd               25677  0
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.37.2    *               255.255.255.255 UH    0      0        0
tun0
172.18.148.208  *               255.255.255.248 U     0      0        0
eth0
172.18.148.216  *               255.255.255.248 U     0      0        0
eth2
192.168.37.0    192.168.37.2    255.255.255.0   UG    0      0        0
tun0
172.23.0.0      *               255.255.128.0   U     0      0        0
eth1
169.254.0.0     *               255.255.0.0     U     0      0        0
eth2
default         172.18.148.214  0.0.0.0         UG    0      0        0
eth0
# Generated by iptables-save v1.3.5 on Wed Dec 26 19:43:43 2007
*filter
:INPUT ACCEPT [1018:65834]
:FORWARD ACCEPT [48:2304]
:OUTPUT ACCEPT [1425:183793]
-A FORWARD -o eth0 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
COMMIT
# Completed on Wed Dec 26 19:43:43 2007
# Generated by iptables-save v1.3.5 on Wed Dec 26 19:43:43 2007
*nat
:PREROUTING ACCEPT [12527:637445]
:POSTROUTING ACCEPT [4278:216137]
:OUTPUT ACCEPT [135:10583]
-A PREROUTING -d 172.18.148.225 -i eth0 -p tcp -m tcp --dport 80 -j DNAT
--to-destination 172.23.20.5:80
-A PREROUTING -d 172.18.148.225 -i eth0 -p tcp -m tcp --dport 443 -j
DNAT --to-destination 172.23.20.5:443
-A PREROUTING -d 172.18.148.225 -i eth0 -p tcp -m tcp --dport 3389 -j
DNAT --to-destination 172.23.20.5:3389
-A PREROUTING -d 172.18.148.225 -i eth0 -p tcp -m tcp --dport 53 -j DNAT
--to-destination 172.23.20.5:53
-A PREROUTING -d 172.18.148.225 -i eth0 -p udp -m udp --dport 53 -j DNAT
--to-destination 172.23.20.5:53
-A PREROUTING -d 172.18.148.225 -i eth0 -p tcp -m tcp --dport 21 -j DNAT
--to-destination 172.23.20.5:21
-A PREROUTING -d 172.18.148.225 -i eth0 -p tcp -m tcp --dport 20 -j DNAT
--to-destination 172.23.20.5:20
-A PREROUTING -d 172.18.148.225 -i eth0 -p tcp -m tcp --dport 1024:65535
-j DNAT --to-destination 172.23.20.5
-A PREROUTING -d 172.23.127.253 -i eth0 -p tcp -m tcp --dport 22 -j DNAT
--to-destination 172.23.127.253
-A PREROUTING -d 172.18.148.224/255.255.255.224 -i eth0 -j DROP
-A PREROUTING -d 172.23.0.0/255.255.128.0 -i eth0 -j DROP
-A POSTROUTING -s 172.23.0.0/255.255.128.0 -o eth0 -j SNAT --to-source
172.18.148.209
COMMIT
# Completed on Wed Dec 26 19:43:43 2007
# Generated by iptables-save v1.3.5 on Wed Dec 26 19:43:43 2007
*mangle
:PREROUTING ACCEPT [79845:11152342]
:INPUT ACCEPT [24415:3169282]
:FORWARD ACCEPT [47534:7595046]
:OUTPUT ACCEPT [47725:5350611]
:POSTROUTING ACCEPT [95471:12960523]
COMMIT
# Completed on Wed Dec 26 19:43:43 2007

