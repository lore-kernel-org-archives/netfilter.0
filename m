From: "C Kadziolka" <c_kadziolka@poczta.fm>
Subject: Some more help with iptables and DNAT
Date: Sat, 17 Apr 2004 01:30:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005701c4240a$d89d31f0$0a02a8c0@wacko6tr80mjb7>
References: <003101c423eb$fe5d2360$0a02a8c0@wacko6tr80mjb7> <200404162057.40638.Antony@Soft-Solutions.co.uk>
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

Hello,

Thanks for such a quick response. Ive managed to fix the problem
I was having, but now i have a new problem.

My problem is this. I can port forward incomming connections from one
port to a different port on the server.  I can do this using the PREROUTING
chain in the nat table, as is described on many places in the internet.
However
my problems start when i try to port forward the incomming connections to
an ip address for a machine behind the server. For some reason, the same
command to forward the packets but with a different --to-destination
parameter
means that the connections dont get forwarded.

To complicate things slightly, the server has 4 active network connections,
2 ethernet subnets, 1 modem dialup which uses private static ip addresses,
and 1 internet dsl connection. I am trying to forward the packets to
the ip address on the remote end of the dialup connection.  The server
is running masquerading to share the internet connection. To test the
inbound port-routing, i am using a webpage which remotely connects to a
specified port on my internet-visible ip address.

The server is running Slackware 9.0 with kernel v2.4.22.

I have been running tcpdump, and i can definately confirm that the
connection
is attempting to be established on the proper port on the server. From
there,
I believe that no response is being sent, which causes the incoming
connection to timeout
and try again (3 times and then the remote client bails saying that it
cannot
connect and suggests that a stealth proxy is running).

Again, I think im using a pretty standard iptables command:
iptables -t nat -A PREROUTING -p tcp --dport 3900 -j DNAT --to-destination
192.168.2.10:3900

I have also attached some information from my server, which might be useful.

I would really appreciate any help anyone can give me.

Thanks in advance,

Craig.


------------ System information ------------

ifconfig:

eth0      Link encap:Ethernet  HWaddr 00:40:F4:86:55:2E
          inet addr:192.168.0.1  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:23398 errors:0 dropped:0 overruns:0 frame:0
          TX packets:33788 errors:0 dropped:0 overruns:0 carrier:0
          collisions:3 txqueuelen:100
          RX bytes:2122188 (2.0 Mb)  TX bytes:39166553 (37.3 Mb)
          Interrupt:11 Base address:0x1000

eth1      Link encap:Ethernet  HWaddr 00:E0:4C:01:A1:84
          inet addr:192.168.1.1  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:62245 errors:0 dropped:0 overruns:0 frame:0
          TX packets:87649 errors:11604 dropped:0 overruns:2 carrier:23208
          collisions:2956 txqueuelen:100
          RX bytes:5862383 (5.5 Mb)  TX bytes:86222496 (82.2 Mb)
          Interrupt:12 Base address:0x3000

eth2      Link encap:Ethernet  HWaddr 00:60:4C:1C:2D:EC
          inet addr:192.168.60.30  Bcast:192.168.60.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:176671 errors:0 dropped:0 overruns:0 frame:0
          TX packets:136768 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:163993037 (156.3 Mb)  TX bytes:11974274 (11.4 Mb)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:7 errors:0 dropped:0 overruns:0 frame:0
          TX packets:7 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:660 (660.0 b)  TX bytes:660 (660.0 b)

ppp0      Link encap:Point-to-Point Protocol
          inet addr:83.27.138.221  P-t-P:213.25.2.41  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1400  Metric:1
          RX packets:175366 errors:0 dropped:0 overruns:0 frame:0
          TX packets:135463 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:160802474 (153.3 Mb)  TX bytes:9228418 (8.8 Mb)

ppp1      Link encap:Point-to-Point Protocol
          inet addr:192.168.2.1  P-t-P:192.168.2.10  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:542  Metric:1
          RX packets:57713 errors:470 dropped:0 overruns:0 frame:0
          TX packets:56396 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:3087788 (2.9 Mb)  TX bytes:25698876 (24.5 Mb)

iptables -L:

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy DROP)
target     prot opt source               destination
TCPMSS     tcp  --  anywhere             anywhere           tcp
flags:SYN,RST/SYN TCPMSS clamp to PMTU
TCPMSS     tcp  --  anywhere             anywhere           tcp
flags:SYN,RST/SYN TCPMSS clamp to PMTU
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


iptables -L -t nat:

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             anywhere           tcp dpt:udt_os
to:192.168.2.10:3900

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination




