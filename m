From: Esteban <esteban@alstec.fr>
Subject: prio qdisc problem
Date: Thu, 13 Feb 2003 14:14:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030213141428.375696bc.esteban@alstec.fr>
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

Hello there,
I wan't to manage my bandwidth using both cbq and prio qdisc.
When I use cbq qdisc alone, everything's OK.
But when I create a prio qdisc on a branch of cbq qdisc, stange things
happens. All the traffic which should be in my prio qdisc do not seem to
be limited and then take all the bandwidth (all the interface bandwidth
 (100mbit)).

I would appriciate if anyone could advice me.
Here is the script I use:


#!/bin/sh -vx

OPTIONS="bandwidth 10mbit allot 1514 maxburst 20 prio 3 avpkt 1000"
IPTABLES="/usr/local/bin/iptables.static"
INTERNAL=eth0
EXTERNAL=eth1

tc qdisc del dev eth0 root 2>/dev/null
tc qdisc add dev eth0 root handle 10: cbq bandwidth 10mbit avpkt 1000

tc class add dev eth0 parent 10: classid  10:1 cbq rate 1024kbit bounded $OPTIONS 
tc class add dev eth0 parent 10:1 classid 10:11 cbq rate 512kbit $OPTIONS bounded
tc class add dev eth0 parent 10:1 classid 10:12 cbq rate 512kbit $OPTIONS

tc qdisc add dev eth0 parent 10:12 handle 100: prio




tc filter add dev eth0 parent 10: protocol ip prio 100 u32 \
match ip dport 111 0xffff \
flowid 10:11

tc filter add dev eth0 parent 10: protocol ip prio 100 u32 \
match ip src 0.0.0.0/32 \
flowid 10:12

tc filter add dev eth0 parent 100: protocol ip prio 100 u32 \
match ip protocol 0x01 0xff \
flowid 100:1
tc filter add dev eth0 parent 100: protocol ip prio 100 u32 \
match ip dport 222 0xffff \
flowid 100:2
tc filter add dev eth0 parent 100: protocol ip prio 100 u32 \
match ip src 0.0.0.0/0 \
flowid 100:3       # this one match the rest of the traffic



THX

-- 
Esteban
Stephane DESMET
esteban@epita.fr


