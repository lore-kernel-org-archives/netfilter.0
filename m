From: Lluis Batle <viriketo@gmail.com>
Subject: Problem with routing decisions, and multihop
Date: Mon, 4 Jul 2005 16:32:47 +0200
Message-ID: <45219fb00507040732192b77e0@mail.gmail.com>
References: <45219fb00507040715442f52cf@mail.gmail.com>
Reply-To: Lluis Batle <viriketo@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45219fb00507040715442f52cf@mail.gmail.com>
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

Hi!

I have many problems getting this thing to work. There's a host with
two network interfaces, where there are two routers to Internet in two
separated networks. The host uses multihop routing for deciding to
which router send the packets... but the routing decision is wrong
made. Some packets with source address of one NIC, go to other
network.

I have a host with three NICs in it:
eth0 - LAN, 192.168.0.0/20
eth1 192.168.16.1 - subnetwork 192.168.16.0/28, with a router
(192.168.16.2) to internet
eth2 192.168.17.1 - subnetwork 192.168.17.0/28, with another router
(192.168.17.2) to internet

The routing rules are:
0:      from all lookup local
50:     from all lookup main
201:    from 192.168.17.0/28 iif eth2 lookup 201
202:    from 192.168.16.0/28 iif eth1 lookup 202
222:    from all lookup 222
32766:  from all lookup main
32767:  from all lookup default

The table 'main':
192.168.17.0/28 dev eth2  proto kernel  scope link  src 192.168.17.1
192.168.16.0/28 dev eth1  proto kernel  scope link  src 192.168.16.1
192.168.0.0/20 dev eth0  proto kernel  scope link  src 192.168.1.2

The table '201':
default via 192.168.17.2 dev eth2  proto static  src 192.168.17.1
prohibit default  proto static  metric 1

The table '202':
default via 192.168.16.2 dev eth1  proto static  src 192.168.16.1
prohibit default  proto static  metric 1

The table '222', where there is the multihop gateway specification:

default equalize
        nexthop via 192.168.16.2  dev eth1 weight 1
        nexthop via 192.168.17.2  dev eth2 weight 1

I've added the following packet LOG lines into 'mangle' table, for
knowing when the "WRONG INTERFACE" decision is being made:
Chain POSTROUTING (policy ACCEPT 329K packets, 93M bytes)
 pkts bytes target     prot opt in     out     source
destination
    2    80 LOG        all  --  any    eth1    192.168.17.1
anywhere            LOG level warning ip-options prefix `WRONG IFACE:
'
    0     0 LOG        all  --  any    eth2    192.168.16.1
anywhere            LOG level warning ip-options prefix `WRONG IFACE:
'

(Don't look at counters; right now, for getting good internet access,
I'm not using multihop)

So, often appears in the kernel log, specially with 'ftp' and 'ssh'
connections (and rarely with www connections):
Jul  4 15:50:14 thecrow WRONG IFACE: IN=3D OUT=3Deth2 SRC=3D192.168.16.1
DST=3D216.165.191.52 LE
N=3D72 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D9582 DF PROTO=3DTCP SPT=3D56528=
 DPT=3D6667
WINDOW=3D18824 RES=3D
0x00 ACK PSH URGP=3D0
Jul  4 16:01:29 thecrow WRONG IFACE: IN=3D OUT=3Deth1 SRC=3D192.168.17.1
DST=3D130.206.1.5 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D66 DF PROTO=
=3DTCP
SPT=3D33820 DPT=3D21 WINDOW=3D0 RES=3D0x00 RST URGP=3D0

Even though, when I use 'tcpdump' for catching the wrong packets (that
is: tcpdump -i eth1 host 192.168.17.1  _or_ tcpdump -i eth2 host
192.168.16.1 ) results that _A LOT MORE PACKETS_ are BADLY ROUTED,
than sent to the LOG target.

My conclusion: iptables 'matching' doesn't work; also does the route
decision part.

I absolutely don't know what more to do... I'm running iptables
v1.2.11, and kernel 2.6.11-gentoo-r11. Exactly same happened with
kernel 2.4.28-gentoo. :(

For example, here is a test. I want to ftp to "ftp.rediris.es". I look
which would be the route:
# ip route get 130.206.1.5
130.206.1.5 via 192.168.17.2 dev eth2  src 192.168.17.1=20
    cache  mtu 1500 advmss 1460 metric10 64
I try the ftp:
# ftp ftp.rediris.es
And in the kernel log appears:
Jul  4 16:19:25 thecrow WRONG IFACE: IN=3D OUT=3Deth1 SRC=3D192.168.17.1
DST=3D130.206.1.5 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D43245 DF PR=
OTO=3DTCP
SPT=3D49828 DPT=3D21 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0


Please, help... I'm desperate.

