From: "lartc@manchotnetworks.net" <lartc@manchotnetworks.net>
Subject: PREROUTING with ULOG in what order: conn, mangle, imq, nat
Date: 15 Jul 2003 17:11:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058281866.21853.66.camel@drs0.manchotnetworks.net>
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
To: netfilter <netfilter@lists.netfilter.org>

Hello All, 

I used SNAT to change the source address of a packet as it traverses a
linux router, ingress on eth0, and egress on eth1. simple enough and it
works. 

+------------+     +-------------------------------------------+
| 172.16.3.1 | --- | eth0:172.16.3.254 --- eth1:  192.168.1.1  | 
|            |     |                       eth1:1 192.168.1.99 |--+
+------------+     +-------------------------------------------+  |
                                                                  |
                                                                  |
                                                           +------+
                                                           |
                                                   +--------------+
                                                   | 192.168.1.250|
	                                           +--------------+


iptables --append POSTROUTING --table nat --source 172.16.3.0/24 \ 
    --jump SNAT --to-source 192.168.1.99 

iptables --append POSTROUTING --table mangle \ 
    --out-interface eth1 --jump ULOG 

iptables --append PREROUTING --table mangle \ 
    --in-interface eth1 --jump ULOG 


ulog is watching all incoming and outgoing packets on eth1

both tcpdump & ulog show packets on eth1 egress with src ip of
192,168.1.99 -- perfect.

ulog shows ingress packets on eth1 with dst address 172.16.3.1--correct
address after de-natting

tcpdump show ingress packets on eth1 with dst address
192.168.1.99--address defore denatting.

where does de-natting occur?

i thought it was: 

WIRE -- > PREROUTING [ conntrack --> mangle --> imq --> nat ] ...

if i am capturing at mangle, should not the snat address be there?

Many Many Many Thanks!!

Charles





