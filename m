From: =?iso-8859-1?B?TGx1w61z?= Batlle i Rossell <viric@vicerveza.homeunix.net>
Subject: Problem with routing decisions, and multihop
Date: Mon, 4 Jul 2005 16:52:45 +0200
Message-ID: <20050704145245.GB10315@vicerveza>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
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
Jul  4 15:50:14 thecrow WRONG IFACE: IN= OUT=eth2 SRC=192.168.16.1
DST=216.165.191.52 LE
N=72 TOS=0x00 PREC=0x00 TTL=64 ID=9582 DF PROTO=TCP SPT=56528 DPT=6667
WINDOW=18824 RES=
0x00 ACK PSH URGP=0
Jul  4 16:01:29 thecrow WRONG IFACE: IN= OUT=eth1 SRC=192.168.17.1
DST=130.206.1.5 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=66 DF PROTO=TCP
SPT=33820 DPT=21 WINDOW=0 RES=0x00 RST URGP=0

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
130.206.1.5 via 192.168.17.2 dev eth2  src 192.168.17.1
   cache  mtu 1500 advmss 1460 metric10 64
I try the ftp:
# ftp ftp.rediris.es
And in the kernel log appears:
Jul  4 16:19:25 thecrow WRONG IFACE: IN= OUT=eth1 SRC=192.168.17.1
DST=130.206.1.5 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=43245 DF PROTO=TCP
SPT=49828 DPT=21 WINDOW=5840 RES=0x00 SYN URGP=0

Please, help... I'm desperate.

-- 
In its laws, society makes its mightiest collective effort to impose
predictability upon human behavior.
  - S. I. Hayakawa, "Language in thought and action"

