From: "Steve Wakelin" <steve@wcsl.net>
Subject: Iptables and uplink bonding
Date: Sat, 26 Jun 2004 00:15:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <267354A234DF4D46AA6AE56E1240BEF0A486@tv.wcslnet.net>
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

Hello,

Kernel 2.4.26
Iptables 1.2.11
Nth patch
Route patch

I am trying to configure a machine that will allow per packet load
balancing to effectively double the throughput of an FTP connection.

I have managed to get FTP connectivity to the destination server from
the load balancing machine but gtrellm only shows 15Kbs maximum
throughput.

I cannot connect from the client machine even though I can ping the
destination server.

Test environment

2 RHL FC1 Servers with CBQ on outgoing interface to limit to 256Kbs to
simulate ADSL modem/routers (G1 and G2)

1 XP Client machine (C1)

1 Loadbalance server (LB)

1 Destination FTP RHL FC1 - FTP

Addressing

C1 10.15.1.5/24 gw 10.15.1.1
G1 Internal: 192.168.253.2/30 External: 192.168.2.220/24 - No NAT
G2 Internal: 192.168.252.2/30 External: 192.168.2.221/24 - No NAT

LB Internal 10.15.1.1/24
   Ext1: 192.168.253.1/30
   Ext2: 192.168.252.2/30

FTP: 192.168.2.2/24

I have attempted to SNAT all the packets leaving eth1 and eth2 to
192.168.2.220

Current IPtables configuration

Table: mangle
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20
Chain INPUT (policy ACCEPT)
target     prot opt source               destination        =20
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination        =20
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20
ROUTE      all  --  anywhere            !10.15.1.0/24        every 2th
packet #0 ROUTE gw:192.168.253.2=20
ROUTE      all  --  anywhere            !10.15.1.0/24        every 2th
packet #1 ROUTE gw:192.168.252.2=20

Table: nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20
SNAT       all  --  10.0.0.0/8           anywhere
to:192.168.2.220=20
SNAT       all  --  10.0.0.0/8           anywhere
to:192.168.2.220=20
SNAT       all  --  192.168.253.0/30     anywhere
to:192.168.2.220=20
SNAT       all  --  192.168.253.0/30     anywhere
to:192.168.2.220=20
SNAT       all  --  192.168.252.0/30     anywhere
to:192.168.2.220=20
SNAT       all  --  192.168.252.0/30     anywhere
to:192.168.2.220=20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20

Table: filter
Chain INPUT (policy DROP)
target     prot opt source               destination        =20
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED=20
ACCEPT     all  --  anywhere             anywhere           =20
ACCEPT     tcp  --  anywhere             10.15.1.0           tcp dpt:ssh
state NEW=20
ACCEPT     tcp  --  anywhere             192.168.253.1       tcp dpt:ssh
state NEW=20
ACCEPT     tcp  --  anywhere             192.168.252.1       tcp dpt:ssh
state NEW=20
ACCEPT     all  --  10.0.0.0/8           anywhere            state NEW=20
ACCEPT     all  --  192.168.253.0/30     anywhere            state NEW=20
ACCEPT     all  --  192.168.252.0/30     anywhere            state NEW=20
RULE_2     icmp --  anywhere             anywhere            state NEW=20
RULE_3     all  --  anywhere             anywhere           =20

Chain FORWARD (policy DROP)
target     prot opt source               destination        =20
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED=20
ACCEPT     all  --  10.0.0.0/8           anywhere            state NEW=20
ACCEPT     all  --  192.168.253.0/30     anywhere            state NEW=20
ACCEPT     all  --  192.168.252.0/30     anywhere            state NEW=20
RULE_2     icmp --  anywhere             anywhere            state NEW=20
RULE_3     all  --  anywhere             anywhere           =20

Chain OUTPUT (policy DROP)
target     prot opt source               destination        =20
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED=20
ACCEPT     all  --  anywhere             anywhere           =20
ACCEPT     tcp  --  anywhere             10.15.1.0           tcp dpt:ssh
state NEW=20
ACCEPT     tcp  --  anywhere             192.168.253.1       tcp dpt:ssh
state NEW=20
ACCEPT     tcp  --  anywhere             192.168.252.1       tcp dpt:ssh
state NEW=20
ACCEPT     all  --  10.0.0.0/8           anywhere            state NEW=20
ACCEPT     all  --  192.168.253.0/30     anywhere            state NEW=20
ACCEPT     all  --  192.168.252.0/30     anywhere            state NEW=20
RULE_2     icmp --  anywhere             anywhere            state NEW=20
RULE_3     all  --  anywhere             anywhere           =20

Chain RULE_2 (3 references)
target     prot opt source               destination        =20
LOG        all  --  anywhere             anywhere            LOG level
info prefix `RULE 2 -- ACCEPT '=20
ACCEPT     all  --  anywhere             anywhere           =20

Chain RULE_3 (3 references)
target     prot opt source               destination        =20
LOG        all  --  anywhere             anywhere            LOG level
info prefix `RULE 3 -- DENY '=20
ACCEPT     all  --  anywhere             anywhere

Current output of ip route

192.168.252.0/30 dev eth2  scope link=20
192.168.253.0/30 dev eth1  scope link=20
10.15.1.0/24 dev eth0  scope link=20
169.254.0.0/16 dev eth2  scope link=20
127.0.0.0/8 dev lo  scope link=20
default=20
	nexthop via 192.168.253.2  dev eth1 weight 1
	nexthop via 192.168.252.2  dev eth2 weight 1

I have tried using MARK to mark the packets with
The nth subsystem and have created the necessary ip routing tables but
unable to get any joy.

Therefore

1. Has anyone done this?
2. Is this the right approach?
3. Has anyone managed to get MARK scenario working with nth?  If so
could you point me to an example?

I have Googled for hours, even though many people have discussed I am
yet to see a working example.

When the configuration is finalized I wish to extend to potentially 4
ADSL connections so that we can stream live multimedia to our server on
the internet.

TIA

Regards

/Steve


