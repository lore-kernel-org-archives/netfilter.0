From: "Thhoep" <thhoep@gmx.de>
Subject: iproute2 and fwmark usage
Date: Thu, 8 Jan 2004 15:31:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c3d5f4$0ad343e0$1684188d@Kiste>
References: <BAY10-F90LqDkgyDzS20002923f@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

hi,

i have problems with the usage if netfilter marks in connection with
advanced routing using the iproute2 package. standing alone and using its
(lousy) inbuilt filter thingy iproute works normal, but trying to use
netfilter marks for routing decisions some pretty odd things happen. see for
yourself.


Routing tables (for this case uninteresting tables left out):

 router:~# ip route show table test
 217.5.98.133 dev ppp4  scope link  src 80.144.178.206
 192.168.0.0/24 dev eth4  scope link
 default via 217.5.98.133 dev ppp4

 router:~# ip route show table offline
 192.168.0.0/24 dev eth4  scope link
 unreachable default

 router:~# ip route show table main
 217.5.98.133 dev ppp0  proto kernel  scope link  src 80.144.190.200
 217.5.98.133 dev ppp1  proto kernel  scope link  src 80.144.188.142
 217.5.98.133 dev ppp2  proto kernel  scope link  src 80.144.179.55
 217.5.98.133 dev ppp5  proto kernel  scope link  src 80.144.184.186
 217.5.98.133 dev ppp4  proto kernel  scope link  src 80.144.178.206
 217.5.98.133 dev ppp3  proto kernel  scope link  src 80.144.188.180
 192.168.0.0/24 dev eth4  scope link
 default via 217.5.98.133 dev ppp0

Routing policies (for this case uninteresting rules left out):

 router:~# ip rule
 0:      from all lookup local
 1000:    from all fwmark        1 lookup test
 2000:   from 192.168.0.0/24 lookup offline
 32766:  from all lookup main
 32767:  from all lookup default

Netfilter configuration (for this case uninteresting rules left out,
uninteresting chain counters zeroed):

 - filter chains empty, policies = ACCEPT

 router:~# iptables -t nat -L -n -x -v
 Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source
destination

 Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source
destination
     0   0 MASQUERADE  all  --  *      ppp4    0.0.0.0/0
0.0.0.0/0

 Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source
destination


 router:~# iptables -t mangle -L -n -x -v
 Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source
destination
      0    0 MARK       all  --  eth4   *       192.168.0.22
141.24.12.2/0          MARK set 0x1

 Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source
destination

 Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source
destination

 Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source
destination

 Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source
destination

the test:

 i ran a ping on my internal host 192.168.0.22 to a known external host
141.24.12.2.

 iptables shows, that the requests get marked correctly. for testing reasons
added just counting rules also show, that replies are getting in but dont
reach the FORWARD chain. so i assume they get lost while doing the routing.

  router:~# iptables -t mangle -L -n -x -v -Z
  Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
destination
         2      120            all  --  ppp4   *       141.24.12.2
0.0.0.0/0
         2      120 MARK       all  --  eth4   *       192.168.0.22
141.24.12.2        MARK set 0x1

  Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
destination

  Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
destination
         0        0            all  --  ppp4   *       141.24.12.2
0.0.0.0/0

  Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
destination

  Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
destination
         0        0            all  --  *      eth4    141.24.12.2
0.0.0.0/0

 tcpdump verifies, that indeed replies are coming in and shows, that no icmp
error messages are sent out, what should be the case if no route back could
be found due to incorrect routing.

  router:~# tcpdump -n -i ppp4
  tcpdump: listening on ppp4
  15:06:59.512539 80.144.178.206 > 141.24.12.2: icmp: echo request
  15:06:59.579680 141.24.12.2 > 80.144.178.206: icmp: echo reply (DF)

 changing from "fwmark" usage to the inbuilt filter of iproute the routing
works absolutely fine.

  router:~# ip rule del fwmark 1
  router:~# ip rule add from 192.168.0.22 table test

  <doing some pings from the internal host>

  router:~# iptables -t mangle -L -n -x -v -Z
  Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
destination
         4      240            all  --  ppp4   *       141.24.12.2
0.0.0.0/0
         4      240 MARK       all  --  eth4   *       192.168.0.22
141.24.12.2        MARK set 0x1

  Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
destination

  Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
destination
         4      240            all  --  ppp4   *       141.24.12.2
0.0.0.0/0

  Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
destination

  Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
destination
         4      500            all  --  *      eth4    141.24.12.2
0.0.0.0/0

router:~# iptables
iptables v1.2.6a: no command specified
Try `iptables -h' or 'iptables --help' for more information.
router:~# ip -V
ip utility, iproute2-ss010824
router:~# cat /proc/version
Linux version 2.4.22 (root@dslrouter) (gcc version 2.95.4 20011002 (Debian
prerelease)) #1 SMP Wed Nov 12 23:08:31 CET 2003


i am grateful for any help. thanks.

thomas hoeppler


