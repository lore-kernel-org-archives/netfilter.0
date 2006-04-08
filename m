From: richard lucassen <mailinglists@lucassen.org>
Subject: NATed packets only enter the default routing table
Date: Sat, 8 Apr 2006 19:40:58 +0200
Message-ID: <20060408194058.71fa3e09.mailinglists@lucassen.org>
Reply-To: netfilter@lists.netfilter.org
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

(copy from lartc mailinglist)

I set up this config:

 +------+
-+ ISP1 +--+
 +------+  |  +-------+
           +--+ linux |
 +------+  |  +-------+
-+ ISP2 +--+
 +------+

No problem. Standard setup with two ISP's. Both routed subnets. Default
gateway is ISP1. No magic here.

Now I put a server behind the Linux box. I want the server to be
reachable on an /extra/ IP in the routed subnet of ISP2.

 +------+
-+ ISP1 +--+
 +------+  |  +-------+  +-----------------+
           +--+ linux +--+ server 10.0.0.2 |
 +------+  |  +-------+  +-----------------+
-+ ISP2 +--+
 +------+

router ISP2: 1.2.3.1/24
dev ISP2: eth1
Linux box eth1: 1.2.3.2/24
external ip ISP2 for server 10.0.0.2: 1.2.3.3

arp -s 1.2.3.3 aa:bb:cc:dd:ee:ff pub
ip route add 1.2.3.3 via 10.0.0.2
iptables -t nat -A PREROUTING -i eth1 -d 1.2.3.3 -j DNAT --to 10.0.0.2

When pinging 1.2.3.3, the packets get in through eth1 (ok), but the
replies are following the default routing table through eth0 (wrong)

Even a

ip rule add from 1.2.3.3 lookup table_eth1

doesn't change this behaviour. It is working ok when I add the address
1.2.3.3 directly to eth1 (without NAT):

ip a a 1.2.3.3 dev eth1

Why is this?

R.


-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+

