From: Carol Anne Ogdin <caogdin@deepwoods.com>
Subject: Intermittent Connections Through ip & iptables (RTF)
Date: Fri, 18 Apr 2003 08:44:28 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFBD4ED283.BF2AB255-ON88256D0B.0074DDE4-88256D0C.00567813@deepwoods.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have reached the limits of my knowledge of TCP/IP.  I have tried to
understand RedHat 7.3 with iproute2-ss010824 and iptables 1.2.5.  What
I have is an intermittent condition where, sometimes, external hosts
can't reach my internal hosts.  I've successfully simplified the prob-
lem down to a repeatable case.

The data below shows a configuration that is not yet secure; I don't
dare "tighten it down" until I have it working reliably.  So, I've
obscured all the ip address ranges in this post.

If you go to http://www.alertra.com and do a "Spot Check" on
http://www.deepwoods.com you'll probably see a report that shows
 some of Alertra's servers can reach my site, but others can't.
For example, I recently did a test using http://bb.bb.bb.27 (a
special IP address to that server that I use only for testing;
it has no associated domain name) and it showed the following results:

http://bb.bb.bb.27
Time (US/Pacific)   Checked From     Result Bytes Seconds
04/17/2003 11:32:27 Detroit USA         OK  26394  1.641
04/17/2003 11:32:56 Frankfurt GERMANY ERROR  N/A  30.023
04/17/2003 11:32:29 London UK           OK  26394  2.556
04/17/2003 11:32:56 Los Angeles USA   ERROR  N/A  30.028
04/17/2003 11:32:56 Montreal CANADA   ERROR  N/A  30.026
04/17/2003 11:32:28 Oklahoma City USA   OK  26394  2.127
Average Response Time: 16.067 Seconds

So, three of their servers get the web page, but three don't
 (and, if you check a public site, like google.com, all servers
 will report "OK").

