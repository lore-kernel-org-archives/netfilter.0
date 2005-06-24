From: "Nicolas Olivier" <nolivier@alphalink.fr>
Subject: ip_conntrack_ftp
Date: Fri, 24 Jun 2005 10:01:42 +0200
Message-ID: <42BBBDE6.9040108@alphalink.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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


Hi,

I've got the following architecture:


customer-1                                  rt-1                                      rt-2
 ______                                    ______ 10.0.0.2/30            10.0.0.1/30 ______
|      |                                  |      |__________________________________|      |
|      |172.16.0.2/30        172.16.0.1/30|      |nas1                        nas1  |      |
|      |___________/  ...  /______________|      |                                  |      |
|      | whatever                    nas0 |      |10.0.0.5/30            10.0.0.6/30|      |
|      |                                  |      |__________________________________|      |
|______|                                  |______|eth1                         eth1 |______|
                                       eth0  |
                               10.10.60.23/24|
                                             |

So customer-1 is connected to to rt-1 over ATM via a br2684.

When nas0 is created, the following is done:

ifconfig nas0 172.16.0.1 netmask 255.255.255.252 broadcast 172.16.0.3
ip route add table 1 172.16.0.0/30 dev nas0 proto static scope link src 172.16.0.1
ip route del 172.16.0.0/30 dev nas0 proto kernel scope link src 172.16.0.1
ip rule add dev nas0 lookup 1

For nas1:

ifconfig nas1 10.0.0.2 netmask 255.255.255.252 broadcast 10.0.0.3
ip route add default via 10.0.0.1 dev nas1 table 1
ip route del 10.0.0.0/30 dev nas1 proto kernel scope link src 10.0.0.2
ip route add table 1 10.0.0.0/30 dev nas1 proto static scope link src 10.0.0.2
ip rule add dev nas1 lookup 1
ip route del local 10.0.0.2 dev nas1 proto kernel scope host src 10.0.0.2
ip neighbour add 10.0.0.2 lladdr `ifmacget nas1` nud permanent dev nas1

ifmacget is a small binary returning the MAC address of the interface.

Idea behind this is to isolate customers related interfaces from main routing table in their own routing table.
So traffic comes from customers, goes through rt-1 via their dedicated routing table. It can goes to other customers that are isolated in that routing
table or goes through rt-2 via nas1.
rt-2 does its own stuff, like QoS or whatever. The point is that Internet related traffic goes back from rt-2 to rt-1 via the sub 10.0.0.4/30, and
then goes out via eth0.

So everything works like a charm in this architecture, except conntrack on active ftp.

I'm on customer-1, running a ftp client (lftp was used for the test) to connect to 1.1.1.1. Logging is correct, but when sending command fails, and
the ftp client runs a timer to try again sendind the command. After this first attempt, conntrack table contains those entries:

tcp      6 115 TIME_WAIT src=10.0.0.2 dst=1.1.1.1 sport=35045 dport=21 src=1.1.1.1 dst=10.10.60.23 sport=21 dport=1024 [ASSURED] use=1 mark=0
tcp      6 115 TIME_WAIT src=172.16.0.2 dst=1.1.1.1 sport=35045 dport=21 src=1.1.1.1 dst=10.0.0.2 sport=21 dport=35045 [ASSURED] use=1 mark=0

Then, when the timer fired, the command runs well, and everything works perfect. Those are the entries just after, the connection and a ls:

tcp      6 431996 ESTABLISHED src=10.0.0.2 dst=1.1.1.1 sport=35047 dport=21 src=1.1.1.1 dst=10.10.60.23 sport=21 dport=1025 [ASSURED] use=1
mark=0
tcp      6 116 TIME_WAIT src=10.0.0.2 dst=1.1.1.1 sport=35048 dport=42135 src=1.1.1.1 dst=10.10.60.23 sport=42135 dport=1025 [ASSURED] use=1
mark=0
tcp      6 116 TIME_WAIT src=172.16.0.2 dst=1.1.1.1 sport=35048 dport=42135 src=1.1.1.1 dst=10.0.0.2 sport=42135 dport=35048 [ASSURED] use=1
mark=0
tcp      6 431996 ESTABLISHED src=172.16.0.2 dst=1.1.1.1 sport=35047 dport=21 src=1.1.1.1 dst=10.0.0.2 sport=21 dport=35047 [ASSURED] use=1
mark=0
tcp      6 86 TIME_WAIT src=10.0.0.2 dst=1.1.1.1 sport=35045 dport=21 src=1.1.1.1 dst=10.10.60.23 sport=21 dport=1024 [ASSURED] use=1 mark=0
tcp      6 86 TIME_WAIT src=172.16.0.2 dst=1.1.1.1 sport=35045 dport=21 src=1.1.1.1 dst=10.0.0.2 sport=21 dport=35045 [ASSURED] use=1 mark=0

For me, it seems that the problem is due to ftp connection coming on rt-1 twice, but as other traffic runs well I'm a bit lost and I haven't got
enough knowledge in netfilter to fix this.
Any help or advice would be greatly appreciated, and if I was not clear enough, don't hesitate.
Thanks in advance.

Nicolas Olivier



