From: "Support Team" <support@precisenetworksinc.com>
Subject: iptables not responding to packets destined for subinterface
Date: Sun, 24 Oct 2004 21:44:08 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <002201c4ba44$e1ff8ba0$6601a8c0@CHELA>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

My public interface has serveral IP address aliases.  Only the primary =
IP
address responds to traffic (ip, imcp, et al).  I inserted a log =
statement
at the top of each table and found that the packets destined for the =
virtual
addresses never made it to any table.  However, according to tcpdump, I
confirmed that the packets did get picked up by the kernel on the =
secondary
address.  I guess they are just not passed to iptables.  Obviously, the
packet was never replied to (icmp) or acknowledged (ip) by the process.

How can I get iptables to respond to the packets on the secondary
interfaces?  Or, how can I get the kernel to pass the packets to =
iptables?

I understand that when the packet hits the chain, all I have to do is =
create
a rule with the primary interface and use the IP address to distinguish =
the
packets of different virtual addresses.

Here is more details of what I have:

-----------
Interfaces:
-----------
SYNOPSIS: I have a "public" Ethernet interface that has a primary =
address of
1.1.1.2 on eth0.  There are serveral secondary addresses.  Only 1.1.1.3 =
on
eth0:3 is listed here.  I have two "private" Ethernet interfaces, each
connected to a different physical network.  The first private network =
has a
primary address of 10.0.0.11 on eth1.  It has one secondary addresss of
10.0.0.1 on eth1:1.  Finally, the second priavte interface has only one
address - 192.168.60.1 on eth2.

eth0      Link encap:Ethernet  HWaddr 00:01:03:E9:3A:58 =20
          inet addr:1.1.1.2  Bcast:1.1.1.63  Mask:255.255.255.192
eth0:3    Link encap:Ethernet  HWaddr 00:01:03:E9:3A:58 =20
          inet addr:1.1.1.3  Bcast:1.1.1.63  Mask:255.255.255.192
eth1      Link encap:Ethernet  HWaddr 00:50:DA:24:A7:58 =20
          inet addr:10.0.0.11  Bcast:10.0.0.255  Mask:255.255.255.0
eth1:1    Link encap:Ethernet  HWaddr 00:50:DA:24:A7:58 =20
          inet addr:10.0.0.1  Bcast:10.255.255.255  Mask:255.255.255.0
eth2      Link encap:Ethernet  HWaddr 00:50:DA:94:83:3F =20
          inet addr:192.168.60.1  Bcast:192.168.60.255  =
Mask:255.255.255.0
lo        Link encap:Local Loopback =20
          inet addr:127.0.0.1  Mask:255.0.0.0

------------------------
Kernel IP routing table:
------------------------
SYNOPSIS: Each interface is directly connected to a physical network =
with
its subnet.  The default gateway is a Cisco 678 DSL modem with the =
address
of 1.1.1.1.

Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
1.1.1.0         0.0.0.0         255.255.255.192 U     0      0        0 =
eth0
10.0.0.0        0.0.0.0         255.255.255.0   U     0      0        0 =
eth1
192.168.60.0    0.0.0.0         255.255.255.0   U     0      0        0 =
eth2
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 =
lo
0.0.0.0         1.1.1.1         0.0.0.0         UG    0      0        0 =
eth0

---------
Iptables:
---------
SYNOPSIS: Of course, IPv4 routing is enabled.  The ruleset is simple: =
allow
any packets destined for or originating from the device as well as =
anything
travesing the NAT tables.  Deny all forwarded packets except outbound
traffic from the private networks or traffic that is part of an =
established
connection.  I SNAT the private networks as the primary IP address of =
the
public interface.  The log statements were omitted for clarity.  I'd =
like to
SNAT on a secondary address, different ones for each private network.
However, I can't communicate using a secondary address....

Chain INPUT (policy ACCEPT 4143 packets, 604K bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 ACCEPT     all  --  *      *       10.0.0.0/24
0.0.0.0/0          =20
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
10.0.0.0/24         state ESTABLISHED=20
   15  1140 ACCEPT     all  --  *      *       192.168.60.0/24
0.0.0.0/0          =20
   15  1140 ACCEPT     all  --  *      *       0.0.0.0/0
192.168.60.0/24     state ESTABLISHED=20

Chain OUTPUT (policy ACCEPT 3917 packets, 880K bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

Chain PREROUTING (policy ACCEPT 343 packets, 43451 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

Chain POSTROUTING (policy ACCEPT 492 packets, 44419 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 SNAT       all  --  *      eth0    10.0.0.0/24
0.0.0.0/0           to:1.1.1.2=20
   15  1140 SNAT       all  --  *      eth0    192.168.60.0/24
0.0.0.0/0           to:1.1.1.2=20

Chain OUTPUT (policy ACCEPT 492 packets, 44419 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

-------------------------------------
Ping from Intenet to Primary Address:
-------------------------------------
SYNOPSIS: These are the log statements from iptables.  The prefix in
parenthesis indicate which table originated the message.  As expected: =
The
first is the ping packet hitting the PREROUTING nat table where no =
mangling
takes place.  The second is the source ping reaching the interface after
passing the INPUT table.  The last statement is the ping reply.

Oct 24 18:08:25 kernel: (prerouting) IN=3Deth0 OUT=3D
MAC=3D00:01:03:e9:3a:58:00:05:5e:9f:81:1c:08:00 SRC=3D<Internet> =
DST=3D1.1.1.2
LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D54 ID=3D0 DF PROTO=3DICMP TYPE=3D8 =
CODE=3D0 ID=3D41484
SEQ=3D0=20

Oct 24 18:08:25 kernel: (input) IN=3Deth0 OUT=3D
MAC=3D00:01:03:e9:3a:58:00:05:5e:9f:81:1c:08:00 SRC=3D<Internet> =
DST=3D1.1.1.2
LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D54 ID=3D0 DF PROTO=3DICMP TYPE=3D8 =
CODE=3D0 ID=3D41484
SEQ=3D0=20

Oct 24 18:08:25 kernel: (output) IN=3D OUT=3Deth0 SRC=3D1.1.1.2 =
DST=3D<Internet>
LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D62631 PROTO=3DICMP =
TYPE=3D0 CODE=3D0 ID=3D41484
SEQ=3D0=20

-----------------------------------------
Tcpdump from Internet to Primary Address:
-----------------------------------------
SYNOPSIS: As expected, tcpdump sees the ping request and ping reply when
communicating with the primary address 1.1.1.2.

# tcpdump -vv -n -i eth0 icmp
tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 96
bytes

18:08:25.789975 IP (tos 0x0, ttl  54, id 0, offset 0, flags [DF], =
length:
84) <Internet> > 1.1.1.2: icmp 64: echo request seq 0

18:08:25.790038 IP (tos 0x0, ttl  64, id 31516, offset 0, flags [none],
length: 84) 1.1.1.2 > <Internet>: icmp 64: echo reply seq 0

-------------------------------------
Ping from Intenet to SecondaryAddress:
-------------------------------------
SYNOPSIS:  Iptables did not log anything when communicating with the
secondary address 1.1.1.3  I would think this indicates at least two =
cases:
The packet never made it to iptables or iptables didn't do anything with =
the
packet.

-----------------------------------------
Tcpdump from Internet to Secondary Address:
-----------------------------------------
SYNOPSIS: tcpdump sees many ping packets destined for the secondary =
address.
However, there are no replies.  Presumably because the kernel didn't =
know it
needed to reply to anything.

# tcpdump -vv -n -i eth0 icmp
tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 96
bytes

18:09:35.220522 IP (tos 0x0, ttl  54, id 0, offset 0, flags [DF], =
length:
84) <Internet> > 1.1.1.3: icmp 64: echo request seq 0

18:09:36.220083 IP (tos 0x0, ttl  54, id 0, offset 0, flags [DF], =
length:
84) <Internet> > 1.1.1.3: icmp 64: echo request seq 256

---------------
Kernel Options:
---------------
SYNOPSIS: My 2.6.9 kernel has all of the advanced router options =
compiled
in.  Eth0 and Eth1 are 3 Com 3c905c and the eth2 is 3Com 3c905b.  I also
compiled in IPv6, although I'm not using it.=20

#
# Networking support
#
CONFIG_NET=3Dy

#
# Networking options
#
CONFIG_PACKET=3Dy
CONFIG_PACKET_MMAP=3Dy
# CONFIG_NETLINK_DEV is not set
CONFIG_UNIX=3Dy
# CONFIG_NET_KEY is not set
CONFIG_INET=3Dy
CONFIG_IP_MULTICAST=3Dy
CONFIG_IP_ADVANCED_ROUTER=3Dy
CONFIG_IP_MULTIPLE_TABLES=3Dy
CONFIG_IP_ROUTE_FWMARK=3Dy
CONFIG_IP_ROUTE_MULTIPATH=3Dy
CONFIG_IP_ROUTE_VERBOSE=3Dy
CONFIG_IP_PNP=3Dy
CONFIG_IP_PNP_DHCP=3Dy
CONFIG_IP_PNP_BOOTP=3Dy
CONFIG_IP_PNP_RARP=3Dy
CONFIG_NET_IPIP=3Dy
CONFIG_NET_IPGRE=3Dy
CONFIG_NET_IPGRE_BROADCAST=3Dy
CONFIG_IP_MROUTE=3Dy
CONFIG_IP_PIMSM_V1=3Dy
CONFIG_IP_PIMSM_V2=3Dy
CONFIG_ARPD=3Dy
CONFIG_SYN_COOKIES=3Dy
CONFIG_INET_AH=3Dy
CONFIG_INET_ESP=3Dy
CONFIG_INET_IPCOMP=3Dy
CONFIG_INET_TUNNEL=3Dy

#
# IP: Virtual Server Configuration
#
# CONFIG_IP_VS is not set
CONFIG_IPV6=3Dy
CONFIG_IPV6_PRIVACY=3Dy
CONFIG_INET6_AH=3Dy
CONFIG_INET6_ESP=3Dy
CONFIG_INET6_IPCOMP=3Dy
CONFIG_INET6_TUNNEL=3Dy
CONFIG_IPV6_TUNNEL=3Dy
CONFIG_IPV6_TUNNEL=3Dy
CONFIG_NETFILTER=3Dy
CONFIG_NETFILTER_DEBUG=3Dy

#=20
# IP: Netfilter Configuration
#=20
CONFIG_IP_NF_CONNTRACK=3Dy
CONFIG_IP_NF_CT_ACCT=3Dy
CONFIG_IP_NF_CT_PROTO_SCTP=3Dy=20
CONFIG_IP_NF_FTP=3Dy
CONFIG_IP_NF_IRC=3Dy
CONFIG_IP_NF_TFTP=3Dy
CONFIG_IP_NF_AMANDA=3Dy
CONFIG_IP_NF_QUEUE=3Dy
CONFIG_IP_NF_IPTABLES=3Dy
CONFIG_IP_NF_MATCH_LIMIT=3Dy
CONFIG_IP_NF_MATCH_IPRANGE=3Dy
CONFIG_IP_NF_MATCH_MAC=3Dy=20
CONFIG_IP_NF_MATCH_PKTTYPE=3Dy=20
CONFIG_IP_NF_MATCH_MARK=3Dy
CONFIG_IP_NF_MATCH_MULTIPORT=3Dy
CONFIG_IP_NF_MATCH_TOS=3Dy
CONFIG_IP_NF_MATCH_RECENT=3Dy
CONFIG_IP_NF_MATCH_ECN=3Dy
CONFIG_IP_NF_MATCH_DSCP=3Dy
CONFIG_IP_NF_MATCH_AH_ESP=3Dy
CONFIG_IP_NF_MATCH_LENGTH=3Dy
CONFIG_IP_NF_MATCH_TTL=3Dy
CONFIG_IP_NF_MATCH_TCPMSS=3Dy
CONFIG_IP_NF_MATCH_HELPER=3Dy
CONFIG_IP_NF_MATCH_STATE=3Dy
CONFIG_IP_NF_MATCH_CONNTRACK=3Dy
CONFIG_IP_NF_MATCH_OWNER=3Dy
CONFIG_IP_NF_MATCH_ADDRTYPE=3Dy
CONFIG_IP_NF_MATCH_REALM=3Dy
CONFIG_IP_NF_MATCH_SCTP=3Dy
CONFIG_IP_NF_MATCH_COMMENT=3Dy
CONFIG_IP_NF_FILTER=3Dy
CONFIG_IP_NF_TARGET_REJECT=3Dy
CONFIG_IP_NF_TARGET_LOG=3Dy
CONFIG_IP_NF_TARGET_ULOG=3Dy
CONFIG_IP_NF_TARGET_TCPMSS=3Dy
CONFIG_IP_NF_NAT=3Dy
CONFIG_IP_NF_NAT_NEEDED=3Dy
CONFIG_IP_NF_TARGET_MASQUERADE=3Dy
CONFIG_IP_NF_TARGET_REDIRECT=3Dy
CONFIG_IP_NF_TARGET_NETMAP=3Dy
CONFIG_IP_NF_TARGET_SAME=3Dy
CONFIG_IP_NF_NAT_LOCAL=3Dy
CONFIG_IP_NF_NAT_SNMP_BASIC=3Dy
CONFIG_IP_NF_NAT_IRC=3Dy
CONFIG_IP_NF_NAT_FTP=3Dy
CONFIG_IP_NF_NAT_TFTP=3Dy
CONFIG_IP_NF_NAT_AMANDA=3Dy
CONFIG_IP_NF_MANGLE=3Dy
CONFIG_IP_NF_TARGET_TOS=3Dy
CONFIG_IP_NF_TARGET_ECN=3Dy
CONFIG_IP_NF_TARGET_DSCP=3Dy
CONFIG_IP_NF_TARGET_MARK=3Dy
CONFIG_IP_NF_TARGET_CLASSIFY=3Dy
CONFIG_IP_NF_RAW=3Dy
CONFIG_IP_NF_TARGET_NOTRACK=3Dy
CONFIG_IP_NF_ARPTABLES=3Dy
CONFIG_IP_NF_ARPFILTER=3Dy
CONFIG_IP_NF_ARP_MANGLE=3Dy

#
# IPv6: Netfilter Configuration
#
CONFIG_IP6_NF_QUEUE=3Dy
CONFIG_IP6_NF_IPTABLES=3Dy
CONFIG_IP6_NF_MATCH_LIMIT=3Dy
CONFIG_IP6_NF_MATCH_MAC=3Dy
CONFIG_IP6_NF_MATCH_RT=3Dy
CONFIG_IP6_NF_MATCH_OPTS=3Dy
CONFIG_IP6_NF_MATCH_FRAG=3Dy
CONFIG_IP6_NF_MATCH_HL=3Dy
CONFIG_IP6_NF_MATCH_MULTIPORT=3Dy
CONFIG_IP6_NF_MATCH_OWNER=3Dy
CONFIG_IP6_NF_MATCH_MARK=3Dy
CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dy
CONFIG_IP6_NF_MATCH_AHESP=3Dy
CONFIG_IP6_NF_MATCH_LENGTH=3Dy
CONFIG_IP6_NF_MATCH_EUI64=3Dy
CONFIG_IP6_NF_FILTER=3Dy
CONFIG_IP6_NF_TARGET_LOG=3Dy
CONFIG_IP6_NF_MANGLE=3Dy
CONFIG_IP6_NF_TARGET_MARK=3Dy
CONFIG_IP6_NF_RAW=3Dy
CONFIG_XFRM=3Dy
CONFIG_XFRM_USER=3Dy

#
# SCTP Configuration (EXPERIMENTAL)
#
# CONFIG_IP_SCTP is not set
# CONFIG_ATM is not set
# CONFIG_BRIDGE is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
CONFIG_LLC=3Dy
# CONFIG_LLC2 is not set
CONFIG_IPX=3Dy
# CONFIG_IPX_INTERN is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_HW_FLOWCONTROL is not set

#
# QoS and/or fair queueing
#
CONFIG_NET_SCHED=3Dy
CONFIG_NET_SCH_CLK_JIFFIES=3Dy
# CONFIG_NET_SCH_CLK_GETTIMEOFDAY is not set
# CONFIG_NET_SCH_CLK_CPU is not set
CONFIG_NET_SCH_CBQ=3Dy
CONFIG_NET_SCH_HTB=3Dy
CONFIG_NET_SCH_HFSC=3Dy
CONFIG_NET_SCH_PRIO=3Dy
CONFIG_NET_SCH_RED=3Dy
CONFIG_NET_SCH_SFQ=3Dy
CONFIG_NET_SCH_TEQL=3Dy
CONFIG_NET_SCH_TBF=3Dy
CONFIG_NET_SCH_GRED=3Dy
CONFIG_NET_SCH_DSMARK=3Dy
# CONFIG_NET_SCH_NETEM is not set
CONFIG_NET_SCH_INGRESS=3Dy
CONFIG_NET_QOS=3Dy
CONFIG_NET_ESTIMATOR=3Dy
CONFIG_NET_CLS=3Dy
CONFIG_NET_CLS_TCINDEX=3Dy
CONFIG_NET_CLS_ROUTE4=3Dy
CONFIG_NET_CLS_ROUTE=3Dy
CONFIG_NET_CLS_FW=3Dy
CONFIG_NET_CLS_U32=3Dy
CONFIG_CLS_U32_PERF=3Dy
CONFIG_NET_CLS_IND=3Dy
CONFIG_NET_CLS_RSVP=3Dy
CONFIG_NET_CLS_RSVP6=3Dy
CONFIG_NET_CLS_ACT=3Dy
CONFIG_NET_ACT_POLICE=3Dy
CONFIG_NET_ACT_GACT=3Dy
CONFIG_GACT_PROB=3Dy

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NETPOLL is not set
# CONFIG_NET_POLL_CONTROLLER is not set
# CONFIG_HAMRADIO is not set
# CONFIG_IRDA is not set
# CONFIG_BT is not set
CONFIG_NETDEVICES=3Dy
CONFIG_DUMMY=3Dy
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set
# CONFIG_NET_SB1000 is not set

#
# ARCnet devices
#
# CONFIG_ARCNET is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=3Dy
CONFIG_MII=3Dy
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
CONFIG_NET_VENDOR_3COM=3Dy
# CONFIG_EL1 is not set
# CONFIG_EL2 is not set
# CONFIG_ELPLUS is not set
# CONFIG_EL16 is not set
# CONFIG_EL3 is not set
# CONFIG_3C515 is not set
CONFIG_VORTEX=3Dy=20
CONFIG_TYPHOON=3Dy
# CONFIG_LANCE is not set
# CONFIG_NET_VENDOR_SMC is not set
# CONFIG_NET_VENDOR_RACAL is not set

#=20
# Tulip family network device support
#=20
# CONFIG_NET_TULIP is not set
# CONFIG_AT1700 is not set=20
# CONFIG_DEPCA is not set
# CONFIG_HP100 is not set
# CONFIG_NET_ISA is not set
CONFIG_NET_PCI=3Dy
# CONFIG_PCNET32 is not set
# CONFIG_AMD8111_ETH is not set
# CONFIG_ADAPTEC_STARFIRE is not set
# CONFIG_AC3200 is not set
# CONFIG_APRICOT is not set=20
# CONFIG_B44 is not set
# CONFIG_FORCEDETH is not set
# CONFIG_CS89x0 is not set
# CONFIG_DGRS is not set
CONFIG_EEPRO100=3Dy
# CONFIG_EEPRO100_PIO is not set
CONFIG_E100=3Dy
# CONFIG_E100_NAPI is not set
# CONFIG_FEALNX is not set
# CONFIG_NATSEMI is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_SIS900 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SUNDANCE is not set
# CONFIG_TLAN is not set
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
# CONFIG_NET_POCKET is not set



If you made it this far, I *really* appreciate it.  Hopefully the
information was useful=20

Sincerely,
Patrick Bennett Hagen