Here is my router/firewall configuration.  I've followed Bert
Hubert's excellent LARTC "4.2.1 Split access" recommendations for
a dual-DSL environment (and I hope I've done so correctly).

aa.aa.aa.24/29 is WAN1 (DSL Service #1) on eth1
bb.bb.bb.0/29  is WAN2 (DSL Service #2) on eth2
cc.cc.cc.0/24  is LAN  (internal address space) on eth0
cc.cc.cc.12/31 is an SMTP and Lotus Notes server (port 1352)
cc.cc.cc.54/31 is an IIS5 server
cc.cc.cc.64/26 is the LAN's DHCP range (i.e., workstations)
cc.cc.cc.11    is the Router/Firewall

~~~~~~~~~Certain key kernel values~~~~~~~~~~
/proc/sys/net/ipv4/ip_forward = 1
/proc/sys/net/ipv4/conf/all/rp_filter = 0
/proc/sys/net/ipv4/conf/default/rp_filter = 0
/proc/sys/net/ipv4/conf/eth0/rp_filter = 0
/proc/sys/net/ipv4/conf/eth1/rp_filter = 0
/proc/sys/net/ipv4/conf/eth2/rp_filter = 0
/proc/sys/net/ipv4/conf/lo/rp_filter = 0
/proc/sys/net/ipv4/route/gc_timeout = 60
/proc/sys/net/ipv4/route/gc_interval = 60

~~~~~~~~~~~~~~Device Addresses~~~~~~~~~~~~~ip addr show:
   1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue
       inet 127.0.0.1/8 brd 127.255.255.255 scope host lo
   2: eth0: <BROADCAST,MULTICAST,PROMISC,UP> mtu 1500 qdisc pfifo_fast qlen
100
       inet cc.cc.cc.11/24 brd cc.cc.cc.255 scope global eth0
   3: eth1: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
       inet aa.aa.aa.0/29 brd aa.aa.aa.7 scope global eth1
       inet aa.aa.aa.2/32 scope global eth1
       inet aa.aa.aa.3/32 scope global eth1
       inet aa.aa.aa.4/32 scope global eth1
   4: eth2: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
       inet bb.bb.bb.24/29 brd bb.bb.bb.31 scope global eth2
       inet bb.bb.bb.26/32 scope global eth2
       inet bb.bb.bb.27/32 scope global eth2
       inet bb.bb.bb.28/32 scope global eth2

~~~~~~~~~~~~~~~~~~Routes~~~~~~~~~~~~~~~~~~~ip route list:
   aa.aa.aa.0/29 dev eth1  scope link  src aa.aa.aa.0
   bb.bb.bb.24/29 dev eth2  scope link  src bb.bb.bb.24
   cc.cc.cc.0/24 dev eth0  scope link
   127.0.0.0/8 dev lo  scope link
#per LARTC HOWTO 4.2.2 load balancing
   default
      nexthop via aa.aa.aa.1  dev eth1 weight 1
      nexthop via bb.bb.bb.25  dev eth2 weight 1

~~~~~~~~~~~~~~~Routing Rules~~~~~~~~~~~~~~~ip rule list:
       0:   from all lookup local
   32764:   from bb.bb.bb.24/29 lookup WAN2
   32765:   from aa.aa.aa.0/29 lookup WAN1
   32766:   from all lookup main
   32767:   from all lookup default

~~~~~~~~~~~~~~~~Routing Tables~~~~~~~~~~~~~ip route list table WAN*
#per LARTC HOWTO 4.2.1 Split access
  table WAN1:
   aa.aa.aa.0/29 dev eth1  scope link  src aa.aa.aa.0
   cc.cc.cc.0/24 dev eth0  scope link
   127.0.0.0/8 dev lo  scope link
  table WAN2:
   bb.bb.bb.24/29 dev eth2  scope link  src bb.bb.bb.24
   cc.cc.cc.0/24 dev eth0  scope link
   127.0.0.0/8 dev lo  scope link

~~~~~~~~~~~~~~~NAT Rules~~~~~~~~~~~~~~~~~~~iptables -t nat -L -n:
   Chain PREROUTING (policy ACCEPT)
   target prot opt source     destination
# Map all external addresses to internal servers
   DNAT   tcp  --  0.0.0.0/0  aa.aa.aa.2   multiport dports 25,1352
to:cc.cc.cc.12
   DNAT   tcp  --  0.0.0.0/0  bb.bb.bb.26  multiport dports 25,1352
to:cc.cc.cc.13
   DNAT   tcp  --  0.0.0.0/0  aa.aa.aa.3   multiport dports 80,443
to:cc.cc.cc.54
   DNAT   tcp  --  0.0.0.0/0  bb.bb.bb.27  multiport dports 80,443
to:cc.cc.cc.55
# Map any non-tcp stuff to the router/firewall (for testing; allow ping,
etc.)
   DNAT  !tcp  --  0.0.0.0/0  aa.aa.aa.4   to:cc.cc.cc.11
   DNAT  !tcp  --  0.0.0.0/0  bb.bb.bb.28  to:cc.cc.cc.11

   Chain POSTROUTING (policy ACCEPT)
   target prot opt source     destination
   SNAT   all  --  0.0.0.0/0  0.0.0.0/0    to:aa.aa.aa.6
   SNAT   all  --  0.0.0.0/0  0.0.0.0/0    to:bb.bb.bb.30
# Allow internal users to access IIS website through SNAT/DNAT
   SNAT   tcp  --  cc.cc.cc.64/26  cc.cc.cc.54/31  multiport dports 80,443
to:cc.cc.cc.11

~~~~~~~~~~~~~Firewall Rules~~~~~~~~~~~~~~~~~iptables -L -n | colrm:
   Chain INPUT (policy DROP)
   target prot opt source     destination
   ACCEPT all  --  0.0.0.0/0  0.0.0.0/0
   DROP   all  --  0.0.0.0/0  0.0.0.0/0     state INVALID
   ACCEPT all  -f  0.0.0.0/0  0.0.0.0/0
   ACCEPT all  --  0.0.0.0/0  0.0.0.0/0     state NEW
   ACCEPT all  --  0.0.0.0/0  0.0.0.0/0     state RELATED,ESTABLISHED
# Gate traffic from external addresses to Apache server
   ACCEPT tcp  --  0.0.0.0/0  aa.aa.aa.4    multiport dports 80,443
   ACCEPT tcp  --  0.0.0.0/0  bb.bb.bb.28   multiport dports 80,443
# Allow ping tests (for now)
   ACCEPT icmp --  0.0.0.0/0  cc.cc.cc.11   icmp type 0
# Allow internal admins to connect to router/firewall via SSH
   ACCEPT tcp  --  cc.cc.cc.64/26 0.0.0.0/0 tcp dpt:22

   Chain FORWARD (policy DROP)
   target prot opt source     destination
   DROP   all  --  0.0.0.0/0  0.0.0.0/0       state INVALID
   ACCEPT all  -f  0.0.0.0/0  0.0.0.0/0
   ACCEPT all  --  0.0.0.0/0  0.0.0.0/0       state NEW
   ACCEPT all  --  0.0.0.0/0  0.0.0.0/0       state RELATED,ESTABLISHED
# Allow SMTP and Lotus Notes
   ACCEPT tcp  --  0.0.0.0/0  cc.cc.cc.12/31  multiport dports 25,1352
# Allow web site visitors
   ACCEPT tcp  --  0.0.0.0/0  cc.cc.cc.54/31  multiport dports 80,443

   Chain OUTPUT (policy ACCEPT)
   target prot opt source     destination
   ACCEPT all  --  0.0.0.0/0  0.0.0.0/0

To diagnose the problem, I set up a tcpdump monitor on all Ethernet
ports of my router, and then I did a SpotCheck on http://bb.bb.bb.27
(the unpublished IP address for http://www.deepwoods.com, so it's
easier to trace in logs).  Alertra's SpotCheck gave me a summary
(above) with three "OK" and three "ERROR" reports.

Then, I took the tcpdump output and sorted into six different packet
threads, based on Alertra' servers' addresses (too much to include here)

Let me show just one example of an "ERROR' packet sequence:  I have
interspersed my own comments with tcpdump data
#  Time       From                       To       (Packet info)
1      #An Alertra host initiates a SYN to our DSL Router...
   26.455171  g95-120.citenet.net.4545   w027.dsl.(myDSL).http
                     (S 847849283:847849283(0) win 5840
                       <mss 1460,sackOK,timestamp 543018938 0,nop,wscale
0>)
2      #...and that packet is NAT'd, to an internal web server
   26.455354  g95-120.citenet.net.4545   cc.cc.cc.55.http
                     (S 847849283:847849283(0) win 5840
                       <mss 1460,sackOK,timestamp 543018938 0,nop,wscale
0>)
3      #Our web server sends back SYN/ACK...
   26.455622  cc.cc.cc.55.http           g95-120.citenet.net.4545
                     (S 3655927565:3655927565(0) ack 847849284
                       win 64240 <mss 1460,nop,wscale 2,nop,nop,sackOK>)
4      #...and that packet is de-NAT'd on the way back out
   26.455723  w027.dsl.(myDSL).http     g95-120.citenet.net.4545
                     (S 3655927565:3655927565(0) ack 847849284 win 64240
                       <mss 1460,nop,wscale 2,nop,nop,sackOK>)
5      #Three seconds later, without responding to our SYN/ACK, the
                      remote host initiates another SYN sequence...
   29.449171  g95-120.citenet.net.4545  w027.dsl.(myDSL).http
                     (S 847849283:847849283(0) win 5840
                       <mss 1460,sackOK,timestamp 543019238 0,nop,wscale
0>)
6      #...that is NAT'd to our webserver
   29.449295  g95-120.citenet.net.4545  cc.cc.cc.55.http
                     (S 847849283:847849283(0) win 5840
                       <mss 1460,sackOK,timestamp 543019238 0,nop,wscale
0>)
7      #Our server responds ACK... (??? is this the source of the error
???)
   29.449547  cc.cc.cc.55.http          g95-120.citenet.net.4545
                     (. ack 1 win 64240)
8      #...which is de-NAT's back out to Alertra's host
   29.449619  w027.dsl.(myDSL).http     g95-120.citenet.net.4545
                     (. ack 1 win 64240)
9      #Our web server responds to the renewed initial SYN at #5, above...
   29.455217  cc.cc.cc.55.http          g95-120.citenet.net.4545
                     (S 3655927565:3655927565(0) ack 847849284
                       win 64240 <mss 1460,nop,wscale 2,nop,nop,sackOK>)
10     #...which is de-NAT's back out to Alertra's host
  29.455299  w027.dsl.(myDSL).http      g95-120.citenet.net.4545
                     (S 3655927565:3655927565(0) ack 847849284
                       win 64240 <mss 1460,nop,wscale 2,nop,nop,sackOK>)
11     #And Alertra's host, again, attempts to initiate a new
                                           connection with a SYN
  35.44921   g95-120.citenet.net.4545   w027.dsl.(myDSL).http
                     (S 847849283:847849283(0) win 5840
                       <mss 1460,sackOK,timestamp 543019838 0,nop,wscale
0>)

---------|---------|---------|---------|---------|---------|---------|
This exact same pattern appears in the other two "ERROR" connections
(as reported in the spreadsheet).  The same "lost SYN/ACK".  I cannot
determine whether (perhaps) that SYN/ACK is not being sent out on the
DSL line, is not being accepted because of some error at the Alertra
host, or is getting "lost in the cloud."  However, I suspect it's some
obvious, glaring error on my part due to a void in my understanding.

I have virtually ruled out Alertra's hosts as the problem (testing
with, say, http://www.google.com, works fine), and of the six hosts
they use, some report "OK" and some report "ERROR" every time...and
the hosts reporting "ERROR" change with each test.  It seems, sometimes,
 as if my router will accept the first three and then fail the rest...
all on this apparent inability to reliably get the SYN/ACK back to a
connection originator.

I'm hoping that one of you has the experience to see an clear and
evident error or absence in my configuration (or perhaps know of a bug
in one of the product versions I'm using that would commend updating)
and can guide me to a solution to this plaguing problem.

Any help would be most appreciated.

--Carol Anne



