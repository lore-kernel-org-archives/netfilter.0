From: "Bill Hance" <bill@billhance.com>
Subject: incrementing TTL in firewall
Date: Mon, 7 Nov 2005 18:21:16 -0500 (EST)
Message-ID: <3591.192.168.3.8.1131405676.squirrel@192.168.3.8>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Greetings,

  I am trying to "hide" my firewall from showing up on traceroutes, but
want my network to be pingable.  So, I've forwarded icmp type 8 through
the firewall to a host that will do the echo replying.

  As you can see below, when I omit the "1" from the command, I get a
message to specify a value.  But when I add "1" as the value, I get a
"No chain/target/match by that name" error...

  Any help would be appreciated.

 -Bill




[root@BULLDOG /]# uname -r
2.4.20-6
[root@BULLDOG /]# rpm -q iptables
iptables-1.2.7a-2
[root@BULLDOG /]#
[root@BULLDOG /]# iptables -t mangle -L -n -v
Chain PREROUTING (policy ACCEPT 56522 packets, 32M bytes)
 pkts bytes target     prot opt in     out     source              
destination

Chain INPUT (policy ACCEPT 14410 packets, 919K bytes)
 pkts bytes target     prot opt in     out     source              
destination

Chain FORWARD (policy ACCEPT 42112 packets, 31M bytes)
 pkts bytes target     prot opt in     out     source              
destination

Chain OUTPUT (policy ACCEPT 13576 packets, 1318K bytes)
 pkts bytes target     prot opt in     out     source              
destination

Chain POSTROUTING (policy ACCEPT 55687 packets, 32M bytes)
 pkts bytes target     prot opt in     out     source              
destination
[root@BULLDOG /]#
[root@BULLDOG /]#
[root@BULLDOG /]#
[root@BULLDOG /]# iptables -t mangle -A PREROUTING -j TTL --ttl-inc
iptables v1.2.7a: TTL: You must specify a value
Try `iptables -h' or 'iptables --help' for more information.
[root@BULLDOG /]#
[root@BULLDOG /]# iptables -t mangle -A PREROUTING -j TTL --ttl-inc 1
iptables: No chain/target/match by that name
[root@BULLDOG /]#
[root@BULLDOG /]#







